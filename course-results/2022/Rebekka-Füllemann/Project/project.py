import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt


genes = ["ERBB2", "TP53", "MYC", "CDKN2A"]

for i in range(len(genes)):
	# read the sample datasets
	dataset = pd.read_csv(genes[i] + "_biosample.tsv", sep="\t")
	group_info = pd.read_csv("lung.csv")

	# print(dataset["biosample_id"])
	# print(group_info ["id"])



	group = []
	for sind, sid in enumerate(dataset["biosample_id"]):
	    for ind, id in enumerate(group_info["id"]):
	        if sid == id:
	            group.append(id)
	            continue


	print(genes[i],end=" ")
	print(len(group))
