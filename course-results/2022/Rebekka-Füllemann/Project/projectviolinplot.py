import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt
from lifelines import KaplanMeierFitter
import seaborn as sns

fig, ax = plt.subplots(nrows = 2, ncols = 2)
ax[1, 0].violinplot([dataset["TP53_biosample.tsv"], dataset["MYC_biosample.tsv"]])
ax[1, 0].set_xticks([1, 2])
ax[1, 0].set_xticklabels(["TP53", "MYC"])
ax[1, 0].set(xlabel = "Genes", ylabel = "Expression")
ax[1, 0].set_title("violinplot_1")
