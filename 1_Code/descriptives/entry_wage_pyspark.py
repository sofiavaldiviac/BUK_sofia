# ==============================================================================
# Plot 3.4 — Entry Wage & Wage Profile by Gender (task_issue2_19)
# ==============================================================================
# Requires PySpark + Delta Sharing. Run locally with Spark or on Databricks.
# Produces:
#   1. Entry wage distribution by gender (base_salary at first period)
#   2. Wage profile by tenure month and gender
#   3. Entry wage by gender x HHI tercile
#
# Saves aggregated CSVs + PNG plots to 1_Code/data/intermediate/ and 1_Code/figures/
# ==============================================================================

import delta_sharing
import pandas as pd
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import os
import gc

from pyspark.sql import SparkSession

# ==============================================================================
# SECTION 0 — Config
# ==============================================================================

SCRIPT_DIR = os.path.dirname(os.path.abspath(__name__))
FIG_DIR = os.path.join(os.path.dirname(SCRIPT_DIR), "figures")
INT_DIR = os.path.join(os.path.dirname(SCRIPT_DIR), "data", "intermediate")
os.makedirs(FIG_DIR, exist_ok=True)
os.makedirs(INT_DIR, exist_ok=True)

PAL_FEMALE = "#1B4F72"
PAL_MALE = "#85C1E9"
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


def save_plot(fig, name):
    path = os.path.join(FIG_DIR, f"{name}.png")
    fig.savefig(path)
    plt.close(fig)
    print(f"  Saved: {path}")


def sql(query):
    return spark.sql(query).toPandas()


# ==============================================================================
# SECTION 1 — Spark setup & load tables
# ==============================================================================
print("=" * 70)
print("Setting up Spark + Delta Sharing...")
print("=" * 70)

profile_file = "/Users/sofiavaldivia/Desktop/config.share"
client = delta_sharing.SharingClient(profile_file)
all_tables = client.list_all_tables()
table_urls = {
    t.name: f"{profile_file}#{t.share}.{t.schema}.{t.name}" for t in all_tables
}

spark = (
    SparkSession.builder.appName("entry_wage_gender")
    .config(
        "spark.jars.packages",
        "io.delta:delta-sharing-spark_2.12:3.3.0,io.delta:delta-spark_2.12:3.3.0",
    )
    .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
    .config(
        "spark.sql.catalog.spark_catalog",
        "org.apache.spark.sql.delta.catalog.DeltaCatalog",
    )
    .config("spark.driver.memory", "8g")
    .master("local[*]")
    .getOrCreate()
)

# --- Load salary ---
print("Loading shared_adm_salary via Delta Sharing...")
salary_spark = spark.read.format("deltaSharing").load(table_urls["shared_adm_salary"])
salary_spark = salary_spark.filter("country = 'Chile'")
salary_spark.createOrReplaceTempView("salary_raw")

# Filter to regular salary only (Pago salario), exclude bonuses/finiquito/vacations
print("Filtering to liquidation_type = 'Pago salario'...")
spark.sql("""
    CREATE OR REPLACE TEMP VIEW salary AS
    SELECT * FROM salary_raw
    WHERE base_salary > 0 AND liquidation_type = 'Pago salario'
""")

test = sql("SELECT count(*) as n FROM salary")
print(f"  Salary records (Chile, base_salary > 0): {test['n'].iloc[0]:,}")

# --- Load smaller tables from local cached CSVs (NOT via Spark Delta Sharing) ---
# This avoids the pre-signed URL expiration issue that crashes when loading
# multiple large tables via Spark simultaneously.
DATA_DIR = "/Users/sofiavaldivia/Dropbox/BUK/data/buk_data"

print("Loading employee from local CSV...")
emp_pd = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_employee.csv"),
    usecols=["employee_id", "gender"],
)
emp_demo = emp_pd.drop_duplicates(subset=["employee_id"])
spark_demo = spark.createDataFrame(emp_demo)
spark_demo.createOrReplaceTempView("emp_demo")
del emp_pd
gc.collect()
print(f"  Employee demographics: {len(emp_demo):,} rows")

