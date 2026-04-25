# ==============================================================================
# Compute HHI (Labor Market Concentration) — task_issue2_02
# ==============================================================================
# Computes two HHI measures for Chilean labor markets:
#   1. Employment-based HHI (occupation x region, year-end snapshot)
#   2. Vacancy-based HHI (functional area x region, vacancy counts)
#
# Market cell: occupation (role_name_category / category_area) x region
# Firm identifier: tenant_id
# Scale: 0–10,000 (DOJ/FTC convention)
#
# Outputs saved to 1_Code/data/intermediate/:
#   hhi_employment.parquet
#   hhi_vacancy.parquet
#   hhi_diagnostics.txt
# ==============================================================================

import pandas as pd
import numpy as np
import os
import gc

# ==============================================================================
# SECTION 0 — Configuration
# ==============================================================================

DATA_DIR = "/Users/sofiavaldivia/Dropbox/BUK/data/buk_data"
OUT_DIR = os.path.join(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    "data", "intermediate"
)
os.makedirs(OUT_DIR, exist_ok=True)

# English translations for functional area (handles accented + unaccented)
AREA_EN = {
    "Departamento médico o de salud": "Medical / Health",
    "Departamento medico o de salud": "Medical / Health",
    "Educación o academia": "Education / Academia",
    "Educacion o academia": "Education / Academia",
    "Finanzas y administración": "Finance & Administration",
    "Finanzas y administracion": "Finance & Administration",
    "Marketing y ventas": "Marketing & Sales",
    "Operaciones": "Operations",
    "Recursos humanos": "Human Resources",
    "Servicio al cliente": "Customer Service",
    "Tecnologías de la información": "IT",
    "Tecnologias de la informacion": "IT",
}

diag_lines = []  # collect diagnostics text


def diag(msg):
    """Print and record a diagnostics line."""
    print(msg)
    diag_lines.append(msg)


def compute_hhi(df, group_cols, firm_col, count_col):
    """Compute HHI per market cell.

    Parameters
    ----------
    df : DataFrame with one row per (firm x cell) and a count column
    group_cols : list of columns defining the market cell
    firm_col : column identifying the firm (tenant_id)
    count_col : column with the count (workers or vacancies)

    Returns
    -------
    DataFrame with group_cols + [hhi, n_firms, n_units]
    """
    total = df.groupby(group_cols)[count_col].transform("sum")
    df = df.copy()
    df["_share"] = df[count_col] / total
    df["_share_sq"] = df["_share"] ** 2

    hhi = df.groupby(group_cols).agg(
        hhi=("_share_sq", lambda x: x.sum() * 10_000),
        n_firms=(firm_col, "nunique"),
        n_units=(count_col, "sum"),
    ).reset_index()
    return hhi


def assign_terciles(hhi_df, weight_col="n_units"):
    """Assign employment-weighted HHI terciles (pooled across years)."""
    df = hhi_df.sort_values("hhi").copy()
    cum = df[weight_col].cumsum() / df[weight_col].sum()
    df["hhi_tercile"] = np.where(
        cum <= 1 / 3, "Low",
        np.where(cum <= 2 / 3, "Medium", "High")
    )
    return df


def print_hhi_distribution(hhi_df, label, weight_col="n_units"):
    """Print summary stats for an HHI distribution."""
    diag(f"\n{'='*60}")
    diag(f"HHI Distribution — {label}")
    diag(f"{'='*60}")
    diag(f"  N cells:    {len(hhi_df):,}")
    diag(f"  N units:    {hhi_df[weight_col].sum():,.0f}")
    diag(f"  N firms:    {hhi_df['n_firms'].sum():,.0f}")
    diag(f"\n  Unweighted:")
    for p, v in hhi_df["hhi"].describe().items():
        diag(f"    {p:>5s}: {v:,.1f}")
    diag(f"\n  Employment-weighted:")
    wt = hhi_df[weight_col] / hhi_df[weight_col].sum()
    wmean = (hhi_df["hhi"] * wt).sum()
    diag(f"    mean:  {wmean:,.1f}")
    # weighted percentiles
    sorted_df = hhi_df.sort_values("hhi")
    cum_w = (sorted_df[weight_col].cumsum() / sorted_df[weight_col].sum()).values
    vals = sorted_df["hhi"].values
    for pct_label, pct in [("P25", 0.25), ("P50", 0.50), ("P75", 0.75)]:
        idx = np.searchsorted(cum_w, pct)
        idx = min(idx, len(vals) - 1)
        diag(f"    {pct_label}:   {vals[idx]:,.1f}")
    diag(f"\n  Cells by n_firms:")
    for label_nf, cond in [("1 firm", hhi_df["n_firms"] == 1),
                            ("2-5 firms", hhi_df["n_firms"].between(2, 5)),
                            ("6+ firms", hhi_df["n_firms"] >= 6)]:
        n = cond.sum()
        diag(f"    {label_nf}: {n:,} cells ({n/len(hhi_df)*100:.1f}%)")


