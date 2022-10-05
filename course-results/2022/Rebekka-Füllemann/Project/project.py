import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt


genes = ["ERBB2", "TP53", "MYC", "CDKN2A"]
data_dict = {}


##### ID #####

for i in range(len(genes)):
	# read the sample datasets
	dataset = pd.read_csv(genes[i] + "_biosample.tsv", sep="\t")
	group_info = pd.read_csv("lung.csv")

	# match columns "biosample_id" in dataset and columns "id" in group_info
	data_dict[genes[i]] = pd.merge(dataset, group_info, left_on = "biosample_id", right_on = "id")

print(data_dict["TP53"].columns)



#### lung.csv => group_info

# id

# info.followupMonths
# info.death

# historicalDiagnosis.id
# sex


#### genes

# biosampleid




