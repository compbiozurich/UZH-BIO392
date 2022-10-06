

#==============================================================================#
# Imports =====================================================================#
import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt
#==============================================================================#

# load datasets
uro_df = pd.read_csv("../uro_data/uro.csv")
df_uro_CDKN2A = pd.read_csv("../uro_data/CDKN2A.tsv",sep='\t')
df_uro_ERB2 = pd.read_csv("../uro_data/ERB2.tsv",sep='\t')
df_uro_myc = pd.read_csv("../uro_data/myc.tsv",sep='\t')
df_uro_TP53 = pd.read_csv("../uro_data/TP53.tsv",sep='\t')

# define survival reference ids
df_uro_ids = list(uro_df["individualId"])

# extract ids out of Progenetix data
df_uro_CDKN2A_ids = list(df_uro_CDKN2A["individual_id"])
df_uro_ERB2_ids = list(df_uro_ERB2["individual_id"])
df_uro_myc_ids = list(df_uro_myc["individual_id"])
df_uro_TP53_ids = list(df_uro_TP53["individual_id"])

# define lists
compare_CDKN2A = []
compare_ERB2 = []
compare_myc = []
compare_TP53 = []

# extract matching ids
for id in df_uro_CDKN2A_ids:
    if id in df_uro_ids:
        compare_CDKN2A.append(id)

for id in df_uro_ERB2_ids:
    if id in df_uro_ids:
        compare_ERB2.append(id)

for id in df_uro_myc_ids:
    if id in df_uro_ids:
        compare_myc.append(id)

for id in df_uro_TP53_ids:
    if id in df_uro_ids:
        compare_TP53.append(id)

# define dictionary for temporarely storing the data
temp_storage = {
        "ids": [],
        "death": [],
        "follow_up": [],
        "CDKN2A": [],
        "ERBB2": [],
        "MYC": [],
        "TP53": [],
        "other": [],
        "histologicalDiagnosis": [],
        "histologicalDiagnosisLabel": [],
        }

for index in range(len(uro_df["individualId"])):
    temp_storage["ids"].append(uro_df["individualId"][index])
    temp_storage["death"].append(uro_df["info.death"][index])
    temp_storage["follow_up"].append(uro_df["info.followupMonths"][index])
    temp_storage["histologicalDiagnosis"].append(uro_df["histologicalDiagnosis.id"][index])
    temp_storage["histologicalDiagnosisLabel"].append(uro_df["histologicalDiagnosis.label"][index])

    if uro_df["individualId"][index] in compare_CDKN2A:
        temp_storage["CDKN2A"].append(1)
    else:
        temp_storage["CDKN2A"].append(0)

    if uro_df["individualId"][index] in compare_ERB2:
        temp_storage["ERBB2"].append(1)
    else:
        temp_storage["ERBB2"].append(0)

    if uro_df["individualId"][index] in compare_myc:
        temp_storage["MYC"].append(1)
    else:
        temp_storage["MYC"].append(0)

    if uro_df["individualId"][index] in compare_TP53:
        temp_storage["TP53"].append(1)
    else:
        temp_storage["TP53"].append(0)

    if uro_df["individualId"][index] not in compare_TP53 and uro_df["individualId"][index] not in compare_myc and uro_df["individualId"][index] not in compare_ERB2 and uro_df["individualId"][index] not in compare_CDKN2A:
        temp_storage["other"].append(1)
    else:
        temp_storage["other"].append(0)

final_data = pd.DataFrame.from_dict(temp_storage)
final_data.to_csv('../uro_data/uro_final.csv', index=False)

print(final_data)
