# -*- coding: utf-8 -*-
"""
Created on Fri Oct  8 09:31:38 2021

@author: Florian Vetsch
"""

import pandas as pd
import numpy as np

## file prep
directory = 'C:\\Users\\FW\\Desktop\\Uni\\21HS\\Bio392\\UZH-BIO392\\course-results\\2021\\florian-vetsch\\survival_nic_flo\\'

ns_data = pd.read_csv(directory+'ns.csv', sep = ',')
CDKN2A = pd.read_csv(directory+'CDKN2A.csv', sep = ',')
MYC = pd.read_csv(directory+'MYC.csv', sep = ',')
ERBB2 = pd.read_csv(directory+'ERBB2.csv', sep = ',')
TP53 = pd.read_csv(directory+'TP53.csv', sep = ',')


ns_ids = list(ns_data.iloc[:,0])


genes = ['CDKN2A', 'MYC', 'ERBB2', 'TP53']
for name in genes:
    ns_data[name] = 0
    
# fill in dummy variables if indels of genes were detected in sample
for i,id_ in enumerate(ns_ids):
    if id_ in list(MYC['_id']):
        ns_data.at[i, 'MYC'] += 1
    if id_ in list(CDKN2A['_id']):
        ns_data.at[i, 'CDKN2A'] += 1
    if id_ in list(ERBB2['_id']):
        ns_data.at[i, 'ERBB2'] += 1
    if id_ in list(TP53['_id']):
        ns_data.at[i, 'TP53'] += 1
 


no_na_survival = ns_data[['_id','histologicalDiagnosis.id', 'TP53', 'ERBB2',
                          'CDKN2A','MYC','info.followupMonths','info.death',]].dropna()

# subsets for tumor types
C3222 = no_na_survival[no_na_survival['histologicalDiagnosis.id'] == "NCIT:C3222"]
C3270 = no_na_survival[no_na_survival['histologicalDiagnosis.id'] == "NCIT:C3270"]


# create overview of NCIT codes
hist = list(no_na_survival['histologicalDiagnosis.id'].unique())
num_uniq = list(range(len(hist)))
for i, el in enumerate(hist):
    num_uniq[i] = len(no_na_survival[no_na_survival['histologicalDiagnosis.id'] == el])
NCITs = pd.DataFrame()
NCITs['types'] = hist
NCITs['count'] = num_uniq

# will look at NCITs with count > 100
major_NCIT = no_na_survival[(no_na_survival['histologicalDiagnosis.id'] == "NCIT:C3017") | \
        (no_na_survival['histologicalDiagnosis.id'] == "NCIT:C3058") |  \
        (no_na_survival['histologicalDiagnosis.id'] == "NCIT:C3222") | \
        (no_na_survival['histologicalDiagnosis.id'] == "NCIT:C3270")]

grou = list(major_NCIT['histologicalDiagnosis.id'].replace(["NCIT:C3017","NCIT:C3058","NCIT:C3222","NCIT:C3270"],['0','1','2','3']))
grou = [int(i) for i in grou] 
major_NCIT['histologicalDiagnosis.id'] = grou 

      
from lifelines import KaplanMeierFitter
import matplotlib.pyplot as plt
plt.rcParams.update({'font.size': 25})
plt.style.use('tableau-colorblind10')

def survival_plot(df, group_var, group_label, title):  
    durations = df['info.followupMonths']
    event_observed = df['info.death']
    
    ## create a kmf object
    kmf = KaplanMeierFitter() 
    
    groups = df[group_var] 
    for i, label in enumerate(group_label):
        gr = (groups == i)
        
        kmf.fit(durations[gr], event_observed[gr], label=group_var + '_' + group_label[i])
        kmf.plot(show_censors = True, ci_show=False)
        plt.xlabel('Time(months)')
        plt.ylabel('P(survival)')
        plt.title('Survial analysis considering INDELs in selected genes' + title)

## plot different NCITs
#survival_plot(major_NCIT, 'histologicalDiagnosis.id', ['C3017','C3058','C3222','C3270'], ' across four different Nervous System Neoplasm (NCIT:C3268)')


# plot different Gene INDEL's
survival_plot(no_na_survival, 'TP53', ['not_deleted','deleted'], ' for various Nervous System Neoplasm (NCIT:C3268)')
survival_plot(no_na_survival, 'CDKN2A', ['not_deleted','deleted'], ' for various Nervous System Neoplasm (NCIT:C3268)')

survival_plot(no_na_survival, 'ERBB2', ['not_duplicated','duplicated'], ' for various Nervous System Neoplasm (NCIT:C3268)')
survival_plot(no_na_survival, 'MYC', ['not_duplicated','duplicated'], ' for various Nervous System Neoplasm (NCIT:C3268)')



survival_plot(C3222, 'TP53', ['not_deleted','deleted'], ' in Medulloblastoma (NCIT:C3222)')
survival_plot(C3222, 'CDKN2A', ['not_deleted','deleted'], ' in Medulloblastoma (NCIT:C3222)')

survival_plot(C3222, 'ERBB2', ['not_duplicated','duplicated'], ' in Medulloblastoma (NCIT:C3222)')
survival_plot(C3222, 'MYC', ['not_duplicated','duplicated'], ' in Medulloblastoma (NCIT:C3222)')



survival_plot(C3222, 'TP53', ['not_deleted','deleted'], ' in Neuroblastoma (NCIT:C3270)')
survival_plot(C3222, 'CDKN2A', ['not_deleted','deleted'], ' in Neuroblastoma (NCIT:C3270)')

survival_plot(C3222, 'ERBB2', ['not_duplicated','duplicated'], ' in Neuroblastoma (NCIT:C3270)')
survival_plot(C3222, 'MYC', ['not_duplicated','duplicated'], ' in Neuroblastoma (NCIT:C3270)')



