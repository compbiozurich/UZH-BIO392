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

# Functions to get gene data (cheatsheet)

def transform_to_df(data):
    """
    transform ... data format to pandas data frame format.
    :param data: input dataset of type
    :return: same dataset but as a pandas data frame (pd.DataFrame)
    """
    data = pd.DataFrame(data)
    data.columns = data.iloc[0]
    data = data[1:]
    return data


def get_gene_data(cancer_type, gene_name):

    with open(cancer_type + '.csv', 'r') as read_obj:
        csv_reader = csv.reader(read_obj)
        cancer = list(csv_reader)
        header = cancer[0]  # the header row of the data set

    ids = []
    for id in cancer:
        ids.append(id[14])  # extract the ids of ... what measurement?

    with open(cancer_type + '_' + gene_name + '.csv', 'r') as read_obj:
        csv_reader = csv.reader(read_obj)
        gene_all = list(csv_reader)
        # header2 = gene_all[0]

    gene_data = []
    for line in gene_all:
        if line[16] in ids: # previously line[14]
            gene_data.append(line)

    cancerdf = transform_to_df(cancer)
    genedf = transform_to_df(gene_data)

    print(len(ids), len(gene_data))

    return cancerdf, genedf, cancer  # added return variable 'cancer', a list version of the cancer gene CNV data set

# calling the functions for saving data sets to usable variables here.
sarcoma, tp53, tp53_list =  get_gene_data('sarcoma', 'tp53del')
    # survival set (pd.dataframe), cancer gene CNV set (pd.dataframe),

sarcomanum = sarcoma.apply(pd.to_numeric, errors='coerce').fillna(sarcoma)
    # changes format from pd.dataframe to some numeric format (which one? what changed, simply no column names?)

#print(sarcomanum['info.followupMonths'])

""" gene names of the other genes
get_gene_data('sarcoma erbb2.csv')
get_gene_data('sarcoma rp53.csv')
get_gene_data('sarcoma myc.csv')
get_gene_data('sarcoma cdkn2a.csv')
"""


#%% EDA (Exploratory Data Analysis)


#%% Kaplan-Meier plot (survival plot)
"""plots: weird behaviour of plotting windows:
if either one kind of plot is drawn, the other one can not be drawn within the same execution.
idea: are both plotted when the plot output is saved to a file? (then only pycharm plotting is buggy)
idea: is it an issue with the multi plot usage (plt.subplot())?
"""


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


#%% Barplot of CNV fraction (gene comparison)


#%% Communication


#%% KM analysis (Kaplan-Meier / Survival Plot) (cheatsheet)

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

plt.show()

"""boxplot(fontsize=5)
ax.set_xticklabels(['cnvcoverage','delcoverage','dupcoverage','death'],rotation=180) # rotation=90 changed to 180
ax.set_title(NCIT[i],fontsize=7)"""
