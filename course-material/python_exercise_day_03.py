# %%
import pandas as pd
import csv
import requests


#%%
url = 'https://progenetix.org/services/pgxsegvariants?biosample_ids=pgxbs-kftvku7r,pgxbs-m3io2hj8,pgxbs-kftvkuvy'
request = requests.get(url)
line = request.text.splitlines()
seg_list = []


for items in line:

    if '#' not in items:
        seg_list.append(items.split('\t'))
#or just delete the rows with "#"
# seg_list = line.copy()
# for i in range(len(line)):
#     items = line[i]
#     if '#' not in items:
#         break
# seg_list=seg_list[i:-1]


columns = seg_list[0]
del (seg_list[0])
df = pd.DataFrame(seg_list, columns=columns)
#%%
#Import Seaborn and Matplotlib:
import seaborn as sns
import matplotlib.pyplot as plt
#%%
#Explore the Data: You can start by exploring the data to understand its structure and distribution.
# For example, you can check the distribution of the "variant type" with "reference_name" using a histogram:
sns.histplot(data=df, x='reference_name',hue="variant_type", bins=1)
plt.xlabel('Chromosomes')
plt.title('Distribution of chromosomes')
plt.show()
#%%
# Count the number of CNV events per biosample
biosample_counts = df['biosample_id'].value_counts()

# Create a bar plot or count plot
plt.figure(figsize=(12, 6))  # Adjust the figure size as needed
sns.countplot(data=df, x='biosample_id', order=biosample_counts.index)
plt.xticks(rotation=90)  # Rotate x-axis labels for better readability

plt.xlabel('Biosample ID')
plt.ylabel('Count of CNV Events')
plt.title('Count of CNV Events per Biosample')
plt.show()
#%%
#histplot for the distribution of CNV event length
plt.figure(figsize=(8, 6))
sns.histplot(data=df, x=df['end'].astype(int) - df['start'].astype(int), bins=20, kde=True)
plt.xlabel('CNV Event Length')
plt.ylabel('Frequency')
plt.title('Distribution of CNV Event Lengths')
plt.show()

#%%
plt.figure(figsize=(15,15))
#Heatmap of Correlations:

#We create a contingency table using pd.crosstab with the biosample_id and chromosome columns.
# This table will show the frequency of each combination of biosample and chromosome.
correlation_matrix = pd.crosstab(df["reference_name"],df["biosample_id"])
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm')
plt.title('Correlation Heatmap')
plt.show()
