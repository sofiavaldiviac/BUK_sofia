# ==============================================================================
# Reduced-Form Admin Evidence — Issue #2 Descriptive Plots (Recruitment)
# ==============================================================================
# Plots for the paper's reduced-form evidence using BUK recruitment admin data.
# Data loaded from local CSVs (Dropbox cache).
#
# Covers:
#   Plot 2.1  (task issue2_11) — Distribution of applicants per vacancy
#   Plot 2.2  (task issue2_12) — Applicants per vacancy by functional area
#   Plot 2.3  (task issue2_13) — Gender composition of applicant pools
#   Plot 1.2  (task issue2_05) — Job spell duration distribution by gender
#   Plot 1.2b (task issue2_05b) — Job transitions with salary increase by gender
#   Plot 1.2c (task issue2_05c) — Salary change magnitude at transitions by gender
#   Plot 1.3  (task issue2_06) — Separation rates by gender and exit reason
#   Plot 3.3  (task issue2_18) — Referral source composition by candidate gender
#   Plot 3.5  (task issue2_20) — Salary range in vacancies by functional area
#   Plot 4.5  (task issue2_25) — Share of women in supervisory roles over time
#   Plot 6.3  (task issue2_35) — Gender composition by firm size & sector
# ==============================================================================

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import os
import gc

# --- Paths --------------------------------------------------------------------
FIG_DIR = "/Users/sofiavaldivia/Documents/GitHub/Chile_BUK_CNS/BUK_sofia/1_Code/figures"
DATA_DIR = "/Users/sofiavaldivia/Dropbox/BUK/data/buk_data"
os.makedirs(FIG_DIR, exist_ok=True)

# ==============================================================================
# 1. DATA LOADING
# ==============================================================================

print("Loading recruitment tables from CSV...")
recruit   = pd.read_csv(os.path.join(DATA_DIR, "shared_recruitment.csv"))
candidate = pd.read_csv(os.path.join(DATA_DIR, "shared_candidate.csv"))
app       = pd.read_csv(os.path.join(DATA_DIR, "shared_application.csv"))

print(f"  recruit:   {len(recruit):,} rows")
print(f"  candidate: {len(candidate):,} rows")
print(f"  app:       {len(app):,} rows")

# --- Filter datasets ----------------------------------------------------------
recruit_all   = recruit.copy()
candidate_all = candidate.copy()
app_all       = app.copy()

recruit_cl   = recruit[recruit["country"] == "Chile"].copy()
candidate_cl = candidate[candidate["country"] == "Chile"].copy()
app_cl       = app[app["country"] == "Chile"].copy()

print(f"\n--- Sample sizes ---")
print(f"recruit:   {len(recruit_cl):,} Chile / {len(recruit_all):,} all")
print(f"candidate: {len(candidate_cl):,} Chile / {len(candidate_all):,} all")
print(f"app:       {len(app_cl):,} Chile / {len(app_all):,} all")

# Define plot sets (Chile + all countries)
plot_sets = [
    {"recruit": recruit_cl, "candidate": candidate_cl, "app": app_cl,
     "label": "Chile subsample", "pfx": "rf"},
    {"recruit": recruit_all, "candidate": candidate_all, "app": app_all,
     "label": "all countries", "pfx": "rf_all"},
]

del recruit, candidate, app
gc.collect()

# ==============================================================================
# 2. THEME & HELPERS
# ==============================================================================

# Academic blue palette (matching reducedform_survey.R)
PAL_FEMALE = "#1B4F72"
PAL_MALE   = "#85C1E9"
PAL_SINGLE = "#2E86C1"

plt.rcParams.update({
    "font.family": "sans-serif",
    "font.size": 13,
    "axes.titlesize": 14,
    "axes.titleweight": "bold",
    "axes.labelsize": 13,
    "figure.facecolor": "white",
    "savefig.facecolor": "white",
    "savefig.dpi": 300,
    "savefig.bbox": "tight",
    "axes.grid": True,
    "grid.alpha": 0.3,
})

# --- English translations for category_area ----------------------------------
AREA_EN = {
    "Departamento médico o de salud": "Medical / Health",
    "Educación o academia": "Education / Academia",
    "Finanzas y administración": "Finance & Administration",
    "Marketing y ventas": "Marketing & Sales",
    "Operaciones": "Operations",
    "Recursos humanos": "Human Resources",
    "Servicio al cliente": "Customer Service",
    "Tecnologías de la información": "IT",
}

def translate_area(series):
    return series.map(lambda x: AREA_EN.get(x, x))

def save_plot(fig, name):
    path = os.path.join(FIG_DIR, f"{name}.png")
    fig.savefig(path)
    plt.close(fig)
    print(f"  Saved: {path}")


# ==============================================================================
# PLOT 2.1 — Distribution of Applicants per Vacancy (Task issue2_11)
# ==============================================================================
print("\n--- Plot 2.1: Distribution of Applicants per Vacancy ---")

for ps in plot_sets:
    apps_per_vacancy = (
        ps["app"]
        .groupby("selection_id")["application_id"]
        .nunique()
        .reset_index()
        .rename(columns={"application_id": "n_applicants"})
    )

    n_vacancies = len(apps_per_vacancy)
    med  = apps_per_vacancy["n_applicants"].median()
    mean = apps_per_vacancy["n_applicants"].mean()
    p10  = apps_per_vacancy["n_applicants"].quantile(0.10)
    p90  = apps_per_vacancy["n_applicants"].quantile(0.90)

    # Cap at 100 applicants for readable linear histogram
    cap = 100
    plot_data = apps_per_vacancy[apps_per_vacancy["n_applicants"] <= cap]
    n_excluded = n_vacancies - len(plot_data)
    pct_excluded = n_excluded / n_vacancies * 100

    print(f"  [{ps['label']}] N vacancies: {n_vacancies:,}")
    print(f"    median={med:.0f}, mean={mean:.1f}, P10={p10:.0f}, P90={p90:.0f}")
    print(f"    excluded (>{cap}): {n_excluded:,} ({pct_excluded:.1f}%)")

    fig, ax = plt.subplots(figsize=(8, 5))

    ax.hist(plot_data["n_applicants"], bins=40, color=PAL_SINGLE,
            edgecolor="white", alpha=0.85)

    # Reference lines
    ax.axvline(med, color="#E74C3C", linestyle="--", linewidth=1.5,
               label=f"Median = {med:.0f}")
    ax.axvline(mean, color="#F39C12", linestyle="--", linewidth=1.5,
               label=f"Mean = {mean:.1f}")

    ax.set_xlabel("Number of applicants per vacancy")
    ax.set_ylabel("Number of vacancies")

    # Title + subtitle (matching R style)
    ax.set_title("Distribution of Applicants per Vacancy", pad=25)
    fig.text(0.5, 0.885, f"Vacancies with \u2264{cap} applicants",
             fontsize=11, color="#666666", ha="center")

    ax.legend(fontsize=10, loc="upper right", framealpha=0.9)

    fig.text(0.01, -0.04,
             f"Source: BUK recruitment data ({ps['label']}, "
             f"N = {n_vacancies:,} vacancies). P10 = {p10:.0f}, P90 = {p90:.0f}.\n"
             f"Note: {n_excluded:,} vacancies ({pct_excluded:.1f}%) with >{cap} "
             f"applicants not shown.",
             fontsize=9, color="#999999", ha="left")

    fig.tight_layout()
    save_plot(fig, f"{ps['pfx']}_2_1_applicants_per_vacancy")


# ==============================================================================
# PLOT 2.2 — Applicants per Vacancy by Functional Area (Task issue2_12)
# ==============================================================================
print("\n--- Plot 2.2: Applicants per Vacancy by Functional Area ---")

for ps in plot_sets:
    apps_per_vacancy = (
        ps["app"]
        .groupby("selection_id")["application_id"]
        .nunique()
        .reset_index()
        .rename(columns={"application_id": "n_applicants"})
    )

    apps_with_area = apps_per_vacancy.merge(
        ps["recruit"][["selection_id", "category_area"]].drop_duplicates("selection_id"),
        on="selection_id", how="left"
    )
    apps_with_area = apps_with_area.dropna(subset=["category_area"])
    apps_with_area["category_area"] = translate_area(apps_with_area["category_area"])

    area_stats = (
        apps_with_area
        .groupby("category_area")
        .agg(
            median_apps=("n_applicants", "median"),
            mean_apps=("n_applicants", "mean"),
            n_vacancies=("n_applicants", "count")
        )
        .reset_index()
        .sort_values("median_apps", ascending=True)
    )

    n_total = area_stats["n_vacancies"].sum()
    print(f"  [{ps['label']}] N vacancies with area: {n_total:,}, "
          f"{area_stats['category_area'].nunique()} areas")

    fig, ax = plt.subplots(figsize=(9, max(5, len(area_stats) * 0.5)))

    ax.barh(area_stats["category_area"], area_stats["median_apps"],
            color=PAL_SINGLE, edgecolor="white", height=0.7)

    for _, row in area_stats.iterrows():
        ax.text(row["median_apps"] + 0.3, row["category_area"],
                f'{row["median_apps"]:.0f}  (n = {row["n_vacancies"]:,})',
                va="center", fontsize=10)

    ax.set_xlabel("Median applicants per vacancy")
    ax.set_title("Applicants per Vacancy by Functional Area", pad=25)
    fig.text(0.5, 0.885, "Sorted by median number of applicants",
             fontsize=11, color="#666666", ha="center")
    ax.set_xlim(0, area_stats["median_apps"].max() * 1.35)

    fig.text(0.01, -0.02,
             f"Source: BUK recruitment data ({ps['label']}, "
             f"N = {n_total:,} vacancies).",
             fontsize=9, color="#999999", ha="left")

    fig.tight_layout()
    save_plot(fig, f"{ps['pfx']}_2_2_applicants_by_area")


# ==============================================================================
# PLOT 2.3 — Gender Composition of Applicant Pools (Task issue2_13)
# ==============================================================================
print("\n--- Plot 2.3: Gender Composition of Applicant Pools ---")

for ps in plot_sets:
    app_gender = ps["app"].merge(
        ps["candidate"][["candidate_id", "gender"]].drop_duplicates("candidate_id"),
        on="candidate_id", how="left"
    )

    gender_coverage = app_gender["gender"].notna().mean() * 100
    print(f"  [{ps['label']}] Gender coverage: {gender_coverage:.1f}%")

    app_gender = app_gender.dropna(subset=["gender"])

    app_gender = app_gender.merge(
        ps["recruit"][["selection_id", "category_area"]].drop_duplicates("selection_id"),
        on="selection_id", how="left"
    )
    app_gender = app_gender.dropna(subset=["category_area"])
    app_gender["category_area"] = translate_area(app_gender["category_area"])

    # Recode gender (candidate table uses F/M, with "None" as string)
    app_gender["gender"] = app_gender["gender"].replace({"None": np.nan, "": np.nan})
    gender_map = {"F": "Female", "M": "Male"}
    app_gender["gender_en"] = app_gender["gender"].map(gender_map)
    app_gender = app_gender.dropna(subset=["gender_en"])

    area_gender = (
        app_gender
        .groupby("category_area")
        .agg(
            n_apps=("application_id", "count"),
            n_female=("gender_en", lambda x: (x == "Female").sum())
        )
        .reset_index()
    )
    area_gender["pct_female"] = area_gender["n_female"] / area_gender["n_apps"] * 100
    area_gender = area_gender.sort_values("pct_female", ascending=True)

    n_total = area_gender["n_apps"].sum()
    print(f"  [{ps['label']}] N apps with gender+area: {n_total:,}")

    fig, ax = plt.subplots(figsize=(9, max(5, len(area_gender) * 0.5)))

    ax.barh(area_gender["category_area"], area_gender["pct_female"],
            color=PAL_FEMALE, edgecolor="white", height=0.7)

    for _, row in area_gender.iterrows():
        ax.text(row["pct_female"] + 0.5, row["category_area"],
                f'{row["pct_female"]:.0f}%  (n = {row["n_apps"]:,})',
                va="center", fontsize=10)

    ax.axvline(50, color="#E74C3C", linestyle="--", linewidth=1, alpha=0.5,
               label="50% parity")
    ax.set_xlabel("% female among applicants")
    ax.set_title("Gender Composition of Applicant Pools by Functional Area", pad=25)
    fig.text(0.5, 0.885, "Sorted by female share",
             fontsize=11, color="#666666", ha="center")
    ax.set_xlim(0, 100)
    ax.legend(fontsize=10, loc="lower right", framealpha=0.9)

    fig.text(0.01, -0.02,
             f"Source: BUK recruitment data ({ps['label']}, "
             f"N = {n_total:,} applications with gender).",
             fontsize=9, color="#999999", ha="left")

    fig.tight_layout()
    save_plot(fig, f"{ps['pfx']}_2_3_gender_applicant_pools")


