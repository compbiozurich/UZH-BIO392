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
#print(whole_dataset.shape)

whole_dataset = whole_dataset[['info.followupMonths', 'info.death', 'group', 'histologicalDiagnosis.id', 'info.cnvstatistics.cnvfraction', 'sex']]

whole_dataset = whole_dataset.dropna()
print("dataset information")
#print("nr samples:", whole_dataset.shape[0])
#print("nr features:", whole_dataset.shape[1])
whole_dataset.info()

######### KM plot ########################
# Compute Survival based on gene
time = whole_dataset["info.followupMonths"]  # how much time has passed since the sample was collected
event = whole_dataset["info.death"]
group = whole_dataset["group"]
results = km.fit(time, event, group)
# Plot
km.plot(results)
plt.show()

# Compute Survival based on sex
time = whole_dataset["info.followupMonths"]  # how much time has passed since the sample was collected
event = whole_dataset["info.death"]
sex = whole_dataset["sex"]
results_2 = km.fit(time, event, sex)
# Plot
km.plot(results_2)
plt.show()


######### more plots ####################

# frequencies of CNVs for each gene of interest
import seaborn as sns
plt.figure(figsize=(8,5))
sns.countplot(x='group', data=whole_dataset, palette='rainbow')
plt.title("Nr of CNVs Samples by Gene in the `lymphoma.cvs` dataset")
plt.xlabel("Gene")
plt.ylabel("Count")
plt.show()

# CNV distribution in different tumor types (violinplot)
plt.figure(figsize=(20,6))
sns.violinplot(x='histologicalDiagnosis.id',y="info.cnvstatistics.cnvfraction",data=whole_dataset, palette='rainbow')
plt.title("Violin Plot of CNV fraction by Tumor Type")
plt.xlabel("NCIT code of the Tumor")
plt.show()

# select only most common malignancies NCIT codes:

print(whole_dataset['histologicalDiagnosis.id'].unique())
# NCIT:C4663 - Splenic Marginal Zone Lymphoma
# NCIT:C3163 - Chronic Lymphocytic Leukemia
# NCIT:C3366 - Sezary Syndrome
# NCIT:C27753 - Acute Myeloid Leukemia Not Otherwise Specified
# NCIT:C4337 - Mantle Cell lymphoma
# NCIT:C80280 Diffuse Large B-Cell Lymphoma, Not Otherwise Specified
# NCIT:C8851 Diffuse Large B-Cell Lymphoma
# NCIT:C3467 Primary Cutaneous T-Cell Non-Hodgkin Lymphoma
# NCIT:C3720 Anaplastic Large Cell Lymphoma

ncit_codes = ["NCIT:C3467", "NCIT:C3163", "NCIT:C8851", "NCIT:C4337"]
filtered_data = whole_dataset[whole_dataset['histologicalDiagnosis.id'].isin(ncit_codes)]
plt.figure(figsize=(20,6))
sns.violinplot(x='histologicalDiagnosis.id',y="info.cnvstatistics.cnvfraction",data=filtered_data, palette='rainbow')
plt.title("Violin Plot of CNV fraction by Tumor Type")
plt.xlabel("NCIT code of the Tumor")
plt.show()

plt.figure(figsize=(20,6))
sns.violinplot(x='histologicalDiagnosis.id',y="info.cnvstatistics.cnvfraction",data=tp53_dataset)
plt.title("Violin Plot of CNV fraction by Tumor Type for the TP53 gene")
plt.xlabel("NCIT code of the Tumor")
plt.ylabel("CNV fraction") # what fraction of the TP53 gene has CNV (statistics for all samples of a specific malignancy)
plt.show()

plt.figure(figsize=(20,6))
sns.violinplot(x='histologicalDiagnosis.id',y="info.cnvstatistics.cnvfraction",data=cdkn2a_dataset)
plt.title("Violin Plot of CNV fraction by Tumor Type for the CDKN2A gene")
plt.xlabel("NCIT code of the Tumor")
plt.ylabel("CNV fraction")
plt.show()

plt.figure(figsize=(20,6))
sns.violinplot(x='histologicalDiagnosis.id',y="info.cnvstatistics.cnvfraction",data=erbb2_dataset)
plt.title("Violin Plot of CNV fraction by Tumor Type for the ERBB2 gene")
plt.xlabel("NCIT code of the Tumor")
plt.ylabel("CNV fraction")
plt.show()

plt.figure(figsize=(20,6))
sns.violinplot(x='histologicalDiagnosis.id',y="info.cnvstatistics.cnvfraction",data=myc_dataset)
plt.title("Violin Plot of CNV fraction by Tumor Type for the MYC gene")
plt.xlabel("NCIT code of the Tumor")
plt.ylabel("CNV fraction")
plt.show()


#plt.figure(figsize=(10,6))
#sns.violinplot(x='histologicalDiagnosis.id',y="info.cnvstatistics.cnvfraction",data=whole_dataset, hue='group', palette='rainbow')
#plt.title("Violin Plot of CNV distribution by Tumor Type, Separated by Gene")
#plt.xlabel("NCIT code of the malignancy")
#plt.show()