print("Loading company from local CSV...")
comp_pd = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_rsch_company.csv"),
    usecols=["tenant_id", "country", "region"],
)
comp_cl = comp_pd[comp_pd["country"] == "Chile"][["tenant_id", "region"]].dropna(
    subset=["region"]
).drop_duplicates(subset=["tenant_id"])
spark_comp = spark.createDataFrame(comp_cl)
spark_comp.createOrReplaceTempView("company_region")
del comp_pd, comp_cl
gc.collect()

# --- Load HHI parquet ---
hhi_path = os.path.join(INT_DIR, "hhi_employment.parquet")
if os.path.exists(hhi_path):
    hhi_pd = pd.read_parquet(hhi_path)
    spark_hhi = spark.createDataFrame(hhi_pd)
    spark_hhi.createOrReplaceTempView("hhi")
    print(f"  HHI loaded: {len(hhi_pd):,} cells")
    del hhi_pd
else:
    print("  WARNING: hhi_employment.parquet not found — skipping HHI variant")

# ==============================================================================
# SECTION 2 — Entry wage by gender
# ==============================================================================
print("\n" + "=" * 70)
print("SECTION 2: Entry wage by gender")
print("=" * 70)

# First period per employee-tenant
spark.sql("""
    CREATE OR REPLACE TEMP VIEW first_period AS
    SELECT employee_id, tenant_id, min(period) as first_period
    FROM salary
    GROUP BY employee_id, tenant_id
""")

# Entry wage = base_salary at first period
spark.sql("""
    CREATE OR REPLACE TEMP VIEW entry_wage AS
    SELECT s.employee_id, s.tenant_id, s.base_salary as entry_wage,
           s.period as entry_period, e.gender
    FROM salary s
    JOIN first_period fp ON s.employee_id = fp.employee_id
        AND s.tenant_id = fp.tenant_id AND s.period = fp.first_period
    JOIN emp_demo e ON s.employee_id = e.employee_id
    WHERE s.base_salary > 0 AND e.gender IN ('F', 'M')
""")

# Summary stats
entry_stats = sql("""
    SELECT gender,
           count(*) as n,
           avg(entry_wage) as mean,
           percentile_approx(entry_wage, 0.25) as p25,
           percentile_approx(entry_wage, 0.50) as median,
           percentile_approx(entry_wage, 0.75) as p75
    FROM entry_wage
    GROUP BY gender
""")
print("\n  Entry wage by gender:")
print(entry_stats.to_string(index=False))
entry_stats.to_csv(os.path.join(INT_DIR, "entry_wage_by_gender.csv"), index=False)

# Distribution bins for histogram
entry_dist = sql("""
    SELECT gender,
           floor(entry_wage / 100000) * 100000 as salary_bin,
           count(*) as n
    FROM entry_wage
    WHERE entry_wage <= 5000000
    GROUP BY gender, floor(entry_wage / 100000) * 100000
    ORDER BY salary_bin
""")

# --- Plot A: Entry wage box plot ---
# Get raw percentiles for box plot (trim to 2M to avoid outlier compression)
box_data = sql("""
    SELECT gender, entry_wage
    FROM entry_wage
    WHERE entry_wage BETWEEN 100000 AND 2000000
""")

fig, ax = plt.subplots(figsize=(6, 5.5))
f_wages = box_data[box_data["gender"] == "F"]["entry_wage"].values
m_wages = box_data[box_data["gender"] == "M"]["entry_wage"].values

bp = ax.boxplot(
    [f_wages, m_wages],
    labels=["Female", "Male"],
    patch_artist=True,
    widths=0.5,
    showfliers=False,
    medianprops=dict(color="white", linewidth=2),
)
bp["boxes"][0].set_facecolor(PAL_FEMALE)
bp["boxes"][1].set_facecolor(PAL_MALE)

# Add median labels
for i, (wages, g) in enumerate([(f_wages, "F"), (m_wages, "M")]):
    med = np.median(wages)
    ax.text(i + 1, med, f"  {med:,.0f} CLP", va="center", fontsize=10, fontweight="bold")

ax.set_ylabel("Entry wage (CLP)")
ax.set_title("Entry Wage by Gender", pad=20)
fig.text(0.5, 0.90, "Base salary at first observed payroll period",
         ha="center", fontsize=11, color="#666666")
n_total = len(box_data)
fig.text(0.01, -0.04,
         f"Source: BUK payroll data (Chile). N = {n_total:,} employee-tenant entries. "
         f"Trimmed to 100K–2M CLP, outliers hidden.",
         fontsize=9, color="#999999")
