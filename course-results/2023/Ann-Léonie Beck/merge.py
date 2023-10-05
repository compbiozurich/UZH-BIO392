#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct  4 14:26:08 2023


@author: annlbe

df = pd.merge(ds, dfCDKN2A, on='individual_id', how = 'left')

dfgenes1 = pd.merge(dfCDKN2A, dfERBB2, on='individual_id', how = 'outer')
dfgenes2 = pd.merge(dfgenes1, dfMYC, on='individual_id', how = 'outer')
dfgenes = pd.merge(dfgenes2, dfTP53, on = 'individual_id', how = 'outer')


overlapp = pd.merge(ds, dfgenes, on='individual_id', how='inner')

"""

import pandas as pd

ds = pd.read_csv('/Users/annlbe/Desktop/ds.csv')
dfCDKN2A = pd.read_csv('/Users/annlbe/Desktop/OneDrive_1_10-4-2023/CDKN2A_progenetixdata.tsv', sep= '\t')
dfERBB2 = pd.read_csv('/Users/annlbe/Desktop/OneDrive_1_10-4-2023/ERBB2_progenetixdata.TSV', sep= '\t')
dfMYC = pd.read_csv('/Users/annlbe/Desktop/OneDrive_1_10-4-2023/MYC_progenetixdata.tsv', sep= '\t')
dfTP53 = pd.read_csv('/Users/annlbe/Desktop/OneDrive_1_10-4-2023/TP53_progenetixdata.tsv', sep= '\t')




ds= ds.rename(columns = {'individualId':'individual_id'})


dfCDKN2A= dfCDKN2A.rename(columns = {'individualId':'individual_id'})

merC = pd.merge(ds, dfCDKN2A, on = 'individual_id', how = 'inner')

merC = pd.merge(ds, dfCDKN2A, on = 'individual_id', how = 'inner')
merE = pd.merge(ds, dfERBB2, on = 'individual_id', how = 'inner')

merM = pd.merge(ds, dfMYC, on = 'individual_id', how = 'inner')
                
merT = pd.merge(ds, dfTP53, on = 'individual_id', how = 'inner')

merC['gene_source'] = 'CDKN2A'
merE['gene_source'] = 'ERBB2'
merM['gene_source'] = 'MYC'
merT['gene_source'] = 'TP53'

combine_df = pd.concat([merC, merE, merM, merT], ignore_index= True)

print(combine_df['info.death'])

print(combine_df['info.followupMonths'])


combine_df.to_csv('mergedata.csv', index= False)

import sys
import lifelines
from lifelines import KaplanMeierFitter
import matplotlib.pyplot as plt

combine_df=combine_df.fillna(0)
# data = combine_df({
#     'time' : combine_df['info.followupMonths'],
#     'event': combine_df['info.death']})



plt.figure(figsize=(10, 6))


#unique_genes= combine_df['gene_source'].unique()


#print(unique_genes)

#kaplan meier for grouped by genes
grouped = combine_df.groupby(['gene_source'])
print(grouped)




for group_name, group_data in grouped:
    kmf = KaplanMeierFitter()
    kmf.fit(group_data['info.followupMonths'], event_observed=group_data['info.death'])
    kmf.plot( label = group_name, ci_show=False)



plt.title('Kaplan-Meier Survival Curve')
plt.xlabel('Time in Months')
plt.ylabel('Survival Probability')
plt.legend
plt.ylim(0,1, 0.2)
plt.xlim(0,125, 10)
plt.show()



# kaplan meier grouped by samled tissue
group_tissue = combine_df.groupby(['sampled_tissue_label'])

for group_name, group_data in group_tissue:
    kmf = KaplanMeierFitter()
    kmf.fit(group_data['info.followupMonths'], event_observed=group_data['info.death'])
    kmf.plot( label = group_name, ci_show=False)



plt.title('Kaplan-Meier Survival Curve')
plt.xlabel('Time in Months')
plt.ylabel('Survival Probability')
plt.legend
plt.ylim(0,1, 0.2)
plt.xlim(0,125, 10)
plt.show()

# #violin plot of cnv fractions


import seaborn as sns
import numpy as np
import pandas as pd

import matplotlib as mpl
import matplotlib.pyplot as plt

import seaborn as sns
import seaborn.objects as so



ax = sns.violinplot(data=combine_df, x = 'gene_source' ,y='info.cnvstatistics.cnvfraction' )

plt.title('Violin Plot of CNV Values by Gene')
plt.xlabel('Genes')
plt.ylabel('CNV Values')
custom_x_labels = ['CDKN2A -', 'ERBB2 +', 'MYC +', 'TP53 -']
ax.set_xticklabels(custom_x_labels)
plt.ylim(0,1)

# legend_labels =['CDKN2A -', 'ERBB2 +', 'MYC +', 'TP53 - (+)']
# legend_handles = [plt.Line2D([0], [0], marker = 'o', label=label) for i, label in enumerate (legend_labels)]

# plt.legend(handles = legend_handles, title = 'Gene Duplication/Deletion', bbox_to_anchor =(1.05, 1), loc='upper right')
plt.show()

# mutation load higher for erbb2 than the ohers