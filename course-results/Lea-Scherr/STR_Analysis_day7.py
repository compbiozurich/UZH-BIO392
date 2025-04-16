# -*- coding: utf-8 -*-
"""
Created on Wed Apr 16 09:14:40 2025

@author: leasc
"""

# identify the STR locus with the highest number of unique allele lengths 
# across samples from the 1000 Genomes Project

import requests 
import pandas as pd
import matplotlib.pyplot as plt

resp = requests.get('https://webstr-api.lsfm.zhaw.ch/repeats/?gene_names=APC')
df_repeats = pd.DataFrame.from_records(resp.json())

print(df_repeats['panel'][200])

# Filter STRs
# Panel selection: Choose the panel relevant to your analysis.
# GangSTR
# Repeat unit size: Keep only STRs with period = 1, as these are generally more polymorphic.
filtered_strs = df_repeats[
    (df_repeats['panel'] == 'gangstr_crc_hg38') &
    (df_repeats['period'] == 1)
]

filtered_strs1 = df_repeats[
    (df_repeats['panel'] == 'ensembleTR') &
    (df_repeats['period'] == 1)
]


# Retrieve Allele Frequencies

# For the filtered STRs, use the following endpoint to retrieve allele frequencies:

# https://webstr-api.lsfm.zhaw.ch/allfreqs/
str_ids = filtered_strs1['repeat_id'].tolist()

allele_freqs = []

for str_id in str_ids:
    freq_url = f'https://webstr-api.lsfm.zhaw.ch/allfreqs/?repeat_id={str_id}'
    resp = requests.get(freq_url)
    data = resp.json()
    df_freq = pd.DataFrame.from_records(data)
    allele_freqs.append(df_freq)
        
combined_df = pd.concat(allele_freqs, ignore_index=True)


# Find the Most Polymorphic STR

#     Count the number of unique allele lengths for each STR.
#     Identify the STR locus with the highest number of alleles.
#     Report the following information for this STR locus: Chromosome, start, end positions
mx = 0
repeat_id_mx = ""
for repeat_id in combined_df['repeat_id'].unique():    
    unique_lengts = combined_df.loc[combined_df['repeat_id'] == repeat_id, 'n_effective'].unique()   
    n_unique_len = len(unique_lengts)    
    if mx < n_unique_len:        
        mx = n_unique_len        
        repeat_id_mx = repeat_id
print(repeat_id_mx)
print(mx)
        
row = filtered_strs1.loc[filtered_strs1['repeat_id'] == repeat_id_mx]
    
start = row['start'].values[0]
end = row['end'].values[0]
chrom = row['chr'].values[0]
print(f"Chromosome: {chrom}, Start: {start}, End: {end}")
    

# Visualize Allele Frequencies

max_repeat = combined_df.loc[combined_df['repeat_id'] == repeat_id_mx]

# Step 7: Plot allele frequency distribution
plt.figure(figsize=(10, 6))
plt.bar(max_repeat['n_effective'].astype(int), max_repeat['frequency'], color='skyblue')
plt.xlabel('Allele Length')
plt.ylabel('Frequency')
plt.title(f'Allele Frequency Distribution for STR: {repeat_id_mx}')
plt.xticks(rotation=45)
plt.tight_layout()
plt.grid(axis='y')
plt.show()