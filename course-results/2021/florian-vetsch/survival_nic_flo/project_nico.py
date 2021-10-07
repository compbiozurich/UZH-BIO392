#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct  7 10:55:23 2021

@author: nicozala
"""

import pandas as pd
import numpy as np

directory = '/Users/nicozala/Desktop/7 - HS 21/BIO392/github/UZH-BIO392/course-results/2021/florian-vetsch/survival_nic_flo/'

ns_data = pd.read_csv(directory+'ns.csv', sep = ',')
CDKN2A = pd.read_csv(directory+'CDKN2A.csv', sep = ',')
MYC = pd.read_csv(directory+'MYC.csv', sep = ',')
ERBB2 = pd.read_csv(directory+'ERBB2.csv', sep = ',')
TP53 = pd.read_csv(directory+'TP53.csv', sep = ',')


ns_ids = list(ns_data.iloc[:,0])


genes = ['CDKN2A', 'MYC', 'ERBB2', 'TP53']
for name in genes:
    ns_data[genes] = 0
    

for i,id_ in enumerate(ns_ids):
    if id_ in MYC['_id']:
        print('True')
        ns_data.at[i, 'MYC'] += 1