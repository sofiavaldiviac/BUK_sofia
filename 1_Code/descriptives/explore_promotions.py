# ==============================================================================
# Explore Promotion Signals — task_issue2_03 (Phase 1: Diagnostics)
# ==============================================================================
# Explores what signals are available in shared_adm_job for defining
# "promotion" events. Checks coverage and overlap of:
#   - salary increase (theoretical_liquid_salary)
#   - role_id change
#   - role_name change
#   - role_name_category change
#   - area_name_category change
#   - boss_id change
#   - is_boss (from employee table)
#
# Output: promotion_diagnostics.txt in 1_Code/data/intermediate/
# ==============================================================================

import pandas as pd
import numpy as np
import os
import gc

DATA_DIR = "/Users/sofiavaldivia/Dropbox/BUK/data/buk_data"
OUT_DIR = os.path.join(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    "data", "intermediate"
)
os.makedirs(OUT_DIR, exist_ok=True)

diag_lines = []


def diag(msg):
    print(msg)
    diag_lines.append(msg)


# ==============================================================================
# STEP 0 — Load data
# ==============================================================================
diag("=" * 70)
diag("Loading shared_adm_job.csv...")
diag("=" * 70)

job = pd.read_csv(
    os.path.join(DATA_DIR, "shared_adm_job.csv"),
    usecols=["job_id", "employee_id", "tenant_id", "country",
             "start_date", "end_date", "theoretical_liquid_salary",
             "role_id", "role_name", "role_name_category",
             "area_name_category", "boss_id", "is_last_job"],
    low_memory=False,
)
diag(f"  Loaded: {len(job):,} rows")
job = job[job["country"] == "Chile"].copy()
diag(f"  Chile: {len(job):,} rows")
del job["country"]

job["start_date"] = pd.to_datetime(job["start_date"], errors="coerce")
job["end_date"] = pd.to_datetime(job["end_date"], errors="coerce")

# Field coverage in raw job data
diag(f"\n--- Field coverage (all Chile jobs) ---")
for col in ["theoretical_liquid_salary", "role_id", "role_name",
            "role_name_category", "area_name_category", "boss_id"]:
    n = job[col].notna().sum()
    diag(f"  {col:30s}: {n:>10,} ({n/len(job)*100:5.1f}%)")

# Load employee for gender + is_boss
diag("\nLoading shared_core_employee.csv...")
emp = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_employee.csv"),
    usecols=["employee_id", "gender", "tenant_id", "is_boss"],
)
diag(f"  Loaded: {len(emp):,} rows")

# is_boss coverage
n_boss = emp["is_boss"].notna().sum()
diag(f"  is_boss populated: {n_boss:,} ({n_boss/len(emp)*100:.1f}%)")
diag(f"  is_boss==True: {(emp['is_boss']==True).sum():,}")
diag(f"  is_boss==False: {(emp['is_boss']==False).sum():,}")

# ==============================================================================
# STEP 1 — Build consecutive job transitions within same tenant
# ==============================================================================
diag(f"\n{'='*70}")
diag("STEP 1: Building consecutive job transitions (same tenant)")
diag("=" * 70)

# Sort by employee, tenant, start_date
job = job.sort_values(["employee_id", "tenant_id", "start_date"])

# Shift to get previous job within same employee
job["prev_tenant"] = job.groupby("employee_id")["tenant_id"].shift(1)
job["prev_salary"] = job.groupby("employee_id")["theoretical_liquid_salary"].shift(1)
job["prev_role_id"] = job.groupby("employee_id")["role_id"].shift(1)
job["prev_role_name"] = job.groupby("employee_id")["role_name"].shift(1)
job["prev_role_cat"] = job.groupby("employee_id")["role_name_category"].shift(1)
job["prev_area_cat"] = job.groupby("employee_id")["area_name_category"].shift(1)
job["prev_boss_id"] = job.groupby("employee_id")["boss_id"].shift(1)
job["prev_start"] = job.groupby("employee_id")["start_date"].shift(1)

# Keep only transitions within same tenant (internal moves)
trans = job[job["tenant_id"] == job["prev_tenant"]].copy()
diag(f"  Total job rows (Chile): {len(job):,}")
diag(f"  Internal transitions (same tenant): {len(trans):,}")

# How many are cross-tenant?
cross = job[job["prev_tenant"].notna() & (job["tenant_id"] != job["prev_tenant"])]
diag(f"  Cross-tenant transitions: {len(cross):,}")

