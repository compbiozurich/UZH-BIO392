# -*- coding: utf-8 -*-
"""
Created on Thu Oct  7 11:32:35 2021

@author: Florian Vetsch
"""
import pandas as pd
import numpy as np

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
 

# 'histologicalDiagnosis.id', icdoTopography.label, individualAgeAtCollection
# info.cnvstatistics.cnvfraction, provenance.geoLocation.properties.country
no_na_survival = ns_data[['_id','histologicalDiagnosis.id', 'TP53', 'ERBB2',
                          'CDKN2A','MYC','info.followupMonths','info.death',]].dropna()
# no_na_survival['tot_indel'] = no_na_survival['TP53'] + no_na_survival['ERBB2'] + no_na_survival['CDKN2A'] + no_na_survival['MYC']
       

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

grou = list(major_NCIT['histologicalDiagnosis.id'].replace(["NCIT:C3017","NCIT:C3058","NCIT:C3222","NCIT:C3270"],['1','2','3','4']))

grou = [int(i) for i in grou] 
major_NCIT['histologicalDiagnosis.id'] = grou 

      
from lifelines import KaplanMeierFitter

durations = major_NCIT['info.followupMonths']
event_observed = major_NCIT['info.death']

## create a kmf object
kmf = KaplanMeierFitter() 


groups = major_NCIT['histologicalDiagnosis.id'] 
i1 = (groups == 1)
i2 = (groups == 2)
i3 = (groups == 3)
i4 = (groups == 4)

kmf.fit(durations[i1], event_observed[i1], label='C3017')
a1 = kmf.plot(ci_show=False)

## fit the model for 2nd cohort
kmf.fit(durations[i2], event_observed[i2], label='C3058')
kmf.plot(ci_show=False)

kmf.fit(durations[i3], event_observed[i3], label="C3222")
kmf.plot(ci_show=False)

kmf.fit(durations[i4], event_observed[i4], label="C3270")
kmf.plot(ci_show=False)



#
### Fit the data into the model
#kmf.fit(durations, event_observed,label='Kaplan Meier Estimate')
#
### Create an estimate
#kmf.plot() 
## ci_show=False

#kmf1 = KaplanMeierFitter() ## instantiate the class to create an object
#
#

#
### fit the model for 1st cohort
#kmf1.fit(durations[i0], event_observed[i0], label='No')
#a1 = kmf1.plot(ci_show=False)
#
### fit the model for 2nd cohort
#kmf1.fit(durations[i4], event_observed[i4], label='all')
#kmf1.plot(ax=a1, ci_show=False)


#kmf1 = KaplanMeierFitter() ## instantiate the class to create an object



#groups = no_na_survival['histologicalDiagnosis.id']    
#i0 = (groups == 0)   
#i1 = (groups == 1)      ## group i1 , having the pandas series  for the 1st cohort
#i2 = (groups == 2)     ## group i2 , having the pandas series  for the 2nd cohort
#i3 = (groups == 3)
#i4 = (groups == 4)
#
### fit the model for 1st cohort
#kmf1.fit(durations[i0], event_observed[i0], label='No')
#a1 = kmf1.plot(ci_show=False)
#
### fit the model for 2nd cohort
#kmf1.fit(durations[i4], event_observed[i4], label='all')
#kmf1.plot(ax=a1, ci_show=False)