# ==============================================================================
# PLOT 3.5 — Salary Range in Vacancies by Functional Area (Task issue2_20)
# ==============================================================================
# Uses min_salary and max_salary from recruitment table.
# Shows salary ranges offered by functional area.
print("\n--- Plot 3.5: Salary Range by Functional Area ---")

for ps in plot_sets:
    r = ps["recruit"].copy()
    r = r.dropna(subset=["min_salary", "max_salary", "category_area"])
    r = r[(r["min_salary"] > 0) & (r["max_salary"] > 0)]
    r["category_area"] = translate_area(r["category_area"])
    # Midpoint salary (average of min and max)
    r["mid_salary"] = (r["min_salary"] + r["max_salary"]) / 2
    # Filter out placeholder values (salary < 50,000 CLP ~ below any real job)
    r = r[r["mid_salary"] >= 50000]

    n_total = len(r)
    n_areas = r["category_area"].nunique()
    print(f"  [{ps['label']}] N vacancies with salary + area: {n_total:,}, "
          f"{n_areas} areas")

    # Order areas by median midpoint salary
    area_order = (
        r.groupby("category_area")["mid_salary"]
        .median()
        .sort_values(ascending=True)
        .index.tolist()
    )

    fig, ax = plt.subplots(figsize=(10, max(5, len(area_order) * 0.55)))

    # Box plot
    box_data = [r[r["category_area"] == area]["mid_salary"] / 1e6
                for area in area_order]
    bp = ax.boxplot(box_data, vert=False, patch_artist=True,
                    widths=0.6, showfliers=False,
                    medianprops=dict(color="#E74C3C", linewidth=2))

    for patch in bp["boxes"]:
        patch.set_facecolor(PAL_SINGLE)
        patch.set_alpha(0.7)
        patch.set_edgecolor("white")

    ax.set_yticklabels(area_order, fontsize=10)
    ax.set_xlabel("Salary (millions CLP)")

    # Add N per area
    for i, area in enumerate(area_order):
        n_area = len(r[r["category_area"] == area])
        med = r[r["category_area"] == area]["mid_salary"].median() / 1e6
        ax.text(med, i + 1.35, f"n={n_area:,}", fontsize=8, color="#666666",
                ha="center", va="bottom")

    ax.set_title("Salary Range in Vacancies by Functional Area", pad=25)
    fig.text(0.5, 0.885,
             "Midpoint of min-max salary range (outliers excluded from plot)",
             fontsize=11, color="#666666", ha="center")

    fig.text(0.01, -0.04,
             f"Source: BUK recruitment data ({ps['label']}, "
             f"N = {n_total:,} vacancies with salary range and functional area).\n"
             f"Salary = midpoint of (min_salary, max_salary). "
             f"Coverage: {n_total / len(ps['recruit']) * 100:.0f}% of vacancies.",
             fontsize=9, color="#999999", ha="left")

    fig.tight_layout()
    save_plot(fig, f"{ps['pfx']}_3_5_salary_range_by_area")


# ==============================================================================
# PLOT 3.5b — Female Applicant Share by Vacancy Salary Range
# ==============================================================================
# Shows whether higher-paying vacancies attract fewer female applicants.
print("\n--- Plot 3.5b: Female Applicant Share by Salary Range ---")

for ps in plot_sets:
    # Vacancies with salary
    r = ps["recruit"][["selection_id", "min_salary", "max_salary"]].copy()
    r = r.dropna(subset=["min_salary", "max_salary"])
    r = r[(r["min_salary"] > 0) & (r["max_salary"] > 0)]
    r["mid_salary"] = (r["min_salary"] + r["max_salary"]) / 2
    r = r[r["mid_salary"] >= 50000]

    # Merge applications → candidates → gender
    app_gender = ps["app"][["application_id", "selection_id", "candidate_id"]].merge(
        ps["candidate"][["candidate_id", "gender"]].drop_duplicates("candidate_id"),
        on="candidate_id", how="left"
    )
    app_gender = app_gender[app_gender["gender"].isin(["F", "M"])]

    # Merge with vacancy salary
    app_sal = app_gender.merge(r[["selection_id", "mid_salary"]], on="selection_id", how="inner")

    n_apps = len(app_sal)
    n_vacancies = app_sal["selection_id"].nunique()
    print(f"  [{ps['label']}] Applications with salary + gender: {n_apps:,} "
          f"across {n_vacancies:,} vacancies")

    # Salary bins
    sal_bins = [50000, 400000, 600000, 900000, 1500000, float("inf")]
    sal_labels = ["<400K", "400K\u2013600K", "600K\u2013900K", "900K\u20131.5M", ">1.5M"]
    app_sal["salary_bin"] = pd.cut(app_sal["mid_salary"], bins=sal_bins, labels=sal_labels)

    # Female share per salary bin
    bin_stats = (
        app_sal
        .groupby("salary_bin", observed=True)
        .agg(
            n_apps=("application_id", "count"),
            n_female=("gender", lambda x: (x == "F").sum())
        )
        .reset_index()
    )
    bin_stats["pct_female"] = bin_stats["n_female"] / bin_stats["n_apps"] * 100

    for _, row in bin_stats.iterrows():
        print(f"    {row['salary_bin']}: {row['pct_female']:.1f}% female "
              f"(N={row['n_apps']:,})")

    fig, ax = plt.subplots(figsize=(8, 5))

    x_pos = np.arange(len(bin_stats))
    ax.bar(x_pos, bin_stats["pct_female"], color=PAL_FEMALE,
           edgecolor="white", width=0.6)

    for j, row in bin_stats.iterrows():
        ax.text(x_pos[j], row["pct_female"] + 0.5,
                f"{row['pct_female']:.0f}%\n(n={row['n_apps']:,})",
                ha="center", va="bottom", fontsize=9)

    ax.axhline(50, color="#E74C3C", linestyle="--", linewidth=1, alpha=0.5,
               label="50% parity")
    ax.set_xticks(x_pos)
    ax.set_xticklabels(sal_labels)
    ax.set_xlabel("Vacancy salary range (CLP, midpoint)")
    ax.set_ylabel("% Female among applicants")
    ax.set_ylim(0, max(bin_stats["pct_female"].max() + 10, 55))

    ax.set_title("Female Applicant Share by Vacancy Salary Range", pad=25)
    overall_f = app_sal["gender"].eq("F").mean() * 100
    fig.text(0.5, 0.885,
             f"Overall female share: {overall_f:.1f}%",
             fontsize=11, color="#666666", ha="center")

    ax.legend(fontsize=10, loc="upper right", framealpha=0.9)

    fig.text(0.01, -0.04,
             f"Source: BUK recruitment data ({ps['label']}, "
             f"N = {n_apps:,} applications with gender across "
             f"{n_vacancies:,} vacancies with salary).\n"
             f"Salary = midpoint of (min_salary, max_salary). "
             f"Vacancies with midpoint < 50,000 CLP excluded.",
             fontsize=9, color="#999999", ha="left")

    fig.tight_layout()
    save_plot(fig, f"{ps['pfx']}_3_5b_female_share_by_salary")


# ==============================================================================
# PLOT 3.5c — Female Applicant Share by Salary Tercile Within Area
# ==============================================================================
# Holds functional area constant. Shows that the salary-female share gradient
# is NOT just cross-area composition — it holds within every area.
print("\n--- Plot 3.5c: Female Share by Salary Within Area ---")

for ps in plot_sets:
    r = ps["recruit"][["selection_id", "min_salary", "max_salary",
                        "category_area"]].copy()
    r = r.dropna(subset=["min_salary", "max_salary", "category_area"])
    r = r[(r["min_salary"] > 0) & (r["max_salary"] > 0)]
    r["mid_salary"] = (r["min_salary"] + r["max_salary"]) / 2
    r = r[r["mid_salary"] >= 50000]
    r["area_en"] = translate_area(r["category_area"])

    app_gender = ps["app"][["application_id", "selection_id", "candidate_id"]].merge(
        ps["candidate"][["candidate_id", "gender"]].drop_duplicates("candidate_id"),
        on="candidate_id", how="left"
    )
    app_gender = app_gender[app_gender["gender"].isin(["F", "M"])]
    app_sal = app_gender.merge(
        r[["selection_id", "mid_salary", "area_en"]], on="selection_id", how="inner"
    )

    print(f"  [{ps['label']}] Apps with salary+gender+area: {len(app_sal):,}")

    # Salary terciles within each area
    app_sal["sal_tercile"] = app_sal.groupby("area_en")["mid_salary"].transform(
        lambda x: pd.qcut(x, q=3, labels=["Low", "Mid", "High"], duplicates="drop")
    )
    app_sal = app_sal.dropna(subset=["sal_tercile"])

    stats_c = (
        app_sal
        .groupby(["area_en", "sal_tercile"], observed=True)
        .agg(n_apps=("application_id", "count"),
             n_female=("gender", lambda x: (x == "F").sum()))
        .reset_index()
    )
    stats_c["pct_female"] = stats_c["n_female"] / stats_c["n_apps"] * 100

    # Order areas by drop from Low to High
    areas = stats_c.groupby("area_en").apply(
        lambda g: g[g["sal_tercile"] == "High"]["pct_female"].values[0]
                  - g[g["sal_tercile"] == "Low"]["pct_female"].values[0]
        if len(g) == 3 else 0, include_groups=False
    ).sort_values().index.tolist()

    terciles = ["Low", "Mid", "High"]
    colors_t = {"Low": "#AED6F1", "Mid": "#5DADE2", "High": "#1B4F72"}

    fig, ax = plt.subplots(figsize=(10, max(6, len(areas) * 0.6)))

    y_pos = np.arange(len(areas))
    bar_height = 0.25

    for i, terc in enumerate(terciles):
        vals = []
        for area in areas:
            row = stats_c[(stats_c["area_en"] == area) & (stats_c["sal_tercile"] == terc)]
            vals.append(row["pct_female"].values[0] if len(row) > 0 else 0)
        ax.barh(y_pos + i * bar_height, vals, height=bar_height,
                color=colors_t[terc], edgecolor="white",
                label=f"{terc} salary tercile")
        for j, v in enumerate(vals):
            if v >= 1:
                ax.text(v + 0.3, y_pos[j] + i * bar_height,
                        f"{v:.0f}%", va="center", fontsize=8)

    ax.axvline(50, color="#E74C3C", linestyle="--", linewidth=1, alpha=0.5)
    ax.set_yticks(y_pos + bar_height)
    ax.set_yticklabels(areas, fontsize=10)
    ax.set_xlabel("% Female among applicants")
    ax.set_title("Female Applicant Share by Salary Tercile Within Functional Area",
                 pad=25)
    fig.text(0.5, 0.91,
             "Salary terciles computed within each area (Low / Mid / High)",
             fontsize=11, color="#666666", ha="center")

    ax.legend(fontsize=9, loc="lower right", framealpha=0.9)

    fig.text(0.01, -0.04,
             f"Source: BUK recruitment data ({ps['label']}, "
             f"N = {len(app_sal):,} applications with gender, salary, "
             f"and area).\nSalary = midpoint of (min_salary, max_salary). "
             f"Terciles computed within each functional area.",
             fontsize=9, color="#999999", ha="left")

    fig.tight_layout()
    save_plot(fig, f"{ps['pfx']}_3_5c_female_share_by_salary_within_area")


# ==============================================================================
# PLOT 6.3 — Gender Composition by Firm Size and Sector (Task issue2_35)
# ==============================================================================
# Uses cached CSVs. Different tables from plots above.
print("\n--- Plot 6.3: Gender Composition by Firm Size & Sector ---")

# --- Load only needed columns ------------------------------------------------
employee = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_employee.csv"),
    usecols=["employee_id", "gender", "tenant_id"]
)
print(f"  employee: {len(employee):,} rows")

company = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_rsch_company.csv"),
    usecols=["tenant_id", "company_rut", "country"]
)

workforce = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_rsch_workforce.csv"),
    usecols=["tenant_id", "company_size_sii", "country", "year_number"]
)

sii = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_sii.csv"),
    usecols=["company_rut", "sii_economic_sector", "comercial_year"]
)

# --- Deduplicate employees ---------------------------------------------------
employee = employee.drop_duplicates(subset=["employee_id"])
print(f"  unique employees: {len(employee):,}")

# --- Filter to Chile via company table ---------------------------------------
company_cl = company[company["country"] == "Chile"].copy()
# One tenant_id can appear multiple times in company; keep unique tenant mappings
tenant_rut = company_cl[["tenant_id", "company_rut"]].drop_duplicates(subset=["tenant_id"])

emp_cl = employee.merge(tenant_rut, on="tenant_id", how="inner")
print(f"  Chile employees: {len(emp_cl):,}")

# Drop rows without gender
emp_cl = emp_cl[emp_cl["gender"].isin(["F", "M"])].copy()
print(f"  with gender (F/M): {len(emp_cl):,}")

