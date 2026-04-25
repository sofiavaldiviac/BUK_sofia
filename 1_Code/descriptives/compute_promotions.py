# ==============================================================================
# Compute Promotion Events — task_issue2_03
# ==============================================================================
# Definition C: Role ID change + salary increase >5% within same tenant
#
# This is a first pass using theoretical_liquid_salary from shared_adm_job.
# Future: enrich with actual base_salary from shared_adm_salary via PySpark.
#
# Output: promotions.parquet in 1_Code/data/intermediate/
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

# ==============================================================================
# 1. Load data
# ==============================================================================
print("Loading shared_adm_job.csv...")
job = pd.read_csv(
    os.path.join(DATA_DIR, "shared_adm_job.csv"),
    usecols=["job_id", "employee_id", "tenant_id", "country",
             "start_date", "end_date", "theoretical_liquid_salary",
             "role_id", "role_name_category", "area_name_category"],
    low_memory=False,
)
job = job[job["country"] == "Chile"].copy()
del job["country"]
print(f"  Chile jobs: {len(job):,}")

job["start_date"] = pd.to_datetime(job["start_date"], errors="coerce")
job["end_date"] = pd.to_datetime(job["end_date"], errors="coerce")

print("Loading shared_core_employee.csv...")
emp = pd.read_csv(
    os.path.join(DATA_DIR, "shared_core_employee.csv"),
    usecols=["employee_id", "gender", "tenant_id"],
)
emp = emp.drop_duplicates(subset=["employee_id", "tenant_id"])

# ==============================================================================
# 2. Build consecutive job transitions
# ==============================================================================
print("Building consecutive job transitions...")
job = job.sort_values(["employee_id", "tenant_id", "start_date"])

# Previous job fields (within same employee)
job["prev_tenant"] = job.groupby("employee_id")["tenant_id"].shift(1)
job["prev_job_id"] = job.groupby("employee_id")["job_id"].shift(1)
job["prev_salary"] = job.groupby("employee_id")["theoretical_liquid_salary"].shift(1)
job["prev_role_id"] = job.groupby("employee_id")["role_id"].shift(1)
job["prev_role_cat"] = job.groupby("employee_id")["role_name_category"].shift(1)
job["prev_area_cat"] = job.groupby("employee_id")["area_name_category"].shift(1)
job["prev_start"] = job.groupby("employee_id")["start_date"].shift(1)
job["prev_end"] = job.groupby("employee_id")["end_date"].shift(1)

# Internal transitions only
trans = job[job["tenant_id"] == job["prev_tenant"]].copy()
print(f"  Internal transitions: {len(trans):,}")

del job
gc.collect()

# ==============================================================================
# 3. Apply Definition C: role_id change + salary >5%
# ==============================================================================
print("Applying Definition C (role ID change + salary >5%)...")

trans["salary_change_pct"] = np.where(
    (trans["prev_salary"].notna()) & (trans["prev_salary"] > 0),
    (trans["theoretical_liquid_salary"] - trans["prev_salary"]) / trans["prev_salary"] * 100,
    np.nan,
)

trans["role_id_changed"] = (
    trans["role_id"].notna() & trans["prev_role_id"].notna()
    & (trans["role_id"] != trans["prev_role_id"])
)

mask = trans["role_id_changed"] & (trans["salary_change_pct"] > 5)
promo = trans[mask].copy()
print(f"  Promotion events: {len(promo):,}")

# ==============================================================================
# 4. Build output dataset
# ==============================================================================
# Tenure at promotion: time from previous job start to promotion date
promo["tenure_months"] = (
    (promo["start_date"] - promo["prev_start"]).dt.days / 30.44
)

# Merge gender
promo = promo.merge(emp, on=["employee_id", "tenant_id"], how="left")

# Select output columns
out = promo[[
    "employee_id", "tenant_id", "gender",
    "start_date",           # promotion date (start of new job)
    "prev_job_id",          # job before promotion
    "job_id",               # job after promotion
    "prev_role_id", "role_id",
    "prev_role_cat", "role_name_category",
    "prev_area_cat", "area_name_category",
    "prev_salary", "theoretical_liquid_salary",
    "salary_change_pct",
    "tenure_months",
]].rename(columns={
    "start_date": "promotion_date",
    "prev_job_id": "from_job_id",
    "job_id": "to_job_id",
    "prev_role_id": "from_role_id",
    "role_id": "to_role_id",
    "prev_role_cat": "from_role_category",
    "role_name_category": "to_role_category",
    "prev_area_cat": "from_area_category",
    "area_name_category": "to_area_category",
    "prev_salary": "pre_salary",
    "theoretical_liquid_salary": "post_salary",
})

out["promotion_year"] = out["promotion_date"].dt.year

# ==============================================================================
# 5. Summary and save
# ==============================================================================
print(f"\n--- Promotion event summary ---")
print(f"  Total events: {len(out):,}")
print(f"  Unique employees: {out['employee_id'].nunique():,}")
print(f"  Years: {sorted(out['promotion_year'].dropna().unique().astype(int))}")
print(f"\n  By gender:")
for g in ["F", "M"]:
    sub = out[out["gender"] == g]
    print(f"    {g}: {len(sub):,} events ({len(sub)/len(out)*100:.1f}%)")

print(f"\n  Salary change at promotion:")
for p, v in out["salary_change_pct"].describe().items():
    print(f"    {p:>5s}: {v:,.1f}%")

print(f"\n  Tenure at promotion (months):")
for p, v in out["tenure_months"].describe().items():
    print(f"    {p:>5s}: {v:,.1f}")

print(f"\n  Role category changes:")
cat_change = out[out["from_role_category"].notna() & out["to_role_category"].notna()]
same_cat = (cat_change["from_role_category"] == cat_change["to_role_category"]).sum()
diff_cat = (cat_change["from_role_category"] != cat_change["to_role_category"]).sum()
print(f"    Same category: {same_cat:,} ({same_cat/len(cat_change)*100:.1f}%)")
print(f"    Different category: {diff_cat:,} ({diff_cat/len(cat_change)*100:.1f}%)")

# Save
out_path = os.path.join(OUT_DIR, "promotions.parquet")
out.to_parquet(out_path, index=False)
print(f"\n  Saved: {out_path}")
print("Done.")