del job, cross
gc.collect()

# ==============================================================================
# STEP 2 — Compute transition signals
# ==============================================================================
diag(f"\n{'='*70}")
diag("STEP 2: Computing transition signals")
diag("=" * 70)

# Salary change
trans["salary_change_pct"] = np.where(
    (trans["prev_salary"].notna()) & (trans["prev_salary"] > 0),
    (trans["theoretical_liquid_salary"] - trans["prev_salary"]) / trans["prev_salary"] * 100,
    np.nan,
)

# Change flags
trans["salary_inc_1pct"] = trans["salary_change_pct"] > 1
trans["salary_inc_5pct"] = trans["salary_change_pct"] > 5
trans["salary_inc_10pct"] = trans["salary_change_pct"] > 10
trans["salary_decreased"] = trans["salary_change_pct"] < -1

trans["role_id_changed"] = (
    trans["role_id"].notna() & trans["prev_role_id"].notna()
    & (trans["role_id"] != trans["prev_role_id"])
)
trans["role_name_changed"] = (
    trans["role_name"].notna() & trans["prev_role_name"].notna()
    & (trans["role_name"] != trans["prev_role_name"])
)
trans["role_cat_changed"] = (
    trans["role_name_category"].notna() & trans["prev_role_cat"].notna()
    & (trans["role_name_category"] != trans["prev_role_cat"])
)
trans["area_cat_changed"] = (
    trans["area_name_category"].notna() & trans["prev_area_cat"].notna()
    & (trans["area_name_category"] != trans["prev_area_cat"])
)
trans["boss_changed"] = (
    trans["boss_id"].notna() & trans["prev_boss_id"].notna()
    & (trans["boss_id"] != trans["prev_boss_id"])
)

# Coverage and firing rates
diag(f"\n--- Signal coverage (among {len(trans):,} internal transitions) ---")
signals = {
    "salary_inc_1pct": ("Salary increase >1%", "salary_change_pct"),
    "salary_inc_5pct": ("Salary increase >5%", "salary_change_pct"),
    "salary_inc_10pct": ("Salary increase >10%", "salary_change_pct"),
    "salary_decreased": ("Salary decrease >1%", "salary_change_pct"),
    "role_id_changed": ("Role ID changed", "role_id"),
    "role_name_changed": ("Role name changed", "role_name"),
    "role_cat_changed": ("Role category changed", "role_name_category"),
    "area_cat_changed": ("Area category changed", "area_name_category"),
    "boss_changed": ("Boss ID changed", "boss_id"),
}

for flag, (label, coverage_col) in signals.items():
    if coverage_col == "salary_change_pct":
        n_valid = trans["salary_change_pct"].notna().sum()
    else:
        n_valid = (trans[coverage_col].notna() & trans[f"prev_{coverage_col}" if f"prev_{coverage_col}" in trans.columns else coverage_col].notna()).sum()

    n_fired = trans[flag].sum()
    pct_of_valid = n_fired / n_valid * 100 if n_valid > 0 else 0
    pct_of_all = n_fired / len(trans) * 100
    diag(f"  {label:30s}: {n_fired:>10,} fires "
         f"({pct_of_all:5.1f}% of all, {pct_of_valid:5.1f}% of valid)")

# Salary change summary stats
diag(f"\n--- Salary change at internal transitions ---")
sal_valid = trans["salary_change_pct"].dropna()
diag(f"  N with valid salary change: {len(sal_valid):,}")
for p, v in sal_valid.describe().items():
    diag(f"    {p:>5s}: {v:,.1f}%")

# ==============================================================================
# STEP 3 — Overlap matrix
# ==============================================================================
diag(f"\n{'='*70}")
diag("STEP 3: Signal overlap matrix")
diag("=" * 70)

flag_cols = ["salary_inc_5pct", "role_id_changed", "role_name_changed",
             "role_cat_changed", "area_cat_changed", "boss_changed"]
flag_labels = ["Sal>5%", "RoleID", "RoleName", "RoleCat", "AreaCat", "BossID"]