# --- Get firm size (latest year per tenant) ----------------------------------
wf_cl = workforce[workforce["country"] == "Chile"].copy()
wf_latest = (
    wf_cl
    .sort_values("year_number", ascending=False)
    .drop_duplicates(subset=["tenant_id"])
    [["tenant_id", "company_size_sii"]]
)

emp_cl = emp_cl.merge(wf_latest, on="tenant_id", how="left")
print(f"  with firm size: {emp_cl['company_size_sii'].notna().sum():,} / {len(emp_cl):,}")

# --- Get sector (latest SII year per company_rut) ----------------------------
sii_latest = (
    sii
    .sort_values("comercial_year", ascending=False)
    .drop_duplicates(subset=["company_rut"])
    [["company_rut", "sii_economic_sector"]]
)

emp_cl = emp_cl.merge(sii_latest, on="company_rut", how="left")
print(f"  with sector: {emp_cl['sii_economic_sector'].notna().sum():,} / {len(emp_cl):,}")

# --- Aggregate: top sectors + "Other" ----------------------------------------
sector_counts = (
    emp_cl[emp_cl["sii_economic_sector"].notna()]
    .groupby("sii_economic_sector")["employee_id"]
    .count()
    .sort_values(ascending=False)
)
top_sectors = sector_counts.head(15).index.tolist()

emp_cl["sector_clean"] = emp_cl["sii_economic_sector"].where(
    emp_cl["sii_economic_sector"].isin(top_sectors), other="Otros"
)

# --- Compute female share by size × sector -----------------------------------
# Drop rows missing size or sector
emp_plot = emp_cl.dropna(subset=["company_size_sii", "sector_clean"]).copy()

stats = (
    emp_plot
    .groupby(["company_size_sii", "sector_clean"])
    .agg(
        n_total=("employee_id", "count"),
        n_female=("gender", lambda x: (x == "F").sum())
    )
    .reset_index()
)
stats["pct_female"] = stats["n_female"] / stats["n_total"] * 100

# Overall check
overall_female = (emp_plot["gender"] == "F").mean() * 100
print(f"\n  Overall female share (Chile, with size+sector): {overall_female:.1f}%")

# --- Pivot for heatmap -------------------------------------------------------
size_order = ["Micro-pequeña empresa", "Mediana empresa", "Gran empresa"]
# Keep only sizes that exist in data
size_order = [s for s in size_order if s in stats["company_size_sii"].unique()]

# Order sectors by overall female share (descending)
sector_order = (
    stats
    .groupby("sector_clean")
    .apply(lambda g: g["n_female"].sum() / g["n_total"].sum() * 100,
           include_groups=False)
    .sort_values(ascending=True)
    .index.tolist()
)

pivot_pct = stats.pivot_table(
    index="sector_clean", columns="company_size_sii",
    values="pct_female", aggfunc="first"
).reindex(index=sector_order, columns=size_order)

pivot_n = stats.pivot_table(
    index="sector_clean", columns="company_size_sii",
    values="n_total", aggfunc="first"
).reindex(index=sector_order, columns=size_order)

# --- Shorten sector names for readability ------------------------------------
short_names = {
    "Comercio al por mayor y al por menor; reparación de vehículos automotores y motocicletas": "Wholesale & Retail",
    "Actividades profesionales, científicas y técnicas": "Professional/Scientific",
    "Actividades de servicios administrativos y de apoyo": "Administrative Services",
    "Industrias manufactureras": "Manufacturing",
    "Industria manufacturera": "Manufacturing",
    "Construcción": "Construction",
    "Información y comunicaciones": "ICT",
    "Transporte y almacenamiento": "Transportation",
    "Actividades financieras y de seguros": "Finance & Insurance",
    "Enseñanza": "Education",
    "Actividades de atención de la salud humana y de asistencia social": "Health & Social Work",
    "Actividades de alojamiento y de servicio de comidas": "Accommodation & Food",
    "Explotación de minas y canteras": "Mining",
    "Explotacion de minas y canteras": "Mining",
    "Suministro de electricidad, gas, vapor y aire acondicionado": "Electricity & Gas",
    "Agricultura, ganadería, silvicultura y pesca": "Agriculture",
    "Actividades inmobiliarias": "Real Estate",
    "Suministro de agua; evacuación de aguas residuales, gestión de desechos y descontaminación": "Water & Waste",
    "Otras actividades de servicios": "Other Services",
    "Administración pública y defensa; planes de seguridad social de afiliación obligatoria": "Public Administration",
    "Actividades artísticas, de entretenimiento y recreativas": "Arts & Entertainment",
    "Actividades de organizaciones y órganos extraterritoriales": "Extraterritorial Orgs.",
    "Otros": "Other",
}

pivot_pct.index = [short_names.get(s, s) for s in pivot_pct.index]
pivot_n.index = [short_names.get(s, s) for s in pivot_n.index]

# Shorten column names too
col_short = {
    "Micro-pequeña empresa": "Micro/Small",
    "Mediana empresa": "Medium",
    "Gran empresa": "Large",
}
pivot_pct.columns = [col_short.get(c, c) for c in pivot_pct.columns]
pivot_n.columns = [col_short.get(c, c) for c in pivot_n.columns]

# --- Plot heatmap ------------------------------------------------------------
import matplotlib.colors as mcolors

fig, ax = plt.subplots(figsize=(8, max(6, len(pivot_pct) * 0.45)))

# Diverging colormap centered at 50%
cmap = plt.cm.RdBu
norm = mcolors.TwoSlopeNorm(vmin=0, vcenter=50, vmax=100)

data = pivot_pct.values
im = ax.imshow(data, cmap=cmap, norm=norm, aspect="auto")

# Axes
ax.set_xticks(range(len(pivot_pct.columns)))
ax.set_xticklabels(pivot_pct.columns, fontsize=11, fontweight="bold")
ax.set_yticks(range(len(pivot_pct.index)))
ax.set_yticklabels(pivot_pct.index, fontsize=10)
ax.tick_params(top=True, bottom=False, labeltop=True, labelbottom=False)

# Annotate cells
for i in range(len(pivot_pct.index)):
    for j in range(len(pivot_pct.columns)):
        val = data[i, j]
        n = pivot_n.values[i, j]
        if np.isnan(val):
            continue
        text_color = "white" if val < 25 or val > 75 else "black"
        ax.text(j, i, f"{val:.0f}%",
                ha="center", va="center", fontsize=9,
                fontweight="bold", color=text_color)

# Colorbar
cbar = fig.colorbar(im, ax=ax, shrink=0.8, pad=0.02)
cbar.set_label("% Female", fontsize=11)

ax.set_title("Gender Composition by Firm Size and Sector",
             fontsize=14, fontweight="bold", pad=15)

n_total_plot = int(pivot_n.sum().sum()) if not pivot_n.isna().all().all() else 0
fig.text(0.01, -0.02,
         f"Source: BUK administrative records (Chile, N = {n_total_plot:,} workers "
         f"with gender, firm size, and SII sector). "
         f"Overall female share: {overall_female:.1f}%.",
         fontsize=9, color="grey", ha="left", wrap=True)

fig.tight_layout()
save_plot(fig, "rf_6_3_gender_composition")

# Free memory
del employee, company, workforce, sii, emp_cl, emp_plot, stats
gc.collect()


# ==============================================================================
# PLOT 1.2 — Job Spell Duration Distribution by Gender (Task issue2_05)
# ==============================================================================
# Each job_id is one spell. Duration = end_date - start_date.
# One employee can have multiple job_ids at the same employer (role changes,
# promotions). Each counts as a separate spell.
# Produces three sub-plots:
#   A) Completed spells histogram by gender
#   B) Kaplan-Meier survival curves by gender (handles censoring)
#   C) Number of distinct jobs per employee by gender (bonus)
print("\n--- Plot 1.2: Job Spell Duration by Gender ---")

# --- Load employee table (gender) -------------------------------------------
employee = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_employee.csv"),
    usecols=["employee_id", "gender", "tenant_id"]
)
company = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_rsch_company.csv"),
    usecols=["tenant_id", "country"]
)
tenant_cl = company[company["country"] == "Chile"][["tenant_id"]].drop_duplicates()

emp_cl = employee.merge(tenant_cl, on="tenant_id", how="inner")
emp_cl = emp_cl[emp_cl["gender"].isin(["F", "M"])].copy()
emp_cl = emp_cl.drop_duplicates(subset=["employee_id"])
emp_gender = emp_cl[["employee_id", "gender"]].copy()
emp_ids = set(emp_cl["employee_id"])
print(f"  Chile employees with gender: {len(emp_gender):,}")

del employee, company, tenant_cl, emp_cl
gc.collect()

# --- Load job table ----------------------------------------------------------
job = pd.read_csv(
    os.path.join(DATA_DIR, "shared_adm_job.csv"),
    usecols=["job_id", "employee_id", "country", "start_date", "end_date",
             "theoretical_liquid_salary", "exit_reason"]
)
job = job[(job["country"] == "Chile") & (job["employee_id"].isin(emp_ids))].copy()
del emp_ids
gc.collect()

job["start_date"] = pd.to_datetime(job["start_date"], errors="coerce")
job["end_date"] = pd.to_datetime(job["end_date"], errors="coerce")
job = job.dropna(subset=["start_date"])

# Merge gender
job = job.merge(emp_gender, on="employee_id", how="left")
job["gender_en"] = job["gender"].map({"F": "Female", "M": "Male"})

# Spell status and duration
PANEL_END = pd.Timestamp("2026-04-01")
DAYS_PER_MONTH = 30.44
job["completed"] = job["end_date"].notna()
job["duration_months"] = np.where(
    job["completed"],
    (job["end_date"] - job["start_date"]).dt.days / DAYS_PER_MONTH,
    (PANEL_END - job["start_date"]).dt.days / DAYS_PER_MONTH
)
# Drop negative or zero durations (data errors)
job = job[job["duration_months"] > 0].copy()

n_spells = len(job)
n_completed = job["completed"].sum()
n_censored = (~job["completed"]).sum()
print(f"  Total spells: {n_spells:,}")
print(f"  Completed: {n_completed:,} ({n_completed/n_spells*100:.1f}%)")
print(f"  Censored (ongoing): {n_censored:,} ({n_censored/n_spells*100:.1f}%)")

for g in ["Female", "Male"]:
    sub = job[job["gender_en"] == g]["duration_months"]
    sub_comp = job[(job["gender_en"] == g) & job["completed"]]["duration_months"]
    print(f"  {g}: {len(sub):,} spells, "
          f"completed mean={sub_comp.mean():.1f} mo, median={sub_comp.median():.1f} mo")

# --- Plot A: Completed spells histogram --------------------------------------
print("  Plot A: Completed spells histogram...")
comp = job[job["completed"]].copy()
cap_months = 48

comp_plot = comp[comp["duration_months"] <= cap_months]
n_excluded = len(comp) - len(comp_plot)
pct_excluded = n_excluded / len(comp) * 100 if len(comp) > 0 else 0

mean_f = comp[comp["gender_en"] == "Female"]["duration_months"].mean()
mean_m = comp[comp["gender_en"] == "Male"]["duration_months"].mean()
med_f = comp[comp["gender_en"] == "Female"]["duration_months"].median()
med_m = comp[comp["gender_en"] == "Male"]["duration_months"].median()

fig, ax = plt.subplots(figsize=(9, 5))
bins = np.arange(0, cap_months + 3, 3)

for g, color in [("Female", PAL_FEMALE), ("Male", PAL_MALE)]:
    subset = comp_plot[comp_plot["gender_en"] == g]["duration_months"]
    ax.hist(subset, bins=bins, color=color, alpha=0.7, edgecolor="white",
            label=f"{g} (N={len(subset):,})", density=True)

for g, color, ls in [("Female", PAL_FEMALE, "-"), ("Male", PAL_MALE, "--")]:
    mean_val = comp[comp["gender_en"] == g]["duration_months"].mean()
    ax.axvline(mean_val, color=color, linestyle=ls, linewidth=2,
               label=f"{g} mean = {mean_val:.1f} mo")

ax.set_xlabel("Spell duration (months)")
ax.set_ylabel("Density")
ax.set_title("Job Spell Duration by Gender (Completed Spells)", pad=25)
fig.text(0.5, 0.885,
         f"Mean: Female = {mean_f:.1f}, Male = {mean_m:.1f} mo  |  "
         f"Median: Female = {med_f:.1f}, Male = {med_m:.1f} mo",
         fontsize=11, color="#666666", ha="center")

ax.legend(fontsize=9, loc="upper right", framealpha=0.9)

n_f = len(comp[comp["gender_en"] == "Female"])
n_m = len(comp[comp["gender_en"] == "Male"])
fig.text(0.01, -0.04,
         f"Source: BUK administrative records (Chile). "
         f"N = {n_f:,} female, {n_m:,} male completed spells.\n"
         f"Each job_id is one spell (duration = end_date \u2212 start_date). "
         f"{n_excluded:,} spells ({pct_excluded:.1f}%) >{cap_months} months excluded.",
         fontsize=9, color="#999999", ha="left")