# ==============================================================================
# SECTION 1 — Build tenant -> region mapping
# ==============================================================================
diag("=" * 60)
diag("SECTION 1: Building tenant -> region mapping")
diag("=" * 60)

comp = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_rsch_company.csv"),
    usecols=["tenant_id", "company_rut", "country", "region"],
)
comp = comp[comp["country"] == "Chile"].copy()
diag(f"  Company rows (Chile): {len(comp):,}")

# Dedup: one row per tenant_id, prefer non-null region
comp = comp.sort_values("region", na_position="last").drop_duplicates(
    subset=["tenant_id"], keep="first"
)
n_with_region = comp["region"].notna().sum()
diag(f"  Unique tenants: {len(comp):,}")
diag(f"  With region:    {n_with_region:,} ({n_with_region/len(comp)*100:.1f}%)")

# Fallback: SII region for tenants missing region
missing_region = comp[comp["region"].isna()]
if len(missing_region) > 0:
    diag(f"  Attempting SII fallback for {len(missing_region):,} tenants...")
    sii = pd.read_csv(
        os.path.join(DATA_DIR, "shared_core_sii.csv"),
        usecols=["company_rut", "region_sii", "comercial_year"],
    )
    sii = sii.dropna(subset=["region_sii"])
    sii = sii.sort_values("comercial_year", ascending=False).drop_duplicates(
        subset=["company_rut"], keep="first"
    )
    # merge on company_rut
    missing_ruts = missing_region[["tenant_id", "company_rut"]].dropna(
        subset=["company_rut"]
    )
    filled = missing_ruts.merge(
        sii[["company_rut", "region_sii"]], on="company_rut", how="inner"
    )
    if len(filled) > 0:
        fill_map = filled.set_index("tenant_id")["region_sii"]
        comp.loc[comp["tenant_id"].isin(fill_map.index), "region"] = (
            comp.loc[comp["tenant_id"].isin(fill_map.index), "tenant_id"].map(fill_map)
        )
        diag(f"  SII fallback filled: {len(filled):,} tenants")
    del sii, missing_ruts, filled
    gc.collect()

n_final = comp["region"].notna().sum()
diag(f"  Final region coverage: {n_final:,} / {len(comp):,} "
     f"({n_final/len(comp)*100:.1f}%)")

tenant_region = comp[["tenant_id", "region"]].dropna(subset=["region"]).copy()
diag(f"\n  Region breakdown:")
for reg, cnt in tenant_region["region"].value_counts().head(20).items():
    diag(f"    {reg}: {cnt:,} tenants")

del comp, missing_region
gc.collect()

# ==============================================================================
# SECTION 2 — Employment-based HHI
# ==============================================================================
diag(f"\n{'='*60}")
diag("SECTION 2: Employment-based HHI")
diag("=" * 60)

# 2a. Load adm_job
diag("  Loading shared_adm_job.csv (this may take a few minutes)...")
job = pd.read_csv(
    os.path.join(DATA_DIR, "shared_adm_job.csv"),
    usecols=["employee_id", "tenant_id", "country", "start_date", "end_date",
             "role_name_category", "category_area"],
    low_memory=False,
)
diag(f"  Loaded: {len(job):,} rows")
job = job[job["country"] == "Chile"].copy()
diag(f"  Chile filter: {len(job):,} rows")
del job["country"]
gc.collect()

