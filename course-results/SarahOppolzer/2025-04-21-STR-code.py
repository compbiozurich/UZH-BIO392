
import requests 
import pandas as pd

# retrieve STRs near the APC gene ->  returns STRs from both panels ensembleTR 
#and gangstr_crc_hg38
resp = requests.get('https://webstr-api.lsfm.zhaw.ch/repeats/?gene_names=APC')
df_repeats = pd.DataFrame.from_records(resp.json())

#I Choose ensembleTR
# Filter STRs:
# - period == 1 (mononucleotide repeats, which are highly polymorphic)
# - panel == 'ensembleTR'
filtered_df = df_repeats[(df_repeats['period'] == 1) & (df_repeats['panel'] == 'ensembleTR')]

print("Filtered STRs:")
print(filtered_df.head())
print("Total filtered repeats:", len(filtered_df))

#get Allele frequencies
allele_freqs = []

# Loop through each repeat_id in the filtered DataFrame
for repeat_id in filtered_df['repeat_id']:
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

# Convert the collected allele frequency data to a DataFrame
df_freqs = pd.DataFrame(allele_freqs)
print("Total allele frequency entries:", len(df_freqs))


## Find the Most Polymorphic STR
unique_alleles = df_freqs.groupby('repeat_id')['n_effective'].count().reset_index()
unique_alleles = unique_alleles.rename(columns={'n_effective': 'num_alleles'})


max_alleles_row = unique_alleles.loc[unique_alleles['num_alleles'].idxmax()]
max_repeat_id = max_alleles_row[ 'repeat_id']
max_num_alleles = max_alleles_row[ 'num_alleles']

# Report the following information for this STR locus: Chromosome, start, end positions
# Lookup repeat info from df_filtered
locus_info = filtered_df[filtered_df["repeat_id"] == max_repeat_id].iloc[0]
print("STR with highest n_effective:")
print(f"Repeat ID: {max_repeat_id}")
print(f"Chromosome: {locus_info['chr']}")
print(f"Start: {locus_info['start']}")
print(f"End: {locus_info['end']}")
print(f"n_effective (max): {max_num_alleles}")

#Visualize allelel frequency
import matplotlib.pyplot as plt
import seaborn as sns


# Filter for the most polymorphic STR
df_plot = df_freqs[df_freqs['repeat_id'] == max_repeat_id]
df_plot = df_plot.dropna(subset=['n_effective', 'frequency', 'population'])

# Plot
plt.figure(figsize=(10, 6))
sns.barplot(x='n_effective',y= 'frequency', hue = "population", data = df_plot)
plt.xlabel("Allele (index)")
plt.ylabel("Frequency")
plt.title(f"Allele Frequency Distribution for STR {max_repeat_id}")
plt.xticks(rotation=90)
plt.tight_layout()
plt.show()

#Go to WebSTR, search using the chromosome and coordinates of the STR locus you found and check if the allele frequency distribution matches what you retrieved via the API
#i am very confused, it looks very different