fig.tight_layout()
save_plot(fig, "rf_1_2_spell_duration_completed")

# --- Plot B: Kaplan-Meier survival curves ------------------------------------
print("  Plot B: KM survival curves...")

def kaplan_meier(durations, events):
    """Manual KM estimator. events: 1=completed, 0=censored."""
    df_km = pd.DataFrame({"t": durations, "e": events}).sort_values("t")
    event_times = np.sort(df_km[df_km["e"] == 1]["t"].unique())

    survival = 1.0
    times = [0.0]
    surv_prob = [1.0]

    for t in event_times:
        n_at_risk = (df_km["t"] >= t).sum()
        n_events = ((df_km["t"] == t) & (df_km["e"] == 1)).sum()
        if n_at_risk > 0:
            survival *= (1 - n_events / n_at_risk)
        times.append(t)
        surv_prob.append(survival)

    return np.array(times), np.array(surv_prob)

fig, ax = plt.subplots(figsize=(9, 5))

medians = {}
for g, color in [("Female", PAL_FEMALE), ("Male", PAL_MALE)]:
    subset = job[job["gender_en"] == g]
    times, surv = kaplan_meier(
        subset["duration_months"].values,
        subset["completed"].astype(int).values
    )
    ax.step(times, surv * 100, where="post", color=color, linewidth=2,
            label=f"{g} (N={len(subset):,})")

    below_50 = np.where(surv <= 0.5)[0]
    if len(below_50) > 0:
        medians[g] = times[below_50[0]]
        ax.plot(medians[g], 50, marker="o", color=color, markersize=6, zorder=5)
    else:
        medians[g] = None

ax.axhline(50, color="grey", linestyle=":", linewidth=0.8, alpha=0.5)
ax.set_xlabel("Months since spell start")
ax.set_ylabel("% still in same job")
ax.set_title("Job Spell Survival by Gender (Kaplan-Meier)", pad=25)

subtitle_parts = []
for g in ["Female", "Male"]:
    if medians.get(g) is not None:
        subtitle_parts.append(f"{g} median: {medians[g]:.1f} mo")
    else:
        subtitle_parts.append(f"{g} median: >panel length")
fig.text(0.5, 0.885, " | ".join(subtitle_parts),
         fontsize=11, color="#666666", ha="center")

ax.set_ylim(0, 105)
ax.set_xlim(0, None)
ax.legend(fontsize=10, loc="upper right", framealpha=0.9)

fig.text(0.01, -0.04,
         f"Source: BUK administrative records (Chile). "
         f"N = {n_spells:,} spells ({n_censored:,} right-censored at "
         f"{PANEL_END:%Y-%m}).\n"
         f"Left-truncation caveat: jobs active from panel start may have "
         f"understated duration.",
         fontsize=9, color="#999999", ha="left")

fig.tight_layout()
save_plot(fig, "rf_1_2_spell_duration_km")

# --- Plot C: Number of distinct jobs per employee by gender ------------------
print("  Plot C: Jobs per employee...")

jobs_per_emp = (
    job.groupby("employee_id")
    .agg(n_jobs=("job_id", "nunique"), gender_en=("gender_en", "first"))
    .reset_index()
)

cap_jobs = 5
jobs_per_emp["n_jobs_cat"] = jobs_per_emp["n_jobs"].clip(upper=cap_jobs)
jobs_per_emp["n_jobs_label"] = jobs_per_emp["n_jobs_cat"].apply(
    lambda x: f"{cap_jobs}+" if x == cap_jobs else str(int(x))
)

share_j = (
    jobs_per_emp
    .groupby(["gender_en", "n_jobs_label"])
    .size()
    .reset_index(name="n")
)
share_j = share_j.merge(
    share_j.groupby("gender_en")["n"].sum().reset_index(name="n_total"),
    on="gender_en"
)
share_j["pct"] = share_j["n"] / share_j["n_total"] * 100

cat_order_j = [str(i) for i in range(1, cap_jobs)] + [f"{cap_jobs}+"]
share_j["n_jobs_label"] = pd.Categorical(
    share_j["n_jobs_label"], categories=cat_order_j, ordered=True
)
share_j = share_j.sort_values(["gender_en", "n_jobs_label"])

for g in ["Female", "Male"]:
    sub = jobs_per_emp[jobs_per_emp["gender_en"] == g]["n_jobs"]
    print(f"  {g}: mean jobs={sub.mean():.2f}, median={sub.median():.0f}, "
          f"max={sub.max():.0f}")

fig, ax = plt.subplots(figsize=(8, 5))

x_pos = np.arange(len(cat_order_j))
bar_width = 0.35

for i, (gender, color) in enumerate([("Female", PAL_FEMALE), ("Male", PAL_MALE)]):
    vals = []
    for cat in cat_order_j:
        row = share_j[(share_j["gender_en"] == gender) & (share_j["n_jobs_label"] == cat)]
        vals.append(row["pct"].values[0] if len(row) > 0 else 0)
    ax.bar(x_pos + i * bar_width, vals, width=bar_width,
           color=color, edgecolor="white", label=gender)
    for j, v in enumerate(vals):
        if v >= 1:
            ax.text(x_pos[j] + i * bar_width, v + 0.5,
                    f"{v:.0f}%", ha="center", va="bottom", fontsize=9)

ax.set_xticks(x_pos + bar_width / 2)
ax.set_xticklabels(cat_order_j)
ax.set_xlabel("Number of distinct jobs (job_id) at employer")
ax.set_ylabel("Share of workers (%)")

mean_f_j = jobs_per_emp[jobs_per_emp["gender_en"] == "Female"]["n_jobs"].mean()
mean_m_j = jobs_per_emp[jobs_per_emp["gender_en"] == "Male"]["n_jobs"].mean()

ax.set_title("Number of Distinct Jobs per Worker, by Gender", pad=25)
fig.text(0.5, 0.885,
         f"Mean: Female = {mean_f_j:.2f}, Male = {mean_m_j:.2f}",
         fontsize=11, color="#666666", ha="center")

ax.legend(fontsize=10, loc="upper left", framealpha=0.9)

n_workers = len(jobs_per_emp)
fig.text(0.01, -0.04,
         f"Source: BUK administrative records (Chile, N = {n_workers:,} workers with gender). \n"
         f"Each job_id counts as a distinct job, even at the same employer.",
         fontsize=9, color="#999999", ha="left")

fig.tight_layout()
save_plot(fig, "rf_1_2b_jobs_per_employee")

# --- Plot 1.2b: Job transitions with salary increase, by gender --------------
# For each worker, order jobs by start_date, compare theoretical_liquid_salary
# across consecutive jobs. Count transitions where salary increased (>1%).
print("  Plot 1.2b: Job transitions with salary increase...")

job_sal = job[["employee_id", "job_id", "start_date", "gender_en",
               "theoretical_liquid_salary"]].copy()
job_sal = job_sal.dropna(subset=["theoretical_liquid_salary"])
job_sal = job_sal[job_sal["theoretical_liquid_salary"] > 0]
job_sal = job_sal.sort_values(["employee_id", "start_date"])

# For each employee, compute salary change between consecutive jobs
job_sal["prev_salary"] = job_sal.groupby("employee_id")["theoretical_liquid_salary"].shift(1)
job_sal["salary_change_pct"] = (
    (job_sal["theoretical_liquid_salary"] - job_sal["prev_salary"])
    / job_sal["prev_salary"] * 100
)

# A transition with salary increase: >1% bump (filters rounding noise)
job_sal["is_increase"] = job_sal["salary_change_pct"] > 1

# Count per employee: total transitions and transitions with increase
transitions = job_sal[job_sal["prev_salary"].notna()].copy()
n_transitions = len(transitions)
n_increases = transitions["is_increase"].sum()
print(f"  Total transitions: {n_transitions:,}")
print(f"  With salary increase (>1%): {n_increases:,} "
      f"({n_increases/n_transitions*100:.1f}%)")

emp_increases = (
    transitions
    .groupby("employee_id")
    .agg(
        n_transitions=("is_increase", "count"),
        n_increases=("is_increase", "sum"),
        gender_en=("gender_en", "first")
    )
    .reset_index()
)

for g in ["Female", "Male"]:
    sub = emp_increases[emp_increases["gender_en"] == g]
    pct_with_increase = (sub["n_increases"] > 0).mean() * 100
    print(f"  {g}: mean increases={sub['n_increases'].mean():.2f}, "
          f"median={sub['n_increases'].median():.0f}, "
          f"% with any increase={pct_with_increase:.1f}%")

# Bar chart: number of salary-increase transitions per worker, by gender
cap_inc = 4
emp_increases["n_inc_cat"] = emp_increases["n_increases"].clip(upper=cap_inc)
emp_increases["n_inc_label"] = emp_increases["n_inc_cat"].apply(
    lambda x: f"{cap_inc}+" if x == cap_inc else str(int(x))
)

share_inc = (
    emp_increases
    .groupby(["gender_en", "n_inc_label"])
    .size()
    .reset_index(name="n")
)
share_inc = share_inc.merge(
    share_inc.groupby("gender_en")["n"].sum().reset_index(name="n_total"),
    on="gender_en"
)
share_inc["pct"] = share_inc["n"] / share_inc["n_total"] * 100

cat_order_inc = [str(i) for i in range(0, cap_inc)] + [f"{cap_inc}+"]
share_inc["n_inc_label"] = pd.Categorical(
    share_inc["n_inc_label"], categories=cat_order_inc, ordered=True
)
share_inc = share_inc.sort_values(["gender_en", "n_inc_label"])

mean_f_inc = emp_increases[emp_increases["gender_en"] == "Female"]["n_increases"].mean()
mean_m_inc = emp_increases[emp_increases["gender_en"] == "Male"]["n_increases"].mean()

fig, ax = plt.subplots(figsize=(8, 5))

x_pos = np.arange(len(cat_order_inc))
bar_width = 0.35

for i, (gender, color) in enumerate([("Female", PAL_FEMALE), ("Male", PAL_MALE)]):
    vals = []
    for cat in cat_order_inc:
        row = share_inc[(share_inc["gender_en"] == gender) & (share_inc["n_inc_label"] == cat)]
        vals.append(row["pct"].values[0] if len(row) > 0 else 0)
    ax.bar(x_pos + i * bar_width, vals, width=bar_width,
           color=color, edgecolor="white", label=gender)
    for j, v in enumerate(vals):
        if v >= 1:
            ax.text(x_pos[j] + i * bar_width, v + 0.5,
                    f"{v:.0f}%", ha="center", va="bottom", fontsize=9)

ax.set_xticks(x_pos + bar_width / 2)
ax.set_xticklabels(cat_order_inc)
ax.set_xlabel("Number of job transitions with salary increase (>1%)")
ax.set_ylabel("Share of workers (%)")

ax.set_title("Job Transitions with Salary Increase, by Gender", pad=25)
fig.text(0.5, 0.885,
         f"Mean: Female = {mean_f_inc:.2f}, Male = {mean_m_inc:.2f}  |  "
         f"{n_increases/n_transitions*100:.0f}% of all transitions come with "
         f"a salary increase",
         fontsize=11, color="#666666", ha="center")

ax.legend(fontsize=10, loc="upper right", framealpha=0.9)

n_workers_inc = len(emp_increases)
fig.text(0.01, -0.04,
         f"Source: BUK administrative records (Chile, N = {n_workers_inc:,} workers "
         f"with 2+ jobs). Salary increase = theoretical_liquid_salary rises >1%\n"
         f"between consecutive job_ids (ordered by start_date).",
         fontsize=9, color="#999999", ha="left")

fig.tight_layout()
save_plot(fig, "rf_1_2b_salary_increase_transitions")

# ==============================================================================
# PLOT 1.2c — Salary Change Magnitude at Transitions by Gender (Task issue2_05c)
# ==============================================================================
# Reuses `transitions` dataframe from Plot 1.2b.
# Decomposes salary changes to see if men get fewer but LARGER raises.
print("\n--- Plot 1.2c: Salary Change Magnitude by Gender ---")

# --- Analysis A: Summary stats of salary change by gender --------------------
increases = transitions[transitions["is_increase"]].copy()
print(f"  Transitions with >1% increase: {len(increases):,}")

for g in ["Female", "Male"]:
    sub = increases[increases["gender_en"] == g]["salary_change_pct"]
    print(f"  {g}: mean={sub.mean():.1f}%, median={sub.median():.1f}%, "
          f"P25={sub.quantile(0.25):.1f}%, P75={sub.quantile(0.75):.1f}%")

# --- Analysis B: Distribution of salary increase magnitude -------------------
print("  Plot B: Distribution of increase magnitude...")

