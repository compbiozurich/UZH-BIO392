"""
sarcoma group: J. Chalabi, A. K. Jochum, D. Walther
bio392: survival project
"""


#%% Importing Python Packages

# packages for file handling
import csv

# packages for numerical computation (arrays, matrices, data frames - more practical data types for changing & plotting)
#import numpy as np
import pandas as pd  # basically numpy with additional names for rows/columns, instead of only indeces.

# packages for plotting
import matplotlib.pyplot as plt
from lifelines import KaplanMeierFitter


#%% Data Handling
"""
our goals / todos:

- import gene_datasets (4)
- import survival_dataset (1)
=> do not combine them into 1 file (not recommended by Rahel)

- filter the datasets for interesting variables (columns), do this with a copy of the datasets

- make boxplots of ...
- make kaplan-meier of ...
"""

def extract_id_from_csv(filename):
    """
    attempt at extractin ids from some csv files (should the same process for Survival and Gene .csv files).
    :param filename: str of the filename to be scanned for ids
    :return: list ids containing all the ids (of the lines) of the input file.
    """
    ids = []

    with open('sarcoma erbb2.csv') as erbb2:
        for i, line in enumerate(erbb2):
            ids = ids.append(list(line))

"""id0 = '5bab56c0727983b2e00aaa1b'
id1 = '5bab56c0727983b2e00aaab7'"""


#%% EDA (Exploratory Data Analysis)


#%% Kaplan-Meier plot (survival plot)


#%% Barplot of CNV fraction (gene comparison)


#%% Communication

#%% - - -
#%% Functions to get gene data (cheatsheet)


def transform_to_df(data):
    data = pd.DataFrame(data)
    data.columns = data.iloc[0]
    data = data[1:]
    return data


def get_gene_data(cancer_type, gene_name):
    with open(cancer_type + '.csv', 'r') as read_obj:
        csv_reader = csv.reader(read_obj)
        cancer = list(csv_reader)
        # header = cancer[0]

    ids = []
    for id in cancer:
        ids.append(id[14])

    with open(cancer_type + '_' + gene_name + '.csv', 'r') as read_obj:
        csv_reader = csv.reader(read_obj)
        gene_all = list(csv_reader)
        # header2 = gene_all[0]

    gene_data = []
    for line in gene_all:
        """print(line[14])
        print(line[16])
        print()"""
        if line[16] in ids: # previously line[14]
            gene_data.append(line)

    cancerdf = transform_to_df(cancer)
    genedf = transform_to_df(gene_data)

    print(len(ids), len(gene_data))

    return cancerdf, genedf

# calling the functions to do the actual work
sarcoma, tp53 =  get_gene_data('sarcoma', 'tp53del')
sarcomanum = sarcoma.apply(pd.to_numeric, errors='coerce').fillna(sarcoma)

print(sarcomanum['info.followupMonths'])

sarcomanum_km


""" gene names of the other genes
get_gene_data('sarcoma erbb2.csv')
get_gene_data('sarcoma rp53.csv')
get_gene_data('sarcoma myc.csv')
get_gene_data('sarcoma cdkn2a.csv')
"""


#%% KM analysis (Kaplan-Meier / Survival Plot) (cheatsheet)

NCIT_surv = sarcomanum['histologicalDiagnosis.label'].unique()

i = 0
while i < len(NCIT_surv):

    group = sarcomanum.groupby("histologicalDiagnosis.label").get_group(NCIT_surv[i])
    kmf = KaplanMeierFitter()
    durations = group['info.cnvstatistics.cnvcoverage']  # cnvcoverage ("test for me") -> change to followup
    event_observed = group['info.death']

    kmf.fit(durations, event_observed, label=NCIT_surv[i])
    kmf.plot(ci_show=False)

    i=i+1

plt.show()


#%% Boxplot (CNV fraction) (cheatsheet)


NCIT_box = sarcomanum['histologicalDiagnosis.label'].unique()  # moved to previous chunk
i=0
while i < len(NCIT_box):
    mean = sarcomanum.groupby("histologicalDiagnosis.label").get_group(NCIT_box[i])
    ax=plt.subplot(2, 4, i+1)
    mean.boxplot(fontsize=5)
    ax.set_xticklabels(['cnvcoverage','delcoverage','dupcoverage','death'],rotation=180) # rotation=90 changed to 180
    ax.set_title(NCIT_box[i],fontsize=7)
    i = i + 1

"""boxplot(fontsize=5)
ax.set_xticklabels(['cnvcoverage','delcoverage','dupcoverage','death'],rotation=180) # rotation=90 changed to 180
ax.set_title(NCIT[i],fontsize=7)"""
