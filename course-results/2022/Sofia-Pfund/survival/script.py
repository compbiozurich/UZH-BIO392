import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt

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

cdkn2a_dataset = pd.merge(dataset, cdkn2a_group_info, left_on = "id", right_on = "biosample_id")
cdkn2a_dataset["group"] = "cdkn2a"

myc_dataset = pd.merge(dataset, myc_group_info, left_on = "id", right_on = "biosample_id")
myc_dataset["group"] = "myc"


erbb2_dataset = pd.merge(dataset, erbb2_group_info, left_on = "id", right_on = "biosample_id")
erbb2_dataset["group"] = "erbb2"

whole_dataset = pd.concat([tp53_dataset, cdkn2a_dataset, myc_dataset, erbb2_dataset])
#print(whole_dataset.shape)

# select features of interest:
whole_dataset = whole_dataset[['info.followupMonths', 'info.death', 'group', 'histologicalDiagnosis.id',
                                'info.cnvstatistics.cnvfraction', 'sex', 'pathologicalStage.label',
                                'info.cnvstatistics.dupfraction',
                                'info.cnvstatistics.delfraction']]

# remove NaN:
whole_dataset = whole_dataset.dropna()

# get info about the dataset:
whole_dataset.info()

######### KM plots ##############################################################

# Compute Survival based on gene
time = whole_dataset["info.followupMonths"]  # how much time has passed since the sample was collected
event = whole_dataset["info.death"]
group = whole_dataset["group"]
results = km.fit(time, event, group)
# Plot
km.plot(results)
plt.show()

################################################################################

# Compute Survival based on sex
time = whole_dataset["info.followupMonths"]  # how much time has passed since the sample was collected
event = whole_dataset["info.death"]
sex = whole_dataset["sex"]
results_2 = km.fit(time, event, sex)
# Plot
km.plot(results_2)
plt.show()

################################################################################

# Frequencies of CNVs samples for each gene of interest
import seaborn as sns
plt.figure(figsize=(8,5))
sns.countplot(x='group', data=whole_dataset, palette='rainbow')
plt.title("Nr of CNVs Samples by Gene in the `lymphoma.cvs` dataset")
plt.xlabel("Gene")
plt.ylabel("Count")
plt.show()

################################################################################

## CNV fraction by tumor stage: does CNV fraction increases by tumor stage?

# sort the dataset by stage
whole_dataset = whole_dataset.sort_values(['pathologicalStage.label'])

# plot
plt.figure(figsize=(20,6))
sns.violinplot(x='pathologicalStage.label',y="info.cnvstatistics.cnvfraction", data=whole_dataset)
plt.title("Violin Plot of CNV fraction based on Tumor Stage")
plt.xlabel("Tumor stage")
plt.ylabel("CNV fraction") # what fraction of the TP53 gene has CNV (statistics for all samples of a specific malignancy)
plt.show()

################################################################################

# filter the data:
ncit_codes = ["NCIT:C80280", "NCIT:C4340", "NCIT:C3246", "NCIT:C4337", "NCIT:C27753", "NCIT:C8851"]
names = ["Diffuse Large B-Cell Lymphoma", "Peripheral T-Cell Lymphoma", "Mycosis Fungoides", "Mantle Cell Lymphoma", "Acute Myeloid Leukemia", "Diffuse Large B-Cell Lymphoma"]
filtered_data = whole_dataset[whole_dataset['histologicalDiagnosis.id'].isin(ncit_codes)]

def my_func(row):
    if row['histologicalDiagnosis.id'] == "NCIT:C80280":
        val = 'Diffuse Large B-Cell Lymphoma'
    elif row['histologicalDiagnosis.id']  == "NCIT:C4340":
        val = 'Peripheral T-Cell Lymphoma'
    elif row['histologicalDiagnosis.id']  == "NCIT:C3246":
        val = 'Mycosis Fungoides'
    elif row['histologicalDiagnosis.id']  == "NCIT:C4337":
        val = 'Mantle Cell Lymphoma'
    elif row['histologicalDiagnosis.id']  == "NCIT:C27753":
        val = 'Acute Myeloid Leukemia'
    elif row['histologicalDiagnosis.id']  == "NCIT:C8851":
        val = 'Diffuse Large B-Cell Lymphoma'
    return val

filtered_data['name'] = filtered_data.apply(my_func, axis=1)

####################### Plotting ###############################################

## KM-curve based on tumor type
time = filtered_data["info.followupMonths"]  # how much time has passed since the sample was collected
event = filtered_data["info.death"]
tumor = filtered_data["name"]
results_3 = km.fit(time, event, tumor)
km.plot(results_3)
plt.show()

## CNV fraction by tumor type (violin plot)
plt.figure(figsize=(15,6))
sns.violinplot(x='name',y="info.cnvstatistics.cnvfraction", data=filtered_data, palette='rainbow')
plt.title("Violin Plot of CNV fraction by Tumor Type")
plt.xlabel("Tumor Type")
plt.ylabel("CNV fraction")
plt.show()

## CNV fraction by gene (violin plot)
plt.figure(figsize=(10,6))
sns.violinplot(x='group',y="info.cnvstatistics.cnvfraction", data=filtered_data, palette='rainbow')
plt.title("Violin Plot of CNV fraction vs. Mutated Gene")
plt.xlabel("Mutated Gene")
plt.ylabel("CNV fraction")
plt.show()

plt.figure(figsize=(10,6))
sns.violinplot(x='group',y="info.cnvstatistics.dupfraction", data=filtered_data, palette='rainbow')
plt.title("Violin Plot of CNV duplication fraction vs. Mutated Gene")
plt.xlabel("Mutated Gene")
plt.ylabel("CNV duplication fraction")
plt.show()

plt.figure(figsize=(10,6))
sns.violinplot(x='group',y="info.cnvstatistics.delfraction", data=filtered_data, palette='rainbow')
plt.title("Violin Plot of CNV deletion fraction vs. Mutated Gene")
plt.xlabel("Mutated Gene")
plt.ylabel("CNV deletion fraction")
plt.show()

###################### Additional Code #########################################

#plt.figure(figsize=(20,6))
#sns.violinplot(x='histologicalDiagnosis.id',y="info.cnvstatistics.cnvfraction",data=whole_dataset, palette='rainbow')
#plt.title("Violin Plot of CNV fraction by Tumor Type")
#plt.xlabel("NCIT code of the Tumor")
#plt.show()

#plt.figure(figsize=(10,6))
#sns.violinplot(x='histologicalDiagnosis.id',y="info.cnvstatistics.cnvfraction",data=whole_dataset, hue='group', palette='rainbow')
#plt.title("Violin Plot of CNV distribution by Tumor Type, Separated by Gene")
#plt.xlabel("NCIT code of the malignancy")
#plt.show()