cap_pct = 100  # cap at 100% for readability
inc_plot = increases[increases["salary_change_pct"] <= cap_pct]
n_exc = len(increases) - len(inc_plot)

fig, ax = plt.subplots(figsize=(9, 5))
bins = np.arange(0, cap_pct + 5, 5)

for g, color in [("Female", PAL_FEMALE), ("Male", PAL_MALE)]:
    subset = inc_plot[inc_plot["gender_en"] == g]["salary_change_pct"]
    ax.hist(subset, bins=bins, color=color, alpha=0.7, edgecolor="white",
            label=f"{g} (N={len(subset):,})", density=True)

# Median lines
for g, color, ls in [("Female", PAL_FEMALE, "-"), ("Male", PAL_MALE, "--")]:
    med = increases[increases["gender_en"] == g]["salary_change_pct"].median()
    ax.axvline(med, color=color, linestyle=ls, linewidth=2,
               label=f"{g} median = {med:.1f}%")

ax.set_xlabel("Salary increase (%)")
ax.set_ylabel("Density")
ax.set_title("Salary Increase Magnitude at Job Transitions, by Gender", pad=25)

med_f = increases[increases["gender_en"] == "Female"]["salary_change_pct"].median()
med_m = increases[increases["gender_en"] == "Male"]["salary_change_pct"].median()
fig.text(0.5, 0.885,
         f"Median increase: Female = {med_f:.1f}%, Male = {med_m:.1f}%",
         fontsize=11, color="#666666", ha="center")

ax.legend(fontsize=9, loc="upper right", framealpha=0.9)

fig.text(0.01, -0.04,
         f"Source: BUK administrative records (Chile). "
         f"N = {len(inc_plot):,} transitions with salary increase \u2264{cap_pct}%.\n"
         f"{n_exc:,} transitions with >{cap_pct}% increase excluded. "
         f"Salary = theoretical_liquid_salary.",
         fontsize=9, color="#999999", ha="left")

fig.tight_layout()
save_plot(fig, "rf_1_2c_salary_increase_magnitude")

# --- Analysis C: Small / medium / large increases by gender ------------------
print("  Plot C: Small/medium/large breakdown...")

increases["size_cat"] = pd.cut(
    increases["salary_change_pct"],
    bins=[1, 5, 15, float("inf")],
    labels=["Small (1\u20135%)", "Medium (5\u201315%)", "Large (>15%)"]
)

size_share = (
    increases
    .groupby(["gender_en", "size_cat"], observed=True)
    .size()
    .reset_index(name="n")
)
size_share = size_share.merge(
    size_share.groupby("gender_en")["n"].sum().reset_index(name="n_total"),
    on="gender_en"
)
size_share["pct"] = size_share["n"] / size_share["n_total"] * 100

cat_order_size = ["Small (1\u20135%)", "Medium (5\u201315%)", "Large (>15%)"]

fig, ax = plt.subplots(figsize=(8, 5))

x_pos = np.arange(len(cat_order_size))
bar_width = 0.35

for i, (gender, color) in enumerate([("Female", PAL_FEMALE), ("Male", PAL_MALE)]):
    vals = []
    for cat in cat_order_size:
        row = size_share[(size_share["gender_en"] == gender) & (size_share["size_cat"] == cat)]
        vals.append(row["pct"].values[0] if len(row) > 0 else 0)
    ax.bar(x_pos + i * bar_width, vals, width=bar_width,
           color=color, edgecolor="white", label=gender)
    for j, v in enumerate(vals):
        if v >= 1:
            ax.text(x_pos[j] + i * bar_width, v + 0.5,
                    f"{v:.0f}%", ha="center", va="bottom", fontsize=9)

ax.set_xticks(x_pos + bar_width / 2)
ax.set_xticklabels(cat_order_size)
ax.set_xlabel("Salary increase size")
ax.set_ylabel("Share of transitions (%)")

ax.set_title("Salary Increase Size at Job Transitions, by Gender", pad=25)

# Compute share of large increases for subtitle
large_f = size_share[(size_share["gender_en"] == "Female") &
                     (size_share["size_cat"] == "Large (>15%)")]["pct"].values
large_m = size_share[(size_share["gender_en"] == "Male") &
                     (size_share["size_cat"] == "Large (>15%)")]["pct"].values
large_f_pct = large_f[0] if len(large_f) > 0 else 0
large_m_pct = large_m[0] if len(large_m) > 0 else 0
fig.text(0.5, 0.885,
         f"Large increases (>15%): Female = {large_f_pct:.0f}%, "
         f"Male = {large_m_pct:.0f}% of transitions",
         fontsize=11, color="#666666", ha="center")

ax.legend(fontsize=10, loc="upper left", framealpha=0.9)

n_inc_total = len(increases)
fig.text(0.01, -0.04,
         f"Source: BUK administrative records (Chile, N = {n_inc_total:,} "
         f"transitions with >1% salary increase).\n"
         f"Salary = theoretical_liquid_salary between consecutive job_ids.",
         fontsize=9, color="#999999", ha="left")

fig.tight_layout()
save_plot(fig, "rf_1_2c_salary_increase_size")

# ==============================================================================
# PLOT 1.3 — Separation Rates by Gender and Exit Reason (Task issue2_06)
# ==============================================================================
# exit_reason is only ~1.3% populated among completed spells.
# Plot uses available data with a strong caveat.
print("\n--- Plot 1.3: Separation by Gender and Exit Reason ---")

# Classify exit reasons
VOLUNTARY = {"renuncia", "mutuo_acuerdo", "renuncia_estatuto_docente",
             "renuncia_estatuto_asistentes_educacion",
             "renuncia_estatuto_atencion_primaria"}
INVOLUNTARY = {"necesidades_empresa", "no_concurrencia", "incumplimiento",
               "falta_probidad", "abandonar_trabajo", "desahucio_gerente",
               "caso_fortuito"}

def classify_exit(reason):
    if reason in VOLUNTARY:
        return "Voluntary"
    elif reason in INVOLUNTARY:
        return "Involuntary"
    elif pd.notna(reason):
        return "Contract end"
    return np.nan

sep = job[job["completed"] & job["exit_reason"].notna()].copy()
sep["exit_cat"] = sep["exit_reason"].apply(classify_exit)
sep = sep.dropna(subset=["exit_cat"])

n_with_reason = len(sep)
n_completed_total = job["completed"].sum()
coverage = n_with_reason / n_completed_total * 100
print(f"  Completed spells with exit_reason: {n_with_reason:,} / "
      f"{n_completed_total:,} ({coverage:.1f}%)")

# Share by gender x exit category
exit_share = (
    sep
    .groupby(["gender_en", "exit_cat"])
    .size()
    .reset_index(name="n")
)
exit_share = exit_share.merge(
    exit_share.groupby("gender_en")["n"].sum().reset_index(name="n_total"),
    on="gender_en"
)
exit_share["pct"] = exit_share["n"] / exit_share["n_total"] * 100

for g in ["Female", "Male"]:
    print(f"  {g}:")
    sub = exit_share[exit_share["gender_en"] == g]
    for _, row in sub.iterrows():
        print(f"    {row['exit_cat']}: {row['pct']:.1f}% (N={row['n']:,})")

cat_order_exit = ["Voluntary", "Involuntary", "Contract end"]

fig, ax = plt.subplots(figsize=(8, 5))

x_pos = np.arange(len(cat_order_exit))
bar_width = 0.35

for i, (gender, color) in enumerate([("Female", PAL_FEMALE), ("Male", PAL_MALE)]):
    vals = []
    for cat in cat_order_exit:
        row = exit_share[(exit_share["gender_en"] == gender) & (exit_share["exit_cat"] == cat)]
        vals.append(row["pct"].values[0] if len(row) > 0 else 0)
    ax.bar(x_pos + i * bar_width, vals, width=bar_width,
           color=color, edgecolor="white", label=gender)
    for j, v in enumerate(vals):
        if v >= 1:
            ax.text(x_pos[j] + i * bar_width, v + 0.5,
                    f"{v:.0f}%", ha="center", va="bottom", fontsize=9)

ax.set_xticks(x_pos + bar_width / 2)
ax.set_xticklabels(cat_order_exit)
ax.set_xlabel("Exit reason")
ax.set_ylabel("Share of separations (%)")

n_f = exit_share[exit_share["gender_en"] == "Female"]["n"].sum()
n_m = exit_share[exit_share["gender_en"] == "Male"]["n"].sum()

ax.set_title("Separation by Exit Reason and Gender", pad=25)
fig.text(0.5, 0.885,
         f"N = {n_with_reason:,} separations with exit reason "
         f"({coverage:.1f}% of completed spells)",
         fontsize=11, color="#666666", ha="center")

ax.legend(fontsize=10, loc="upper left", framealpha=0.9)

fig.text(0.01, -0.04,
         f"Source: BUK administrative records (Chile). "
         f"N = {n_f:,} female, {n_m:,} male separations.\n"
         f"CAVEAT: exit_reason is only {coverage:.1f}% populated \u2014 "
         f"results may not be representative of all separations.",
         fontsize=9, color="#999999", ha="left")

fig.tight_layout()
save_plot(fig, "rf_1_3_separation_by_gender")

del job, comp, comp_plot, jobs_per_emp, share_j, emp_gender
del job_sal, transitions, emp_increases, share_inc, increases, inc_plot, size_share
del sep, exit_share
gc.collect()


# ==============================================================================
# PLOT 4.5 — Share of Women in Supervisory Roles Over Time (Task issue2_25)
# ==============================================================================
# is_boss is in shared_core_employee (boolean). Job table provides start/end
# dates for temporal coverage. Monthly share = female / total among active
# boss-employee jobs each month.
print("\n--- Plot 4.5: Share of Women in Supervisory Roles Over Time ---")

employee = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_employee.csv"),
    usecols=["employee_id", "gender", "is_boss", "tenant_id"]
)
company = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_rsch_company.csv"),
    usecols=["tenant_id", "country"]
)
tenant_cl = company[company["country"] == "Chile"][["tenant_id"]].drop_duplicates()

emp_cl = employee.merge(tenant_cl, on="tenant_id", how="inner")
bosses = emp_cl[emp_cl["is_boss"] == True].copy()
bosses = bosses[bosses["gender"].isin(["F", "M"])]
boss_ids = set(bosses["employee_id"])
print(f"  Chile bosses with gender: {len(bosses):,} "
      f"(female: {(bosses['gender']=='F').mean()*100:.1f}%)")

del employee, company, emp_cl
gc.collect()

# Load job table — only columns needed, filter to Chile + boss employees
job = pd.read_csv(
    os.path.join(DATA_DIR, "shared_adm_job.csv"),
    usecols=["employee_id", "country", "start_date", "end_date"]
)
job_boss = job[(job["country"] == "Chile") & (job["employee_id"].isin(boss_ids))].copy()
del job
gc.collect()

job_boss["start_date"] = pd.to_datetime(job_boss["start_date"], errors="coerce")
job_boss["end_date"] = pd.to_datetime(job_boss["end_date"], errors="coerce")
job_boss = job_boss.dropna(subset=["start_date"])

# Merge gender
job_boss = job_boss.merge(
    bosses[["employee_id", "gender"]].drop_duplicates(subset=["employee_id"]),
    on="employee_id", how="left"
)
print(f"  Boss jobs (Chile): {len(job_boss):,}")

# --- Monthly time series (2022-01 to 2026-06) --------------------------------
months = pd.date_range("2022-01-01", "2026-06-01", freq="MS")
records = []

for month_start in months:
    month_end = month_start + pd.offsets.MonthEnd(0)
    # Active job: started on or before month end, and (no end date OR ended on or after month start)
    active = job_boss[
        (job_boss["start_date"] <= month_end) &
        (job_boss["end_date"].isna() | (job_boss["end_date"] >= month_start))
    ]
    # Deduplicate: one observation per employee per month (an employee can have multiple jobs)
    active_emp = active.drop_duplicates(subset=["employee_id"])
    n_total = len(active_emp)
    n_female = (active_emp["gender"] == "F").sum()
    pct_female = n_female / n_total * 100 if n_total > 0 else np.nan
    records.append({"month": month_start, "n_total": n_total,
                    "n_female": n_female, "pct_female": pct_female})

ts = pd.DataFrame(records)

# Trim edge-effect: is_boss is a snapshot, so trailing months where N is
# constant are artifacts (active jobs extending forward). Drop them.
last_n = ts["n_total"].iloc[-1]
first_stale = ts[ts["n_total"] == last_n].index.min()
ts = ts.iloc[:first_stale]

print(f"\n  Monthly range: {ts['month'].min():%Y-%m} to {ts['month'].max():%Y-%m}")
print(f"  Female share range: {ts['pct_female'].min():.1f}% – {ts['pct_female'].max():.1f}%")

