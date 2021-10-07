"""
sarcoma group: J. Chalabi, A. K. Jochum, D. Walther
bio392: survival project
"""


#%% Imports

# import pandas as pd
import csv
import numpy as np
import matplotlib.pyplot as plt


#%% Data Handling
"""
import
    gene_dataset (4)
    survival_dataset (1)
combine relevant/interesting data into 1 file
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
id1 = '5bab56c0727983b2e00aaab7'
print(len(id0), len(id1))"""


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
        print(id)
        #ids.append(id[14])


    gene_data = []
    for line in gene_all:
        if line[14] in ids:
            gene_data.append(line)

    # print(len(ids),len(gene_data))

    return cancer, gene_data


# id of csv files (survival and gene files)

survival_ids = get_gene_data('sarcoma', gene_name='erbb2')
print(survival_ids)


#%% EDA (Exploratory Data Analysis)


#%% Kaplan-Meier plot (survival plot)


#%% Barplot of CNV fraction (gene comparison)


#%% Communication
