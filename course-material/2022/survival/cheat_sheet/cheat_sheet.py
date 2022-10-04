import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt


######### matching ids #################### 
# read the sample datasets
dataset = pd.read_csv("dataset.csv")
group_info = pd.read_csv("group_info.csv")

# match columns "sample_id" in dataset and columns "id" in group_info
# dataset = pd.merge(dataset, group_info, left_on = "sample_id", right_on = "id")
group_1 = group_info["group"]
group_2 = []
for sind, sid in enumerate(dataset["sample_id"]):
    for ind, id in enumerate(group_info["id"]):
        if sid == id:
            group_2.append(group_1[ind])
            continue
dataset["group"] = group_2

######### KM plot ########################
# Compute Survival
time = dataset["Time"]
event = dataset["Censoring"]
group = dataset["group"]
results = km.fit(time, event, group)
# Plot
km.plot(results)
plt.show()

######### ploting examples ####################
# create a figure instance
fig, ax = plt.subplots(nrows = 2, ncols = 2)

# boxplot
ax[0, 0].boxplot([dataset["gene_1"], dataset["gene_2"]])
ax[0, 0].set_xticklabels(["Gene_1", "Gene_2"])
ax[0, 0].set(xlabel = "Genes", ylabel = "Expression")
ax[0, 0].set_title("boxplot_1")

# horizontal boxplot
ax[0, 1].boxplot([dataset["gene_3"], dataset["gene_4"]], vert = False)
ax[0, 1].set_yticklabels(["Gene_3", "Gene_4"])
ax[0, 1].set(xlabel = "Expression", ylabel = "Genes")
ax[0, 1].set_title("boxplot_2")

# violinplot
ax[1, 0].violinplot([dataset["gene_1"], dataset["gene_2"]])
ax[1, 0].set_xticks([1, 2])
ax[1, 0].set_xticklabels(["Gene_1", "Gene_2"])
ax[1, 0].set(xlabel = "Genes", ylabel = "Expression")
ax[1, 0].set_title("violinplot_1")

# horizontal violinplot
ax[1, 1].violinplot([dataset["gene_3"], dataset["gene_4"]], vert = False)
ax[1, 1].set_yticks([1, 2])
ax[1, 1].set_yticklabels(["Gene_3", "Gene_4"])
ax[1, 1].set(xlabel = "Expression", ylabel = "Genes")
ax[1, 1].set_title("violinplot_2")

fig.suptitle("Plotting Examples")
plt.tight_layout()
plt.show()

