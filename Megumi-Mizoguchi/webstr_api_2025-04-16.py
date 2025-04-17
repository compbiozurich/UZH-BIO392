# WebSTR API Exercise

import requests 
import pandas as pd
import time
import matplotlib.pyplot as plt

# Step 1: Get STRs for gene APC
resp = requests.get('https://webstr-api.lsfm.zhaw.ch/repeats/?gene_names=APC')
df_repeats = pd.DataFrame.from_records(resp.json())

# Step 2: Filter STRs (panel = ensembleTR, period = 1)
df_filtered = df_repeats[
    (df_repeats['panel'] == 'ensembleTR') & 
    (df_repeats['period'] == 1)
]

print(df_filtered)

# Step 3: Extract all repeat IDs
str_ids = df_filtered['repeat_id'].tolist()

# Step 4: Loop through repeat IDs to fetch frequencies individually
all_freqs = []

for rid in str_ids:
    url = f'https://webstr-api.lsfm.zhaw.ch/allfreqs/?repeat_id={rid}'
    resp = requests.get(url)
    if resp.status_code == 200:
        result = resp.json()
        if isinstance(result, list):
            all_freqs.extend(result)
    else:
        print(f"⚠️ Failed to fetch repeat_id {rid}: {resp.status_code}")
    time.sleep(0.1)  # Be polite to the server

# Step 5: Convert collected data to DataFrame
df_freqs = pd.DataFrame.from_records(all_freqs)
print(df_freqs.head())

# Step 6: Count number of unique alleles per repeat_id
allele_counts = df_freqs.groupby('repeat_id')['n_effective'].nunique().reset_index()
allele_counts = allele_counts.rename(columns={'n_effective': 'unique_alleles'})

# Step 7: Find the STR with the highest number of alleles
most_poly = allele_counts.sort_values(by='unique_alleles', ascending=False).iloc[0]
most_poly_id = most_poly['repeat_id']
print(f"\nMost polymorphic repeat_id: {most_poly_id}")
print(f"Number of unique alleles: {most_poly['unique_alleles']}")

# Step 8: Get location info from df_filtered
str_info = df_filtered[df_filtered['repeat_id'] == most_poly_id][['chr', 'start', 'end']]
print("\nLocation of most polymorphic STR:")
print(str_info.to_string(index=False))

# Step 9: Plot allele frequencies by population
# Filter for the most polymorphic STR
poly_df = df_freqs[df_freqs['repeat_id'] == most_poly_id]

# Pivot the data: rows = allele length, columns = population
pivot_df = poly_df.pivot_table(
    index='n_effective',
    columns='population',
    values='frequency',
    fill_value=0
)

# Plot
pivot_df.plot(kind='bar', figsize=(10, 6))

plt.xlabel('Allele Length (n_effective)')
plt.ylabel('Frequency')
plt.title(f'Allele Frequencies by Population (STR {most_poly_id})')
plt.xticks(rotation=0)
plt.grid(axis='y', linestyle='--', alpha=0.6)
plt.legend(title='Population')
plt.tight_layout()
plt.show()

