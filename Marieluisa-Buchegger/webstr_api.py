# -*- coding: utf-8 -*-
"""
Created on Wed Apr 16 09:27:58 2025

@author: swiss
"""

import requests 
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#Import STRs
resp = requests.get('https://webstr-api.lsfm.zhaw.ch/repeats/?gene_names=APC')
df_repeats = pd.DataFrame.from_records(resp.json())

#Filter STRs
df_filtered = df_repeats[
    (df_repeats['panel'] == 'ensembleTR') & 
    (df_repeats['period'] == 1)]

print(df_filtered.columns)
#df_filtered['unique_alleles'] = 0 
print("Filtered STRs:")
print(df_filtered.head())
print("Total filtered repeats:", len(df_filtered))


#Retrieve Allele Frequencies

allele_freqs = []

# Loop through each repeat_id in the filtered DataFrame
for repeat_id in df_filtered['repeat_id']:
    url = f"https://webstr-api.lsfm.zhaw.ch/allfreqs/?repeat_id={repeat_id}"
    print(f"Querying URL: {url}")
    r = requests.get(url)
    if r.status_code == 200:
        data = r.json()
        print(f"Got {len(data)} entries for repeat_id {repeat_id}")
        # Append the repeat_id to each returned entry
        for entry in data:
            entry['repeat_id'] = repeat_id
            allele_freqs.append(entry)
    else:
        print(f"Request failed for repeat_id {repeat_id} with status code {r.status_code}")

# Convert allele frequency list to a DataFrame
df_freqs = pd.DataFrame(allele_freqs)
print("Total allele frequency entries:", len(df_freqs))

#Find the most polymorphic STR
# n_effective: number of alleles
#num_called: samples

unique_alleles = df_freqs.groupby("repeat_id")["n_effective"].count().reset_index()
unique_alleles = unique_alleles.rename(columns = {"n_effective": "num_alleles"})

# Identify the STR locus with the highest number of alleles
max_alleles_row = unique_alleles.loc[unique_alleles["num_alleles"].idxmax()]

max_repeat_id = max_alleles_row["repeat_id"]

max_num_alleles = max_alleles_row["num_alleles"]


# Report the following information for this STR locus: Chromosome, start, end positions
# Lookup repeat info from df_filtered
locus_info = df_filtered[df_filtered["repeat_id"] == max_repeat_id].iloc[0]
print("STR with highest n_effective:")
print(f"Repeat ID: {max_repeat_id}")
print(f"Chromosome: {locus_info['chr']}")
print(f"Start: {locus_info['start']}")
print(f"End: {locus_info['end']}")
print(f"n_effective (max): {max_num_alleles}")

#Visualize allele frequency
# Filter for the most polymorphic STR
df_plot = df_freqs[df_freqs['repeat_id'] == max_repeat_id]
# Make sure the data is clean and doesn't contain any NaNs
df_plot = df_plot.dropna(subset=['n_effective', 'frequency', 'population'])

import seaborn as sns
# Plot
plt.figure(figsize=(10, 6))
sns.barplot(x="n_effective", y='frequency', hue="population", data = df_plot)
plt.xlabel("Number of Alleles")
plt.ylabel("Frequency")
plt.title(f"Allele Frequency Distribution for STR {max_repeat_id}")
plt.xticks(rotation=90)
plt.tight_layout()
plt.show()