# --- Reform dates for overlay -------------------------------------------------
reform_lines = [
    {"date": pd.Timestamp("2024-01-29"), "label": "Ley 21.645\n(flexible work)", "color": "#d63031"},
    {"date": pd.Timestamp("2024-04-26"), "label": "Ley 21.561\n(45→44 hrs)", "color": "#2d3436"},
]

# --- Plot ---------------------------------------------------------------------
fig, ax = plt.subplots(figsize=(10, 5))

ax.plot(ts["month"], ts["pct_female"], color=PAL_FEMALE, linewidth=2, marker="o",
        markersize=3, zorder=3)

# Reform date vertical lines — stagger labels vertically to avoid overlap
label_y_offsets = [0.98, 0.85]  # fraction of y-axis range
for i, ref in enumerate(reform_lines):
    ax.axvline(ref["date"], color=ref["color"], linestyle="--", linewidth=1, alpha=0.7)
    ymin, ymax = ax.get_ylim()
    ypos = ymin + (ymax - ymin) * label_y_offsets[i]
    ax.text(ref["date"] + pd.Timedelta(days=10), ypos,
            ref["label"], fontsize=8, color=ref["color"], va="top",
            fontweight="bold", rotation=0)

ax.set_xlabel("")
ax.set_ylabel("% Female among supervisors")
ax.set_title("Share of Women in Supervisory Roles Over Time", pad=25)
fig.text(0.5, 0.885, "Monthly share of female workers with is_boss = True",
         fontsize=11, color="#666666", ha="center")

ax.set_ylim(30, 40)
ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f"{y:.0f}%"))

fig.text(0.01, -0.04,
         f"Source: BUK administrative records (Chile). "
         f"Supervisors identified via is_boss flag in employee table. "
         f"N ranges from {ts['n_total'].min():,} to {ts['n_total'].max():,} per month.",
         fontsize=9, color="#999999", ha="left")

fig.tight_layout()
save_plot(fig, "rf_4_5_female_boss_share")

del job_boss, bosses, ts
gc.collect()


# ==============================================================================
# PLOT 3.3 — Referral Source Composition by Candidate Gender (Task issue2_18)
# ==============================================================================
print("\n--- Plot 3.3: Referral Source by Candidate Gender ---")

# Reload recruitment tables (freed earlier)
app = pd.read_csv(os.path.join(DATA_DIR, "shared_application.csv"),
                  usecols=["application_id", "candidate_id", "country", "referrer_name"])
candidate = pd.read_csv(os.path.join(DATA_DIR, "shared_candidate.csv"),
                        usecols=["candidate_id", "gender", "country"])

app_cl = app[app["country"] == "Chile"].copy()
cand_cl = candidate[candidate["country"] == "Chile"].copy()

del app, candidate
gc.collect()

# Merge gender
app_src = app_cl.merge(
    cand_cl[["candidate_id", "gender"]].drop_duplicates("candidate_id"),
    on="candidate_id", how="left"
)
del app_cl, cand_cl
gc.collect()

# Clean gender
app_src["gender"] = app_src["gender"].replace({"None": np.nan, "": np.nan})
app_src["gender_en"] = app_src["gender"].map({"F": "Female", "M": "Male"})
app_src = app_src.dropna(subset=["gender_en", "referrer_name"])

print(f"  Chile apps with gender + source: {len(app_src):,}")

# Group referrer_name into categories
SOURCE_MAP = {
    "external":        "External",
    "portal":          "Company Portal",
    "trabajando":      "Trabajando.com",
    "laborum":         "Laborum",
    "cv":              "CV Database",
    "manual":          "Manual Entry",
    "internal":        "Internal",
    "from_applicants": "From Applicants",
    "linkedin":        "LinkedIn",
    "excel":           "Excel Upload",
    "from_employee":   "Employee Referral",
    "genoma":          "Genoma",
    "computrabajo":    "CompuTrabajo",
    "bne":             "BNE",
    "talana":          "Talana",
    "aira":            "Aira",
    "api":             "API",
}

app_src["source"] = app_src["referrer_name"].map(SOURCE_MAP)
app_src = app_src.dropna(subset=["source"])

# Keep only sources with meaningful N (>=0.5% of total)
source_counts = app_src["source"].value_counts()
min_n = len(app_src) * 0.005
keep_sources = source_counts[source_counts >= min_n].index.tolist()
app_src_plot = app_src[app_src["source"].isin(keep_sources)].copy()

# Compute share by gender x source
d = (
    app_src_plot
    .groupby(["gender_en", "source"])
    .size()
    .reset_index(name="n")
)
d = d.merge(
    d.groupby("gender_en")["n"].sum().reset_index(name="n_total"),
    on="gender_en"
)
d["pct"] = d["n"] / d["n_total"] * 100

# Sort sources by overall share (descending)
source_order = (
    d.groupby("source")["n"].sum()
    .sort_values(ascending=True)
    .index.tolist()
)

n_female = d[d["gender_en"] == "Female"]["n"].sum()
n_male = d[d["gender_en"] == "Male"]["n"].sum()
print(f"  Female: {n_female:,}, Male: {n_male:,}")

# --- Grouped horizontal bar chart (matching R style) -------------------------
fig, ax = plt.subplots(figsize=(9, max(5, len(source_order) * 0.45)))

y_pos = np.arange(len(source_order))
bar_height = 0.35

for i, (gender, color) in enumerate([(("Female", PAL_FEMALE)), ("Male", PAL_MALE)]):
    vals = []
    for src in source_order:
        row = d[(d["gender_en"] == gender) & (d["source"] == src)]
        vals.append(row["pct"].values[0] if len(row) > 0 else 0)
    bars = ax.barh(y_pos + i * bar_height, vals, height=bar_height,
                   color=color, edgecolor="white", label=gender)
    for j, v in enumerate(vals):
        if v >= 1:
            ax.text(v + 0.3, y_pos[j] + i * bar_height,
                    f"{v:.0f}%", va="center", fontsize=9)

ax.set_yticks(y_pos + bar_height / 2)
ax.set_yticklabels(source_order)
ax.set_xlabel("% of applications")
ax.set_title("Referral Source Composition by Candidate Gender", pad=25)
fig.text(0.5, 0.885, "Share of applications from each channel, by gender",
         fontsize=11, color="#666666", ha="center")
ax.legend(fontsize=10, loc="lower right", framealpha=0.9)

fig.text(0.01, -0.04,
         f"Source: BUK recruitment data (Chile subsample).\n"
         f"N = {n_female:,} female, {n_male:,} male applications with referral source. "
         f"Sources with <0.5% share excluded.",
         fontsize=9, color="#999999", ha="left")

fig.tight_layout()
save_plot(fig, "rf_3_3_referral_source_by_gender")

del app_src, app_src_plot, d
gc.collect()


# ==============================================================================
# PLOT 2.4 — HHI Distribution Across Occupation x Region Cells (Task issue2_14)
# ==============================================================================
# Uses pre-computed HHI parquet files from compute_hhi.py
# Shows both employment-based and vacancy-based HHI distributions
print("\n--- Plot 2.4: HHI Distribution ---")

INT_DIR = os.path.join(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    "data", "intermediate"
)
hhi_emp = pd.read_parquet(os.path.join(INT_DIR, "hhi_employment.parquet"))
hhi_vac = pd.read_parquet(os.path.join(INT_DIR, "hhi_vacancy.parquet"))

for hhi_df, hhi_label, wt_col, pfx_name in [
    (hhi_emp, "Employment-based", "n_workers", "employment"),
    (hhi_vac, "Vacancy-based", "n_vacancies", "vacancy"),
]:
    print(f"  {hhi_label}: {len(hhi_df):,} cells")

    # --- Plot A: Employment-weighted histogram ---
    fig, ax = plt.subplots(figsize=(10, 5.5))

    # Weighted histogram
    bins = np.linspace(0, 10_000, 41)
    ax.hist(
        hhi_df["hhi"], bins=bins, weights=hhi_df[wt_col],
        color=PAL_SINGLE, edgecolor="white", linewidth=0.5, alpha=0.85,
    )

    # Tercile cutoff lines
    for t_label, next_label, ls in [("Low", "Medium", "--"), ("Medium", "High", "-.")]:
        t_sub = hhi_df[hhi_df["hhi_tercile"] == t_label]
        if len(t_sub) > 0:
            cutoff = t_sub["hhi"].max()
            ax.axvline(cutoff, color="#E74C3C", linestyle=ls, linewidth=1.5, alpha=0.8)
            ax.text(
                cutoff + 100, ax.get_ylim()[1] * 0.85,
                f"{t_label}/{next_label}\n({cutoff:,.0f})",
                fontsize=10, color="#E74C3C", ha="left",
            )

    # DOJ/FTC reference thresholds
    ax.axvline(1500, color="#999999", linestyle=":", linewidth=1, alpha=0.6)
    ax.axvline(2500, color="#999999", linestyle=":", linewidth=1, alpha=0.6)
    ax.text(1500, ax.get_ylim()[1] * 0.95, "1,500", fontsize=9, color="#999999",
            ha="center", va="top")
    ax.text(2500, ax.get_ylim()[1] * 0.95, "2,500", fontsize=9, color="#999999",
            ha="center", va="top")

    # Summary stats text box
    wt = hhi_df[wt_col] / hhi_df[wt_col].sum()
    wmean = (hhi_df["hhi"] * wt).sum()
    stats_text = (
        f"Cells: {len(hhi_df):,}\n"
        f"Weighted mean: {wmean:,.0f}\n"
        f"Median: {hhi_df['hhi'].median():,.0f}\n"
        f"P25–P75: {hhi_df['hhi'].quantile(0.25):,.0f}–{hhi_df['hhi'].quantile(0.75):,.0f}"
    )
    ax.text(
        0.97, 0.95, stats_text, transform=ax.transAxes,
        fontsize=10, verticalalignment="top", horizontalalignment="right",
        bbox=dict(boxstyle="round,pad=0.4", facecolor="white", edgecolor="#cccccc", alpha=0.9),
    )

    ax.set_xlabel("HHI (0 = perfect competition, 10,000 = monopoly)")
    ax.set_ylabel(f"Total {wt_col.replace('n_', '')} (weighted)")
    ax.set_title(f"HHI Distribution — {hhi_label}")
    fig.text(
        0.5, 0.885,
        f"Occupation × region cells, Chile, all years pooled",
        ha="center", fontsize=11, color="#666666",
    )
    n_total = hhi_df[wt_col].sum()
    fig.text(
        0.01, -0.04,
        f"Source: BUK admin data. N = {len(hhi_df):,} cells, {n_total:,.0f} {wt_col.replace('n_', '')}. "
        f"Red lines = tercile cutoffs. Grey lines = DOJ/FTC thresholds.",
        fontsize=9, color="#999999",
    )
    fig.tight_layout()
    save_plot(fig, f"rf_2_4_hhi_distribution_{pfx_name}")

    # --- Plot B: Unweighted cell-count histogram ---
    fig, ax = plt.subplots(figsize=(10, 5.5))
    ax.hist(
        hhi_df["hhi"], bins=bins,
        color=PAL_SINGLE, edgecolor="white", linewidth=0.5, alpha=0.85,
    )
    ax.axvline(1500, color="#999999", linestyle=":", linewidth=1, alpha=0.6)
    ax.axvline(2500, color="#999999", linestyle=":", linewidth=1, alpha=0.6)
    ax.set_xlabel("HHI (0 = perfect competition, 10,000 = monopoly)")
    ax.set_ylabel("Number of cells (unweighted)")
    ax.set_title(f"HHI Distribution — {hhi_label} (unweighted)")
    fig.text(
        0.5, 0.885,
        f"Occupation × region cells, Chile, all years pooled",
        ha="center", fontsize=11, color="#666666",
    )
    fig.tight_layout()
    save_plot(fig, f"rf_2_4_hhi_distribution_{pfx_name}_unweighted")

# ==============================================================================
# PLOT 2.5 — HHI by Region (Task issue2_15)
# ==============================================================================
# Horizontal bar chart of employment-weighted mean HHI per Chilean region
print("\n--- Plot 2.5: HHI by Region ---")