diag(f"\n  Co-occurrence (% of row signal that also has column signal):")
header = f"  {'':12s}" + "".join(f"{l:>10s}" for l in flag_labels)
diag(header)
for i, (fc, fl) in enumerate(zip(flag_cols, flag_labels)):
    row_n = trans[fc].sum()
    if row_n == 0:
        diag(f"  {fl:12s}" + "".join(f"{'n/a':>10s}" for _ in flag_cols))
        continue
    cells = []
    for j, fc2 in enumerate(flag_cols):
        overlap = (trans[fc] & trans[fc2]).sum()
        cells.append(f"{overlap/row_n*100:9.1f}%")
    diag(f"  {fl:12s}" + "".join(cells))

# ==============================================================================
# STEP 4 — Candidate promotion definitions
# ==============================================================================
diag(f"\n{'='*70}")
diag("STEP 4: Candidate promotion definitions")
diag("=" * 70)

# Merge gender
emp_gender = emp[["employee_id", "tenant_id", "gender"]].drop_duplicates(
    subset=["employee_id", "tenant_id"]
)
trans = trans.merge(emp_gender, on=["employee_id", "tenant_id"], how="left")

# Compute employee-years for rate calculation
trans["year"] = trans["start_date"].dt.year
n_emp_years = trans.groupby("year")["employee_id"].nunique().sum()
diag(f"  Total employee-years in transitions: {n_emp_years:,}")

definitions = {
    "A: Salary >5%": trans["salary_inc_5pct"],
    "B: Role ID change": trans["role_id_changed"],
    "C: Role ID + Sal>5%": trans["role_id_changed"] & trans["salary_inc_5pct"],
    "D: Role category change": trans["role_cat_changed"],
    "E: Area category change": trans["area_cat_changed"],
    "F: Boss change + Sal>5%": trans["boss_changed"] & trans["salary_inc_5pct"],
    "G: Role ID + Sal>1%": trans["role_id_changed"] & trans["salary_inc_1pct"],
    "H: Any of B,D,E + Sal>1%": (trans["role_id_changed"] | trans["role_cat_changed"] | trans["area_cat_changed"]) & trans["salary_inc_1pct"],
}

for def_name, mask in definitions.items():
    n = mask.sum()
    rate = n / n_emp_years * 100 if n_emp_years > 0 else 0

    sub = trans[mask]
    n_f = (sub["gender"] == "F").sum()
    n_m = (sub["gender"] == "M").sum()
    rate_f = "n/a"
    rate_m = "n/a"
    if len(sub) > 0:
        # Gender-specific rates
        f_emp_years = trans[trans["gender"] == "F"].groupby("year")["employee_id"].nunique().sum()
        m_emp_years = trans[trans["gender"] == "M"].groupby("year")["employee_id"].nunique().sum()
        if f_emp_years > 0:
            rate_f = f"{n_f / f_emp_years * 100:.2f}%"
        if m_emp_years > 0:
            rate_m = f"{n_m / m_emp_years * 100:.2f}%"

    diag(f"\n  {def_name}:")
    diag(f"    N events: {n:,}")
    diag(f"    Rate per emp-year: {rate:.2f}%")
    diag(f"    Female: {n_f:,} (rate {rate_f})")
    diag(f"    Male:   {n_m:,} (rate {rate_m})")

    # Median salary change for this definition
    if n > 0:
        med_sal = sub["salary_change_pct"].median()
        diag(f"    Median salary change: {med_sal:.1f}%")

# ==============================================================================
# STEP 5 — is_boss exploration
# ==============================================================================
diag(f"\n{'='*70}")
diag("STEP 5: is_boss exploration")
diag("=" * 70)

# Check if is_boss varies within employee
boss_var = emp.groupby("employee_id")["is_boss"].nunique()
diag(f"  Employees with is_boss data: {(boss_var > 0).sum():,}")
diag(f"  Employees with is_boss variation (>1 unique): {(boss_var > 1).sum():,}")
diag(f"  (If 0, is_boss is fully static — no temporal variation)")

# is_boss by gender
boss_gender = emp[emp["is_boss"].notna()].groupby("gender")["is_boss"].mean()
diag(f"\n  is_boss rate by gender:")
for g, rate in boss_gender.items():
    diag(f"    {g}: {rate*100:.1f}%")

# ==============================================================================
# Save diagnostics
# ==============================================================================
diag_path = os.path.join(OUT_DIR, "promotion_diagnostics.txt")
with open(diag_path, "w") as f:
    f.write("\n".join(diag_lines))
diag(f"\nSaved: {diag_path}")
print("\nDone.")
