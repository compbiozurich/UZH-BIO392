import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt


genes = ["ERBB2", "TP53", "MYC", "CDKN2A"]
data_dict = {}



for i in range(len(genes)):

	droplist= []

	# read the sample datasets
	dataset = pd.read_csv(genes[i] + "_biosample.tsv", sep="\t")
	group_info = pd.read_csv("lung.csv")

	# match columns "biosample_id" in dataset and columns "id" in group_info
	merged_data = pd.merge(dataset, group_info, left_on = "biosample_id", right_on = "id")

	for k,j in enumerate(merged_data["info.followupMonths"]):
		if np.isnan(j):
			droplist.append(k)

	data_dict[genes[i]] = merged_data.drop(droplist)


#print(data_dict["TP53"])
#data_dict["TP53"].to_csv("TP53merged.csv")


#### data_dict[xyz]

# biosample_id

# info.followupMonths
# info.death

# historicalDiagnosis.id -> NCIt
# sex

##### F=1 M=0

#data_dict["TP53"].insert(0, "test", 1)

#print(pd.get_dummies(data_dict["TP53"]["sex"])["F"])

data_dict["TP53"]["sex_value"]= pd.get_dummies(data_dict["TP53"]["sex"])["F"]

time = data_dict["TP53"]["info.followupMonths"]
event = data_dict["TP53"]["info.death"]
group = data_dict["TP53"]["sex_value"]
results = km.fit(time, event, group)
# Plot
km.plot(results)
plt.show()