for hhi_df, hhi_label, wt_col, pfx_name in [
    (hhi_emp, "Employment-based", "n_workers", "employment"),
    (hhi_vac, "Vacancy-based", "n_vacancies", "vacancy"),
]:
    # Compute employment-weighted mean HHI per region
    reg = hhi_df.copy()
    reg["_weighted_hhi"] = reg["hhi"] * reg[wt_col]
    reg_agg = reg.groupby("region").agg(
        weighted_hhi=("_weighted_hhi", "sum"),
        total_units=(wt_col, "sum"),
        n_cells=("hhi", "count"),
        n_firms=("n_firms", "sum"),
    ).reset_index()
    reg_agg["mean_hhi"] = reg_agg["weighted_hhi"] / reg_agg["total_units"]
    reg_agg = reg_agg.sort_values("mean_hhi", ascending=True)

    fig, ax = plt.subplots(figsize=(10, 7))

    # Color Santiago differently
    colors = [
        "#E74C3C" if "Metropolitana" in r else PAL_SINGLE
        for r in reg_agg["region"]
    ]
    bars = ax.barh(
        reg_agg["region"], reg_agg["mean_hhi"],
        color=colors, edgecolor="white", linewidth=0.5,
    )

    # Add unit counts at end of each bar
    for bar, units, nf in zip(bars, reg_agg["total_units"], reg_agg["n_firms"]):
        ax.text(
            bar.get_width() + 50, bar.get_y() + bar.get_height() / 2,
            f"N={units:,.0f}",
            va="center", fontsize=9, color="#666666",
        )

    # DOJ/FTC threshold lines
    ax.axvline(1500, color="#999999", linestyle=":", linewidth=1, alpha=0.6)
    ax.axvline(2500, color="#999999", linestyle=":", linewidth=1, alpha=0.6)
    ax.text(1500, -0.8, "1,500", fontsize=9, color="#999999", ha="center")
    ax.text(2500, -0.8, "2,500", fontsize=9, color="#999999", ha="center")

    ax.set_xlabel("Employment-weighted mean HHI")
    ax.set_title(f"Labor Market Concentration by Region — {hhi_label}",
                 pad=20)
    fig.text(
        0.5, 0.92,
        "Weighted mean HHI across occupation cells within each region",
        ha="center", fontsize=11, color="#666666",
    )
    n_total = reg_agg["total_units"].sum()
    unit_label = wt_col.replace("n_", "")
    fig.text(
        0.01, -0.03,
        f"Source: BUK admin data. N = {n_total:,.0f} {unit_label} across {len(reg_agg)} regions. "
        f"Red bar = Santiago Metropolitana. Grey lines = DOJ/FTC thresholds.",
        fontsize=9, color="#999999",
    )
    fig.tight_layout()
    save_plot(fig, f"rf_2_5_hhi_by_region_{pfx_name}")

del hhi_emp, hhi_vac
gc.collect()


# ==============================================================================
# PLOT 4.1 — Promotion Rate by Gender (Task issue2_21)
# ==============================================================================
# Uses pre-computed promotion parquet + adm_job for person-years denominator
print("\n--- Plot 4.1: Promotion Rate by Gender ---")

promo = pd.read_parquet(os.path.join(INT_DIR, "promotions.parquet"))
print(f"  Promotions loaded: {len(promo):,}")

# Load adm_job for person-years at risk (year-end snapshots)
print("  Loading adm_job for person-years denominator...")
_job = pd.read_csv(
    os.path.join(DATA_DIR, "shared_adm_job.csv"),
    usecols=["employee_id", "tenant_id", "country", "start_date", "end_date"],
    low_memory=False,
)
_job = _job[_job["country"] == "Chile"].copy()
_job["start_date"] = pd.to_datetime(_job["start_date"], errors="coerce")
_job["end_date"] = pd.to_datetime(_job["end_date"], errors="coerce")

# Load gender
_emp = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_employee.csv"),
    usecols=["employee_id", "gender", "tenant_id"],
)
_emp = _emp[_emp["gender"].isin(["F", "M"])]
_emp = _emp.drop_duplicates(subset=["employee_id", "tenant_id"])

# Year-end snapshots for person-years
years_41 = [int(y) for y in range(2018, 2026)]
py_records = []
for yr in years_41:
    snap = pd.Timestamp(yr, 12, 31)
    active = _job[
        (_job["start_date"] <= snap)
        & ((_job["end_date"].isna()) | (_job["end_date"] >= snap))
    ].drop_duplicates(subset=["employee_id", "tenant_id"])
    active = active.merge(_emp[["employee_id", "tenant_id", "gender"]],
                          on=["employee_id", "tenant_id"], how="inner")
    for g in ["F", "M"]:
        py_records.append({"year": yr, "gender": g,
                           "person_years": (active["gender"] == g).sum()})

py = pd.DataFrame(py_records)
print(f"  Person-years computed: {py['person_years'].sum():,}")

del _job
gc.collect()

# Promotion counts by gender and year
promo_yr = promo[promo["gender"].isin(["F", "M"])].copy()
promo_counts = promo_yr.groupby(["promotion_year", "gender"]).size().reset_index(name="n_promos")
promo_counts = promo_counts.rename(columns={"promotion_year": "year"})

# Merge and compute rates
rates = py.merge(promo_counts, on=["year", "gender"], how="left")
rates["n_promos"] = rates["n_promos"].fillna(0)
rates["rate"] = rates["n_promos"] / rates["person_years"] * 100

# --- Plot A: Overall bar chart ---
overall = rates.groupby("gender").agg(
    n_promos=("n_promos", "sum"),
    person_years=("person_years", "sum"),
).reset_index()
overall["rate"] = overall["n_promos"] / overall["person_years"] * 100

fig, ax = plt.subplots(figsize=(6, 5.5))
bar_x = [0, 1]
bar_colors = [PAL_FEMALE, PAL_MALE]
bar_labels = ["Female", "Male"]
bar_vals = [overall.loc[overall["gender"] == "F", "rate"].values[0],
            overall.loc[overall["gender"] == "M", "rate"].values[0]]

bars = ax.bar(bar_x, bar_vals, color=bar_colors, width=0.5, edgecolor="white")
for i, (bar, val) in enumerate(zip(bars, bar_vals)):
    g = "F" if i == 0 else "M"
    n = int(overall.loc[overall["gender"] == g, "n_promos"].values[0])
    py_val = int(overall.loc[overall["gender"] == g, "person_years"].values[0])
    ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.03,
            f"{val:.2f}%",
            ha="center", va="bottom", fontsize=12, fontweight="bold")
    ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() / 2,
            f"N={n:,}",
            ha="center", va="center", fontsize=10, color="white")

ax.set_ylim(0, max(bar_vals) * 1.3)
ax.set_xticks(bar_x)
ax.set_xticklabels(bar_labels)
ax.set_ylabel("Annual promotion rate (%)")
ax.set_title("Promotion Rate by Gender", pad=20)
fig.text(0.5, 0.90, "Definition: role ID change + salary increase >5%",
         ha="center", fontsize=11, color="#666666")
n_total = int(overall["n_promos"].sum())
py_total = int(overall["person_years"].sum())
fig.text(0.01, -0.04,
         f"Source: BUK admin data (Chile, 2020–2026). "
         f"N = {n_total:,} promotions / {py_total:,} person-years.",
         fontsize=9, color="#999999")
fig.tight_layout()
save_plot(fig, "rf_4_1_promotion_rate_by_gender")

# --- Plot B: Time series ---
fig, ax = plt.subplots(figsize=(10, 5.5))
for g, color, label in [("F", PAL_FEMALE, "Female"), ("M", PAL_MALE, "Male")]:
    sub = rates[rates["gender"] == g].sort_values("year")
    ax.plot(sub["year"], sub["rate"], marker="o", color=color, label=label, linewidth=2)

ax.set_xlabel("Year")
ax.set_ylabel("Annual promotion rate (%)")
ax.set_title("Promotion Rate by Gender Over Time")
fig.text(0.5, 0.885, "Definition: role ID change + salary increase >5%",
         ha="center", fontsize=11, color="#666666")
ax.legend(frameon=True, framealpha=0.9)
fig.text(0.01, -0.04,
         f"Source: BUK admin data (Chile). Person-years at Dec 31 snapshot.",
         fontsize=9, color="#999999")
fig.tight_layout()
save_plot(fig, "rf_4_1_promotion_rate_timeseries")

del promo_yr, promo_counts, rates, py, overall
gc.collect()


# ==============================================================================
# PLOT 4.2 — Time to First Promotion by Gender (Task issue2_22)
# ==============================================================================
# Kaplan-Meier survival curve: time from first job at a tenant to first promotion
print("\n--- Plot 4.2: Time to First Promotion by Gender ---")

# Need: first job start per employee-tenant + first promotion date
# promo and _emp still in scope from Plot 4.1
print("  Loading adm_job for tenure computation...")
_job42 = pd.read_csv(
    os.path.join(DATA_DIR, "shared_adm_job.csv"),
    usecols=["employee_id", "tenant_id", "country", "start_date", "end_date"],
    low_memory=False,
)
_job42 = _job42[_job42["country"] == "Chile"].copy()
_job42["start_date"] = pd.to_datetime(_job42["start_date"], errors="coerce")
_job42["end_date"] = pd.to_datetime(_job42["end_date"], errors="coerce")

# First job start at each tenant
first_job = _job42.groupby(["employee_id", "tenant_id"]).agg(
    hire_date=("start_date", "min"),
    last_end=("end_date", "max"),
).reset_index()
print(f"  Employee-tenant spells: {len(first_job):,}")

# Merge gender
first_job = first_job.merge(_emp[["employee_id", "tenant_id", "gender"]],
                            on=["employee_id", "tenant_id"], how="inner")
first_job = first_job[first_job["gender"].isin(["F", "M"])]

# First promotion per employee-tenant
first_promo = (promo.sort_values("promotion_date")
               .drop_duplicates(subset=["employee_id", "tenant_id"], keep="first")
               [["employee_id", "tenant_id", "promotion_date"]])

# Merge
km_data = first_job.merge(first_promo, on=["employee_id", "tenant_id"], how="left")

# Duration: hire_date to promotion_date (event) or last_end (censored)
PANEL_END_42 = pd.Timestamp("2026-04-01")
km_data["promoted"] = km_data["promotion_date"].notna()
km_data["event_date"] = km_data["promotion_date"].fillna(
    km_data["last_end"].fillna(PANEL_END_42)
)
km_data["duration_months"] = (
    (km_data["event_date"] - km_data["hire_date"]).dt.days / 30.44
)

# Filter: positive duration, reasonable range
km_data = km_data[km_data["duration_months"] > 0].copy()

n_promoted = km_data["promoted"].sum()
n_censored = (~km_data["promoted"]).sum()
print(f"  Promoted: {n_promoted:,}, Censored: {n_censored:,}")

# KM survival (reuse function from Plot 1.2)
def kaplan_meier_42(durations, events):
    """Manual KM estimator. events: 1=event, 0=censored."""
    df_km = pd.DataFrame({"t": durations, "e": events}).sort_values("t")
    event_times = np.sort(df_km[df_km["e"] == 1]["t"].unique())
    survival = 1.0
    times = [0.0]
    surv_prob = [1.0]
    for t in event_times:
        n_at_risk = (df_km["t"] >= t).sum()
        n_events = ((df_km["t"] == t) & (df_km["e"] == 1)).sum()
        if n_at_risk > 0:
            survival *= (1 - n_events / n_at_risk)
        times.append(t)
        surv_prob.append(survival)
    return np.array(times), np.array(surv_prob)

fig, ax = plt.subplots(figsize=(10, 5.5))

medians_42 = {}
for g, color, label in [("F", PAL_FEMALE, "Female"), ("M", PAL_MALE, "Male")]:
    sub = km_data[km_data["gender"] == g]
    times, surv = kaplan_meier_42(
        sub["duration_months"].values,
        sub["promoted"].astype(int).values,
    )
    # Cap at 120 months (10 years) for readability
    mask = times <= 120
    ax.step(times[mask], surv[mask] * 100, where="post", color=color,
            linewidth=2, label=f"{label} (N={len(sub):,})")

    below_50 = np.where(surv <= 0.5)[0]
    if len(below_50) > 0:
        medians_42[label] = times[below_50[0]]
    else:
        medians_42[label] = None

# 50% line
ax.axhline(50, color="grey", linestyle=":", linewidth=0.8, alpha=0.5)

ax.set_xlabel("Months since hire at firm")
ax.set_ylabel("% not yet promoted")
ax.set_title("Time to First Promotion by Gender (Kaplan-Meier)", pad=20)

subtitle_parts = []
for g in ["Female", "Male"]:
    if medians_42.get(g) is not None:
        subtitle_parts.append(f"{g} median: {medians_42[g]:.1f} mo")
    else:
        subtitle_parts.append(f"{g} median: not reached")
fig.text(0.5, 0.90, " | ".join(subtitle_parts),
         ha="center", fontsize=11, color="#666666")

ax.set_ylim(0, 105)
ax.set_xlim(0, 120)
ax.legend(fontsize=10, loc="lower left", framealpha=0.9)

fig.text(0.01, -0.04,
         f"Source: BUK admin data (Chile). N = {len(km_data):,} employee-tenant spells "
         f"({n_promoted:,} promoted, {n_censored:,} censored). "
         f"Definition: role ID change + salary >5%.",
         fontsize=9, color="#999999")
fig.tight_layout()
save_plot(fig, "rf_4_2_time_to_promotion_km")

del _job42, first_job, first_promo, km_data
gc.collect()


# ==============================================================================
# PLOT 4.3 — Promotion Rate by Gender x HHI Tercile (Task issue2_23)
# ==============================================================================
# KEY MODEL PREDICTION: gender promotion gap widens with market concentration
print("\n--- Plot 4.3: Promotion Rate by Gender x HHI Tercile ---")