job["start_date"] = pd.to_datetime(job["start_date"], errors="coerce")
job["end_date"] = pd.to_datetime(job["end_date"], errors="coerce")

# 2b. Occupation variable
occ_rnc = job["role_name_category"].notna().sum()
occ_ca = job["category_area"].notna().sum()
diag(f"\n  Occupation coverage:")
diag(f"    role_name_category: {occ_rnc:,} ({occ_rnc/len(job)*100:.1f}%)")
diag(f"    category_area:      {occ_ca:,} ({occ_ca/len(job)*100:.1f}%)")

# Use role_name_category as primary, fill from category_area
job["occupation"] = job["role_name_category"].fillna(job["category_area"])
occ_final = job["occupation"].notna().sum()
diag(f"    combined:           {occ_final:,} ({occ_final/len(job)*100:.1f}%)")

# Translate to English
job["occupation_en"] = job["occupation"].map(
    lambda x: AREA_EN.get(x, x) if pd.notna(x) else np.nan
)

# 2c. Year-end snapshots
diag("\n  Computing year-end snapshots...")
years = sorted(job["start_date"].dt.year.dropna().unique())
# Keep years where Dec 31 is plausible (data exists through that date)
years = [int(y) for y in years if y >= 2018 and y <= 2025]
diag(f"  Years: {years}")

snapshots = []
for yr in years:
    snap_date = pd.Timestamp(yr, 12, 31)
    active = job[
        (job["start_date"] <= snap_date)
        & ((job["end_date"].isna()) | (job["end_date"] >= snap_date))
    ].copy()
    # Dedup: one worker per firm
    active = active.drop_duplicates(subset=["employee_id", "tenant_id"])
    active["year"] = yr
    snapshots.append(active[["employee_id", "tenant_id", "occupation_en", "year"]])
    diag(f"    {yr}: {len(active):,} active employee-firm pairs")

snap = pd.concat(snapshots, ignore_index=True)
del snapshots, job
gc.collect()

# Drop missing occupation
snap = snap.dropna(subset=["occupation_en"])
diag(f"\n  After dropping null occupation: {len(snap):,} rows")

# 2d. Merge region
snap = snap.merge(tenant_region, on="tenant_id", how="inner")
diag(f"  After merging region: {len(snap):,} rows")

# 2e. Compute HHI
diag("\n  Computing employment-based HHI...")
emp_cell = snap.groupby(
    ["occupation_en", "region", "year", "tenant_id"]
).agg(n_workers=("employee_id", "nunique")).reset_index()

hhi_emp = compute_hhi(
    emp_cell,
    group_cols=["occupation_en", "region", "year"],
    firm_col="tenant_id",
    count_col="n_workers",
)

# 2f. Terciles
hhi_emp = assign_terciles(hhi_emp, weight_col="n_units")
hhi_emp = hhi_emp.rename(columns={"n_units": "n_workers"})

print_hhi_distribution(hhi_emp, "Employment-based", weight_col="n_workers")

# Tercile summary
diag(f"\n  Tercile cutoffs:")
for t in ["Low", "Medium", "High"]:
    sub = hhi_emp[hhi_emp["hhi_tercile"] == t]
    diag(f"    {t}: HHI {sub['hhi'].min():.0f}–{sub['hhi'].max():.0f}, "
         f"{len(sub):,} cells, {sub['n_workers'].sum():,.0f} workers")

# Save
hhi_emp.to_parquet(os.path.join(OUT_DIR, "hhi_employment.parquet"), index=False)
diag(f"\n  Saved: {os.path.join(OUT_DIR, 'hhi_employment.parquet')}")

del snap, emp_cell
gc.collect()

# ==============================================================================
# SECTION 3 — Vacancy-based HHI
# ==============================================================================
diag(f"\n{'='*60}")
diag("SECTION 3: Vacancy-based HHI")
diag("=" * 60)

# 3a. Load recruitment
recruit = pd.read_csv(
    os.path.join(DATA_DIR, "shared_recruitment.csv"),
    usecols=["selection_id", "tenant_id", "country", "category_area", "created_date"],
)
diag(f"  Loaded recruitment: {len(recruit):,} rows")
recruit = recruit[recruit["country"] == "Chile"].copy()
diag(f"  Chile filter: {len(recruit):,} rows")

