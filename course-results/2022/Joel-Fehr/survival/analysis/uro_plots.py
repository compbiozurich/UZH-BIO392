
#==============================================================================#
# Imports =====================================================================#
import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt
from lifelines import KaplanMeierFitter
#==============================================================================#

dataset = pd.read_csv("../uro_data/uro_final.csv")

#==============================================================================#
# Preparing
genes = ["CDKN2A", "ERBB2", "MYC", "TP53", "other"]
#==============================================================================#
# check for nan values
nan_data = dataset[dataset.isna().any(axis=1)]
print(nan_data)

# drop na values
dataset = dataset.dropna()

# Plotting
i=0
while i < len(genes):
    group = dataset.groupby(genes[i]).get_group(1)
    kmf = KaplanMeierFitter()
    durations = group['follow_up']
    event_observed = group['death']
    kmf.fit(durations, event_observed, label=genes[i])
    kmf.plot(ci_show=False)
    i=i+1

plt.show()