fig.tight_layout()
save_plot(fig, "rf_3_4_entry_wage_by_gender")

del box_data
gc.collect()

# ==============================================================================
# SECTION 3 — Wage profile by tenure
# ==============================================================================
print("\n" + "=" * 70)
print("SECTION 3: Wage profile by tenure")
print("=" * 70)

spark.sql("""
    CREATE OR REPLACE TEMP VIEW salary_tenure AS
    SELECT s.employee_id, s.tenant_id, s.base_salary, s.period,
           cast(months_between(s.period, fp.first_period) as int) as tenure_month,
           e.gender
    FROM salary s
    JOIN first_period fp ON s.employee_id = fp.employee_id
        AND s.tenant_id = fp.tenant_id
    JOIN emp_demo e ON s.employee_id = e.employee_id
    WHERE s.base_salary > 0 AND e.gender IN ('F', 'M')
""")

wage_profile = sql("""
    SELECT gender, tenure_month,
           count(*) as n_obs,
           percentile_approx(base_salary, 0.5) as median_salary,
           avg(base_salary) as mean_salary
    FROM salary_tenure
    WHERE tenure_month >= 0 AND tenure_month <= 60
    GROUP BY gender, tenure_month
    ORDER BY tenure_month, gender
""")
print(f"  Wage profile rows: {len(wage_profile):,}")
wage_profile.to_csv(os.path.join(INT_DIR, "wage_profile_by_tenure_gender.csv"), index=False)

# --- Plot B: Wage profile ---
fig, ax = plt.subplots(figsize=(10, 5.5))
for g, color, label in [("F", PAL_FEMALE, "Female"), ("M", PAL_MALE, "Male")]:
    sub = wage_profile[wage_profile["gender"] == g].sort_values("tenure_month")
    ax.plot(sub["tenure_month"], sub["median_salary"], color=color,
            label=label, linewidth=2)

ax.set_xlabel("Tenure (months since first payroll)")
ax.set_ylabel("Median base salary (CLP)")
ax.set_title("Wage Profile by Gender", pad=20)
fig.text(0.5, 0.90, "Median base_salary by tenure month at firm",
         ha="center", fontsize=11, color="#666666")
ax.legend(frameon=True, framealpha=0.9)
ax.set_xlim(0, 60)
fig.text(0.01, -0.04,
         "Source: BUK payroll data (Chile). Tenure = months since first observed payroll at firm.",
         fontsize=9, color="#999999")
fig.tight_layout()
save_plot(fig, "rf_3_4_wage_profile_by_gender")

# ==============================================================================
# SECTION 4 — Entry wage by gender x HHI tercile
# ==============================================================================
print("\n" + "=" * 70)
print("SECTION 4: Entry wage by gender x HHI tercile")
print("=" * 70)

