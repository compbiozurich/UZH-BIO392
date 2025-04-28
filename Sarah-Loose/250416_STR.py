import pandas as pd
import requests
import json
import matplotlib.pyplot as plt
import seaborn as sns

# Request STR Data
resp = requests.get('https://webstr-api.lsfm.zhaw.ch/repeats/?gene_names=APC')
df_repeats = pd.DataFrame.from_records(resp.json())

# Filter for ensembleTR panel
df_ensemble = df_repeats[df_repeats['panel'] == 'ensembleTR']

# Filter for STRs with period == 1
df_ensemble_1 = df_ensemble[df_ensemble['period'] == 1]

# Print columns to debug
print("Columns in df_ensemble_1:", df_ensemble_1.columns.tolist())

# Retrieve Allele Frequencies
allele_freqs = []

for repeat_id in df_ensemble_1["repeat_id"]:
    url = f'https://webstr-api.lsfm.zhaw.ch/allfreqs/?repeat_id={repeat_id}'
    r = requests.get(url)

    if r.status_code == 200:
        data = r.json()
        for entry in data:
            entry["repeat_id"] = repeat_id
            allele_freqs.append(entry)

df_freqs = pd.DataFrame(allele_freqs)

# Count unique allele lengths (n_effective) per repeat_id
unique_alleles = df_freqs.groupby('repeat_id')['n_effective'].nunique().reset_index()
unique_alleles = unique_alleles.rename(columns={'n_effective': 'num_alleles'})

# Find the STR with the maximum number of unique alleles
max_alleles_row = unique_alleles.loc[unique_alleles['num_alleles'].idxmax()]
max_repeat_id = max_alleles_row['repeat_id']
max_num_alleles = max_alleles_row['num_alleles']

# TROUBLESHOOTING -------------------------------------------------------------------------
# Check if 'chr', 'start', 'end' columns are correct based on the print output
# You may need to adjust these column names if necessary based on the data structure
try:
    most_polymorphic_str = df_ensemble_1[df_ensemble_1['repeat_id'] == max_repeat_id][['chr', 'start', 'end']]
    chrom = most_polymorphic_str['chr'].iloc[0]
    start = most_polymorphic_str['start'].iloc[0]
    end = most_polymorphic_str['end'].iloc[0]
except KeyError:
    # If 'chr', 'start', 'end' also fail, you may need to adjust the column names as per the print output
    raise KeyError("Could not find chromosome, start, or end columns. "
                   "Please check the column names in df_ensemble_1.")

# RESULTS ---------------------------------------------------------
print(f"Most Polymorphic STR Locus:")
print(f"Repeat ID: {max_repeat_id}")
print(f"Number of Unique Alleles: {max_num_alleles}")
print(f"Chromosome: {chrom}")
print(f"Start Position: {start}")
print(f"End Position: {end}")


# --- New Code: Calculate Allele Lengths and Plot Frequencies --- #

# Step 1: Mapping repeat_id to length of motif
motif_lengths = {
    row["repeat_id"]: len(row["motif"])
    for _, row in df_ensemble_1.iterrows()
}

# Step 2: Calculate allele length in base pairs (bp)
df_freqs["allele_length"] = df_freqs.apply(
    lambda row: row["n_effective"] * motif_lengths.get(row["repeat_id"], 1),  # Default to 1 if motif not found
    axis=1
)

# Step 3: Filter for the most polymorphic STR
df_max = df_freqs[df_freqs["repeat_id"] == max_repeat_id]

grouped = df_max.groupby(["allele_length", "population"])["frequency"].sum().unstack(fill_value=0)
grouped = df_max.groupby(["allele_length", "population"])["frequency"].sum().unstack(fill_value=0)
grouped = grouped.sort_index()  # sortiert nach Allellänge

import matplotlib.pyplot as plt
# Plotten
grouped.plot(kind="bar", figsize=(10, 6))
plt.xlabel("Allellänge (bp)")
plt.ylabel("Frequenz")
plt.title(f"Allelfrequenzen nach Population für STR {chrom}:{start}-{end}")
plt.xticks(rotation=45)
plt.legend(title="Population")
plt.tight_layout()
plt.show(block=True)