recruit["created_date"] = pd.to_datetime(recruit["created_date"], errors="coerce")
recruit["year"] = recruit["created_date"].dt.year

# Translate area
recruit["category_area_en"] = recruit["category_area"].map(
    lambda x: AREA_EN.get(x, x) if pd.notna(x) else np.nan
)

occ_vac = recruit["category_area_en"].notna().sum()
diag(f"  With category_area: {occ_vac:,} ({occ_vac/len(recruit)*100:.1f}%)")

recruit = recruit.dropna(subset=["category_area_en", "year"])

# 3b. Merge region
recruit = recruit.merge(tenant_region, on="tenant_id", how="inner")
diag(f"  After merging region: {len(recruit):,} rows")

# 3c. Compute vacancy-based HHI
vac_cell = recruit.groupby(
    ["category_area_en", "region", "year", "tenant_id"]
).agg(n_vacancies=("selection_id", "nunique")).reset_index()

hhi_vac = compute_hhi(
    vac_cell,
    group_cols=["category_area_en", "region", "year"],
    firm_col="tenant_id",
    count_col="n_vacancies",
)

# 3d. Terciles
hhi_vac = assign_terciles(hhi_vac, weight_col="n_units")
hhi_vac = hhi_vac.rename(columns={"n_units": "n_vacancies"})

print_hhi_distribution(hhi_vac, "Vacancy-based", weight_col="n_vacancies")

diag(f"\n  Tercile cutoffs:")
for t in ["Low", "Medium", "High"]:
    sub = hhi_vac[hhi_vac["hhi_tercile"] == t]
    diag(f"    {t}: HHI {sub['hhi'].min():.0f}–{sub['hhi'].max():.0f}, "
         f"{len(sub):,} cells, {sub['n_vacancies'].sum():,.0f} vacancies")

hhi_vac.to_parquet(os.path.join(OUT_DIR, "hhi_vacancy.parquet"), index=False)
diag(f"\n  Saved: {os.path.join(OUT_DIR, 'hhi_vacancy.parquet')}")

del recruit, vac_cell
gc.collect()

# ==============================================================================
# SECTION 4 — Cross-validation & diagnostics
# ==============================================================================
diag(f"\n{'='*60}")
diag("SECTION 4: Cross-validation")
diag("=" * 60)

# Reload for cross-check
hhi_emp = pd.read_parquet(os.path.join(OUT_DIR, "hhi_employment.parquet"))
hhi_vac = pd.read_parquet(os.path.join(OUT_DIR, "hhi_vacancy.parquet"))

# Merge on common market cells (occupation names should match)
merged = hhi_emp.merge(
    hhi_vac,
    left_on=["occupation_en", "region", "year"],
    right_on=["category_area_en", "region", "year"],
    how="inner",
    suffixes=("_emp", "_vac"),
)
diag(f"  Cells in both measures: {len(merged):,}")

if len(merged) > 5:
    corr = merged["hhi_emp"].corr(merged["hhi_vac"])
    diag(f"  Correlation (emp vs vac HHI): {corr:.3f}")
else:
    diag("  Too few overlapping cells for correlation.")

# Sanity: Santiago vs rest
diag(f"\n  Sanity check — Santiago vs rest:")
for label, df, wt_col in [("Employment", hhi_emp, "n_workers"),
                           ("Vacancy", hhi_vac, "n_vacancies")]:
    metro = df[df["region"].str.contains("Metropolitana", case=False, na=False)]
    other = df[~df["region"].str.contains("Metropolitana", case=False, na=False)]
    if len(metro) > 0 and len(other) > 0:
        wm_metro = np.average(metro["hhi"], weights=metro[wt_col])
        wm_other = np.average(other["hhi"], weights=other[wt_col])
        diag(f"  {label}: Santiago={wm_metro:.0f}, Rest={wm_other:.0f}")

# Save diagnostics
diag_path = os.path.join(OUT_DIR, "hhi_diagnostics.txt")
with open(diag_path, "w") as f:
    f.write("\n".join(diag_lines))
diag(f"\n  Diagnostics saved: {diag_path}")

print("\nDone.")