try:
    # Load job occupation from local CSV (not via Spark Delta Sharing)
    print("  Loading job occupation from local CSV...")
    job_pd = pd.read_csv(
        os.path.join(DATA_DIR, "shared_adm_job.csv"),
        usecols=["employee_id", "tenant_id", "role_name_category", "category_area"],
        low_memory=False,
    )
    job_pd["occupation"] = job_pd["role_name_category"].fillna(job_pd["category_area"])
    # Keep one occupation per employee-tenant (most common)
    job_occ = (job_pd.dropna(subset=["occupation"])
               .drop_duplicates(subset=["employee_id", "tenant_id"])
               [["employee_id", "tenant_id", "occupation"]])
    spark_job_occ = spark.createDataFrame(job_occ)
    spark_job_occ.createOrReplaceTempView("job_occ")
    del job_pd, job_occ
    gc.collect()

    spark.sql("""
        CREATE OR REPLACE TEMP VIEW entry_wage_occ AS
        SELECT ew.*, j.occupation,
               cr.region,
               year(ew.entry_period) as entry_year
        FROM entry_wage ew
        LEFT JOIN job_occ j ON ew.employee_id = j.employee_id
            AND ew.tenant_id = j.tenant_id
        LEFT JOIN company_region cr ON ew.tenant_id = cr.tenant_id
    """)

    # We need to translate occupation to English for HHI merge
    # Create translation lookup in Spark
    area_rows = [(k, v) for k, v in AREA_EN.items()]
    spark_area = spark.createDataFrame(area_rows, ["occupation_es", "occupation_en"])
    spark_area.createOrReplaceTempView("area_translate")

    spark.sql("""
        CREATE OR REPLACE TEMP VIEW entry_wage_hhi AS
        SELECT ew.*, at.occupation_en, h.hhi_tercile
        FROM entry_wage_occ ew
        LEFT JOIN area_translate at ON ew.occupation = at.occupation_es
        LEFT JOIN hhi h ON at.occupation_en = h.occupation_en
            AND ew.region = h.region AND ew.entry_year = h.year
        WHERE h.hhi_tercile IS NOT NULL
    """)

    entry_hhi = sql("""
        SELECT gender, hhi_tercile,
               count(*) as n,
               percentile_approx(entry_wage, 0.5) as median_wage,
               avg(entry_wage) as mean_wage
        FROM entry_wage_hhi
        GROUP BY gender, hhi_tercile
    """)
    print("\n  Entry wage by gender x HHI:")
    print(entry_hhi.to_string(index=False))
    entry_hhi.to_csv(os.path.join(INT_DIR, "entry_wage_by_gender_hhi.csv"), index=False)

    # --- Plot C: Entry wage by gender x HHI ---
    tercile_order = ["Low", "Medium", "High"]
    entry_hhi["hhi_tercile"] = pd.Categorical(
        entry_hhi["hhi_tercile"], categories=tercile_order, ordered=True
    )
    entry_hhi = entry_hhi.sort_values(["hhi_tercile", "gender"])

    fig, ax = plt.subplots(figsize=(9, 5.5))
    x = np.arange(len(tercile_order))
    width = 0.3

    for i, (g, color, label) in enumerate(
        [("F", PAL_FEMALE, "Female"), ("M", PAL_MALE, "Male")]
    ):
        vals = entry_hhi[entry_hhi["gender"] == g].sort_values("hhi_tercile")
        bars = ax.bar(
            x + (i - 0.5) * width, vals["median_wage"].values, width,
            color=color, label=label, edgecolor="white",
        )
        for bar, val, n in zip(bars, vals["median_wage"].values, vals["n"].values):
            ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 5000,
                    f"{val:,.0f}", ha="center", va="bottom", fontsize=9, fontweight="bold")
            ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() / 2,
                    f"N={int(n):,}", ha="center", va="center", fontsize=8, color="white")

    ax.set_xticks(x)
    ax.set_xticklabels([f"{t} HHI" for t in tercile_order])
    ax.set_ylabel("Median entry wage (CLP)")
    ax.set_ylim(0, entry_hhi["median_wage"].max() * 1.25)
    ax.set_title("Entry Wage by Gender and Market Concentration", pad=20)
    fig.text(0.5, 0.90, "Median base_salary at first payroll, by HHI tercile",
             ha="center", fontsize=11, color="#666666")
    ax.legend(frameon=True, framealpha=0.9)

    for t_idx, t in enumerate(tercile_order):
        f_w = entry_hhi[(entry_hhi["hhi_tercile"] == t) & (entry_hhi["gender"] == "F")]["median_wage"].values
        m_w = entry_hhi[(entry_hhi["hhi_tercile"] == t) & (entry_hhi["gender"] == "M")]["median_wage"].values
        if len(f_w) > 0 and len(m_w) > 0:
            gap_pct = (f_w[0] - m_w[0]) / m_w[0] * 100
            y_pos = max(f_w[0], m_w[0]) + 20000
            ax.text(t_idx, y_pos, f"gap: {gap_pct:+.1f}%",
                    ha="center", fontsize=9, color="#666666", style="italic")

    fig.text(0.01, -0.04,
             "Source: BUK payroll data (Chile). Entry wage = base_salary at first payroll period.",
             fontsize=9, color="#999999")
    fig.tight_layout()
    save_plot(fig, "rf_3_4_entry_wage_by_gender_hhi")

except Exception as e:
    print(f"  HHI variant failed: {e}")
    print("  (This is expected if HHI parquet is not available)")

# ==============================================================================
# SECTION 5 — Cleanup
# ==============================================================================
spark.stop()
print("\nDone. Spark stopped.")
