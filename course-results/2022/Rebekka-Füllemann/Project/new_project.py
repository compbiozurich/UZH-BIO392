import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt
from lifelines import KaplanMeierFitter


kmf = KaplanMeierFitter()

genes = ["ERBB2", "TP53", "MYC", "CDKN2A"]
NCIT = ['NCIT:C3493', 'NCIT:C3512', 'NCIT:C4038', 'NCIT:C4450', 'NCIT:C4917','NCIT:C5672', 'NCIT:C9133']
colorlist = ['tab:blue', 'tab:orange', 'tab:green', 'tab:red','tab:purple', 'tab:brown', 'tab:pink']
data_dict = {}
SEX=['M','F']

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
	
	merged_data.insert(0, "gene", genes[i])
	data_dict[genes[i]] = merged_data.drop(droplist)

data_dict["all"]=pd.concat([data_dict["ERBB2"],data_dict["TP53"],data_dict["MYC"],data_dict["CDKN2A"]])


for gene in genes:
	time = data_dict[gene]["info.followupMonths"]
	event=data_dict[gene]["info.death"]
	kmf.fit(time, event, label=gene)
	
	
	ax = kmf.plot(ci_show=False, show_censors=True)

ax.set(xlabel="Follow Up (Months)", ylabel="Survival", title="Genes in Comparison")
plt.show()




#### grouped by NCIt (per gene) ####

for gene in genes: 

	types = pd.get_dummies(data_dict[gene]["histological_diagnosis_id"]).columns
	
	j=0
	for i in range(len(types)):
		group = data_dict[gene].groupby("histological_diagnosis_id").get_group(types[i])

		print(f"NCIt per gene, NCIt: {types[i]}, gene: {gene}, nr: {len(group)}")

		while types[i] != NCIT[j]:
			j+=1		

		time = group["info.followupMonths"]
		event = group["info.death"]
		results = kmf.fit(time, event, label=types[i])
		ax=kmf.plot(ci_show=False, show_censors=True, color=colorlist[j])
		j+=1

	print("")

	ax.set(xlabel="Follow Up (Months)", ylabel="Survival", title=gene)
	plt.show()


print("")

#### grouped by NCIt (all genes) ####


for i in range(len(NCIT)):
	group = data_dict["all"].groupby("histological_diagnosis_id").get_group(NCIT[i])

	print(f"NCIt all genes, NCIt: {NCIT[i]}, nr: {len(group)}")

	time = group["info.followupMonths"]
	event = group["info.death"]

	results = kmf.fit(time, event, label=NCIT[i])
	ax=kmf.plot(ci_show=False, show_censors=True)


ax.set(xlabel="Follow Up (Months)", ylabel="Survival", title="all genes NCIt Comparison")
plt.show()

print("")

#### grouped by sex (all genes) ####


for i in range(len(SEX)):
	group = data_dict["all"].groupby("sex").get_group(SEX[i])
	
	print(f"sex all genes, sex: {SEX[i]}, nr: {len(group)}")

	time = group["info.followupMonths"]
	event = group["info.death"]

	results = kmf.fit(time, event, label=SEX[i])
	ax=kmf.plot(ci_show=False, show_censors=True)


ax.set(xlabel="Follow Up (Months)", ylabel="Survival", title="Sexes in Comparison (all genes)")
plt.show()
