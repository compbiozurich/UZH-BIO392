# -*- coding: utf-8 -*-
"""
Created on Thu Oct  7 19:07:12 2021

@author: vera.flueck
"""

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import json as js
from os import chdir, getcwd
import csv

def transform_to_df(data):
    data = pd.DataFrame(data)
    #data.columns = data.iloc[0]
    data = data[1:]
    return data

def get_gene_data(cancer_type,gene_name):
    with open(cancer_type + '.csv', 'r', encoding="utf8") as read_obj:
        csv_reader = csv.reader(read_obj)
        cancer = list(csv_reader)
        #header = cancer[0]

    ids = []
    for i in cancer:
        ids.append(cancer[17])
        
        
    with open(gene_name, newline="") as read_obj:
        csv_reader = csv.reader(read_obj, delimiter="\t")
        gene_all = list(csv_reader)
        #header2 = gene_all[0]

    gene_data = []
    for line in gene_all:
        print(line)
        if line[17] in ids:
            gene_data.append(line)
            
    cancerdf = transform_to_df(cancer)
    genedf = transform_to_df(gene_data)

    # print(len(ids),len(gene_data))

    return cancerdf, genedf



lungcsv, ERBB2_new =  get_gene_data('lung','ERBB2.csv')
lungnum = lungcsv.apply(pd.to_numeric, errors='coerce').fillna(lungcsv)
    
'''
##boxplot
NCIT = sarcomanum['histologicalDiagnosis.label'].unique()
i=0
while i < len(NCIT):
    mean = sarcomanum.groupby("histologicalDiagnosis.label").get_group(NCIT[i])

    ax=plt.subplot(2, 4, i+1)
    mean.boxplot(fontsize=5)
    ax.set_xticklabels(['cnvcoverage','delcoverage','dupcoverage'],rotation=180)
    ax.set_title(NCIT[i],fontsize=7)


    i=i+1
    
## KM analysis
i=0
while i < len(NCIT):
    group = sarcomanum.groupby("histologicalDiagnosis.label").get_group(NCIT[i])
    kmf = KaplanMeierFitter()
    durations = group['info.cnvstatistics.cnvcoverage']
    event_observed = group['info.death']
    kmf.fit(durations, event_observed, label=NCIT[i])
    kmf.plot(ci_show=False)



    i=i+1
    
plt.show()

https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.plot.bar.html
DataFrame.plot.bar(x=None, y=None, **kwargs)
'''