# Load HHI and promotions
hhi_emp_43 = pd.read_parquet(os.path.join(INT_DIR, "hhi_employment.parquet"))

# Load adm_job with occupation + tenant for HHI merge
print("  Loading adm_job for HHI merge...")
_job43 = pd.read_csv(
    os.path.join(DATA_DIR, "shared_adm_job.csv"),
    usecols=["employee_id", "tenant_id", "country", "start_date", "end_date",
             "role_name_category", "category_area"],
    low_memory=False,
)
_job43 = _job43[_job43["country"] == "Chile"].copy()
_job43["start_date"] = pd.to_datetime(_job43["start_date"], errors="coerce")
_job43["end_date"] = pd.to_datetime(_job43["end_date"], errors="coerce")

# Occupation variable (same logic as compute_hhi.py)
_job43["occupation"] = _job43["role_name_category"].fillna(_job43["category_area"])
_job43["occupation_en"] = _job43["occupation"].map(
    lambda x: AREA_EN.get(x, x) if pd.notna(x) else np.nan
)

# Load company for region
_comp43 = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_rsch_company.csv"),
    usecols=["tenant_id", "country", "region"],
)
_comp43 = _comp43[_comp43["country"] == "Chile"].copy()
_comp43 = _comp43.sort_values("region", na_position="last").drop_duplicates(
    subset=["tenant_id"], keep="first"
)
tenant_region_43 = _comp43[["tenant_id", "region"]].dropna(subset=["region"])

# Year-end snapshots with occupation + region for HHI merge
years_43 = list(range(2020, 2026))  # skip early years with near-zero promos
py_rows = []
for yr in years_43:
    snap = pd.Timestamp(yr, 12, 31)
    active = _job43[
        (_job43["start_date"] <= snap)
        & ((_job43["end_date"].isna()) | (_job43["end_date"] >= snap))
    ].drop_duplicates(subset=["employee_id", "tenant_id"])
    active = active.merge(tenant_region_43, on="tenant_id", how="inner")
    active = active.merge(_emp[["employee_id", "tenant_id", "gender"]],
                          on=["employee_id", "tenant_id"], how="inner")
    active = active[active["gender"].isin(["F", "M"])]
    active = active.dropna(subset=["occupation_en", "region"])
    active["year"] = yr
    py_rows.append(active[["employee_id", "tenant_id", "gender",
                           "occupation_en", "region", "year"]])

py43 = pd.concat(py_rows, ignore_index=True)
print(f"  Person-years with occupation+region: {len(py43):,}")

del _job43, _comp43
gc.collect()

# Merge HHI tercile to person-years
py43 = py43.merge(
    hhi_emp_43[["occupation_en", "region", "year", "hhi_tercile"]],
    on=["occupation_en", "region", "year"], how="inner",
)
print(f"  After HHI merge: {len(py43):,}")

# Promotion counts with HHI: merge via worker's market cell from person-years
promo_43 = promo[promo["gender"].isin(["F", "M"])].copy()
promo_43["year"] = promo_43["promotion_date"].dt.year
promo_43 = promo_43[promo_43["year"].isin(years_43)]
# Get HHI tercile from person-years (worker's cell)
worker_hhi = py43[["employee_id", "tenant_id", "year", "hhi_tercile"]].drop_duplicates()
promo_43 = promo_43.merge(worker_hhi, on=["employee_id", "tenant_id", "year"], how="inner")
print(f"  Promotions with HHI: {len(promo_43):,}")

# Compute rates by gender x HHI tercile
denom = py43.groupby(["hhi_tercile", "gender"]).size().reset_index(name="person_years")
numer = promo_43.groupby(["hhi_tercile", "gender"]).size().reset_index(name="n_promos")
rate43 = denom.merge(numer, on=["hhi_tercile", "gender"], how="left")
rate43["n_promos"] = rate43["n_promos"].fillna(0)
rate43["rate"] = rate43["n_promos"] / rate43["person_years"] * 100

# Order terciles
tercile_order = ["Low", "Medium", "High"]
rate43["hhi_tercile"] = pd.Categorical(rate43["hhi_tercile"], categories=tercile_order, ordered=True)
rate43 = rate43.sort_values(["hhi_tercile", "gender"])

print("\n  Rates:")
for _, r in rate43.iterrows():
    print(f"    {r['hhi_tercile']:>6s} {r['gender']}: {r['rate']:.2f}% "
          f"({int(r['n_promos']):,} / {int(r['person_years']):,})")

# --- Grouped bar chart ---
fig, ax = plt.subplots(figsize=(9, 5.5))
x = np.arange(len(tercile_order))
width = 0.3

for i, (g, color, label) in enumerate([("F", PAL_FEMALE, "Female"),
                                        ("M", PAL_MALE, "Male")]):
    vals = rate43[rate43["gender"] == g].sort_values("hhi_tercile")
    bars = ax.bar(x + (i - 0.5) * width, vals["rate"].values, width,
                  color=color, label=label, edgecolor="white")
    for bar, val, n in zip(bars, vals["rate"].values, vals["n_promos"].values):
        ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.03,
                f"{val:.2f}%", ha="center", va="bottom", fontsize=10, fontweight="bold")
        ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() / 2,
                f"N={int(n):,}", ha="center", va="center", fontsize=8, color="white")

ax.set_xticks(x)
ax.set_xticklabels([f"{t} HHI" for t in tercile_order])
ax.set_ylabel("Annual promotion rate (%)")
ax.set_ylim(0, rate43["rate"].max() * 1.35)
ax.set_title("Promotion Rate by Gender and Market Concentration", pad=20)
fig.text(0.5, 0.90, "Employment-based HHI terciles (occupation x region cells)",
         ha="center", fontsize=11, color="#666666")
ax.legend(frameon=True, framealpha=0.9)

# Gender gap annotation
for t_idx, t in enumerate(tercile_order):
    f_rate = rate43[(rate43["hhi_tercile"] == t) & (rate43["gender"] == "F")]["rate"].values
    m_rate = rate43[(rate43["hhi_tercile"] == t) & (rate43["gender"] == "M")]["rate"].values
    if len(f_rate) > 0 and len(m_rate) > 0:
        gap = f_rate[0] - m_rate[0]
        y_pos = max(f_rate[0], m_rate[0]) + 0.35
        ax.text(t_idx, y_pos, f"gap: {gap:+.2f}pp",
                ha="center", fontsize=9, color="#666666", style="italic")

fig.text(0.01, -0.04,
         f"Source: BUK admin data (Chile, 2020–2026). "
         f"Definition: role ID change + salary >5%.",
         fontsize=9, color="#999999")
fig.tight_layout()
save_plot(fig, "rf_4_3_promotion_by_gender_hhi")

del hhi_emp_43, promo_43, py43, rate43
gc.collect()


# ==============================================================================
# PLOT 4.6 — Promotion Rate by Gender x Firm Size (Task issue2_26)
# ==============================================================================
# Robustness check: firm size as alternative proxy for market power
print("\n--- Plot 4.6: Promotion Rate by Gender x Firm Size ---")

# Load adm_job for firm-size computation
print("  Loading adm_job for firm size...")
_job46 = pd.read_csv(
    os.path.join(DATA_DIR, "shared_adm_job.csv"),
    usecols=["employee_id", "tenant_id", "country", "start_date", "end_date"],
    low_memory=False,
)
_job46 = _job46[_job46["country"] == "Chile"].copy()
_job46["start_date"] = pd.to_datetime(_job46["start_date"], errors="coerce")
_job46["end_date"] = pd.to_datetime(_job46["end_date"], errors="coerce")

# Year-end snapshots: count employees per tenant, assign firm size
years_46 = list(range(2020, 2026))
py_rows_46 = []
for yr in years_46:
    snap = pd.Timestamp(yr, 12, 31)
    active = _job46[
        (_job46["start_date"] <= snap)
        & ((_job46["end_date"].isna()) | (_job46["end_date"] >= snap))
    ].drop_duplicates(subset=["employee_id", "tenant_id"])

    # Firm size = unique employees per tenant in this snapshot
    firm_size = active.groupby("tenant_id")["employee_id"].nunique().reset_index(
        name="n_emp"
    )
    firm_size["firm_size"] = pd.cut(
        firm_size["n_emp"],
        bins=[0, 50, 250, float("inf")],
        labels=["Small (<50)", "Medium (50-250)", "Large (>250)"],
    )

    active = active.merge(firm_size[["tenant_id", "firm_size"]], on="tenant_id", how="inner")
    active = active.merge(_emp[["employee_id", "tenant_id", "gender"]],
                          on=["employee_id", "tenant_id"], how="inner")
    active = active[active["gender"].isin(["F", "M"])]
    active["year"] = yr
    py_rows_46.append(active[["employee_id", "tenant_id", "gender", "firm_size", "year"]])

py46 = pd.concat(py_rows_46, ignore_index=True)
print(f"  Person-years with firm size: {len(py46):,}")

del _job46
gc.collect()

# Promotions with firm size via worker lookup
promo_46 = promo[promo["gender"].isin(["F", "M"])].copy()
promo_46["year"] = promo_46["promotion_date"].dt.year
promo_46 = promo_46[promo_46["year"].isin(years_46)]
worker_fs = py46[["employee_id", "tenant_id", "year", "firm_size"]].drop_duplicates()
promo_46 = promo_46.merge(worker_fs, on=["employee_id", "tenant_id", "year"], how="inner")
print(f"  Promotions with firm size: {len(promo_46):,}")

# Rates
denom46 = py46.groupby(["firm_size", "gender"]).size().reset_index(name="person_years")
numer46 = promo_46.groupby(["firm_size", "gender"]).size().reset_index(name="n_promos")
rate46 = denom46.merge(numer46, on=["firm_size", "gender"], how="left")
rate46["n_promos"] = rate46["n_promos"].fillna(0)
rate46["rate"] = rate46["n_promos"] / rate46["person_years"] * 100

size_order = ["Small (<50)", "Medium (50-250)", "Large (>250)"]
rate46["firm_size"] = pd.Categorical(rate46["firm_size"], categories=size_order, ordered=True)
rate46 = rate46.sort_values(["firm_size", "gender"])

print("\n  Rates:")
for _, r in rate46.iterrows():
    print(f"    {r['firm_size']:>18s} {r['gender']}: {r['rate']:.2f}% "
          f"({int(r['n_promos']):,} / {int(r['person_years']):,})")

# --- Grouped bar chart ---
fig, ax = plt.subplots(figsize=(9, 5.5))
x = np.arange(len(size_order))
width = 0.3

for i, (g, color, label) in enumerate([("F", PAL_FEMALE, "Female"),
                                        ("M", PAL_MALE, "Male")]):
    vals = rate46[rate46["gender"] == g].sort_values("firm_size")
    bars = ax.bar(x + (i - 0.5) * width, vals["rate"].values, width,
                  color=color, label=label, edgecolor="white")
    for bar, val, n in zip(bars, vals["rate"].values, vals["n_promos"].values):
        ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.03,
                f"{val:.2f}%", ha="center", va="bottom", fontsize=10, fontweight="bold")
        ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() / 2,
                f"N={int(n):,}", ha="center", va="center", fontsize=8, color="white")

ax.set_xticks(x)
ax.set_xticklabels(size_order)
ax.set_ylabel("Annual promotion rate (%)")
ax.set_ylim(0, rate46["rate"].max() * 1.4)
ax.set_title("Promotion Rate by Gender and Firm Size", pad=20)
fig.text(0.5, 0.90, "Firm size = unique employees per tenant at Dec 31",
         ha="center", fontsize=11, color="#666666")
ax.legend(frameon=True, framealpha=0.9)

# Gender gap annotation
for t_idx, t in enumerate(size_order):
    f_rate = rate46[(rate46["firm_size"] == t) & (rate46["gender"] == "F")]["rate"].values
    m_rate = rate46[(rate46["firm_size"] == t) & (rate46["gender"] == "M")]["rate"].values
    if len(f_rate) > 0 and len(m_rate) > 0:
        gap = f_rate[0] - m_rate[0]
        y_pos = max(f_rate[0], m_rate[0]) + 0.35
        ax.text(t_idx, y_pos, f"gap: {gap:+.2f}pp",
                ha="center", fontsize=9, color="#666666", style="italic")

fig.text(0.01, -0.04,
         f"Source: BUK admin data (Chile, 2020–2026). "
         f"Definition: role ID change + salary >5%.",
         fontsize=9, color="#999999")
fig.tight_layout()
save_plot(fig, "rf_4_6_promotion_by_gender_firmsize")

del promo_46, py46, rate46, promo, _emp
gc.collect()


# ==============================================================================
# Summary
# ==============================================================================
print("\n=== Reduced-form admin plots complete ===")
print(f"Figures saved to: {FIG_DIR}")
