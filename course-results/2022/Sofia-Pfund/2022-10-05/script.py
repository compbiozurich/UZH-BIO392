import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt


######### matching ids ####################
# read the sample datasets

# gene data
tp_53_group_info = pd.read_csv("biosample-tp53.tsv", sep="\t")
cdkn2a_group_info = pd.read_csv("biosample-CDKN2A.tsv", sep="\t")
myc_group_info = pd.read_csv("biosample-myc.tsv", sep="\t")
erbb2_group_info = pd.read_csv("biosample-ERBB2.tsv", sep="\t")

# tumor data
dataset = pd.read_csv("lymphoma.csv")

# match columns "sample_id" in dataset and columns "id" in group_info
# => filter for rows where "biosample_id" matches the "id"
tp53_dataset = pd.merge(dataset, tp_53_group_info, left_on = "id", right_on = "biosample_id")
tp53_dataset["group"] = "tp53"
#print(tp53_dataset)

cdkn2a_dataset = pd.merge(dataset, cdkn2a_group_info, left_on = "id", right_on = "biosample_id")
cdkn2a_dataset["group"] = "cdkn2a"
#print(cdkn2a_dataset)

myc_dataset = pd.merge(dataset, myc_group_info, left_on = "id", right_on = "biosample_id")
myc_dataset["group"] = "myc"
#print(myc_dataset)

erbb2_dataset = pd.merge(dataset, erbb2_group_info, left_on = "id", right_on = "biosample_id")
erbb2_dataset["group"] = "erbb2"
#print(erbb2_dataset)

whole_dataset = pd.concat([tp53_dataset, cdkn2a_dataset, myc_dataset, erbb2_dataset])
print(whole_dataset.shape)

whole_dataset = whole_dataset[['info.followupMonths', 'info.death', 'group']]

whole_dataset = whole_dataset.dropna()
print(whole_dataset.shape)

######### KM plot ########################
# Compute Survival
time = whole_dataset["info.followupMonths"]  # how much time has passed since the sample was collected
event = whole_dataset["info.death"]
group = whole_dataset["group"]
results = km.fit(time, event, group)
# Plot
km.plot(results)
plt.xlabel("Time (months)")
plt.ylabel("Survival Rate")
plt.show()

# interesting variables

# - individualAgeAtCollection => consider how old the person was when they were diagnosed
# - sex => 
