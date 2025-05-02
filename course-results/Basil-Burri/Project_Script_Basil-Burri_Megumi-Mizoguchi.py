# -*- coding: utf-8 -*-
"""
Created on Wed Apr 30 10:16:47 2025

@author: bburr
"""

# Workflow Description:
# This script analyzes Short Tandem Repeat (STR) genotype data to explore population structure and classification.
# The workflow includes loading and filtering data, performing dimensionality reduction (PCA and UMAP), clustering
# with K-means, and supervised classification using Random Forest. Results are visualized through scatter plots,
# bar plots, heatmaps, and histograms to assess clustering and classification performance.

# BEWARE: The script can take up to 10 minutes to run and to create all plots!

# ============================================================================
# Step 1: Import Libraries
# ============================================================================
import pandas as pd
import numpy as np
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, classification_report, adjusted_rand_score, normalized_mutual_info_score, confusion_matrix
import matplotlib.pyplot as plt
import seaborn as sns
import umap


# ============================================================================
# Step 2: Set Plot Styling Parameters
# ============================================================================
plt.style.use('seaborn')
FONT_SIZE_TITLE = 20
FONT_SIZE_LABEL = 16
FONT_SIZE_TICKS = 14
FONT_SIZE_LEGEND = 14
FONT_SIZE_ANNOT = 12


# ============================================================================
# Step 3: Load Data
# ============================================================================
str_data = pd.read_csv("C:/Users/bburr/FASTA/project-str-population/kg_matrix_chr1.csv")
print(str_data.head())

sample_info = pd.read_csv("C:/Users/bburr/FASTA/project-str-population/sample_type.csv")
print(sample_info.head())

total_samples = len(sample_info)
print(f"Total number of samples: {total_samples}")


# ============================================================================
# Step 4: Filter Data
# ============================================================================
missing_threshold = 0.1
str_data = str_data.dropna(thresh=int((1 - missing_threshold) * str_data.shape[1]))
str_data = str_data.dropna(axis=1, thresh=int((1 - missing_threshold) * str_data.shape[0]))
str_data = str_data.loc[str_data.std(axis=1) > 0.5]

str_data_t = str_data.drop(columns=['Unnamed: 0']).T
str_data_t.columns = [f'locus_{i}' for i in range(str_data_t.shape[1])]
print(str_data_t.shape)


# ============================================================================
# Step 5: Prepare Data for Analysis
# ============================================================================
str_data_t = str_data_t.fillna(str_data_t.mean())
scaler = StandardScaler()
str_scaled = scaler.fit_transform(str_data_t)


# ============================================================================
# Step 6: Perform PCA Analysis
# ============================================================================
pca = PCA(n_components=2)
principal_components = pca.fit_transform(str_scaled)

pca_df = pd.DataFrame(data=principal_components, columns=['PC1', 'PC2'], index=str_data_t.index)
pca_df = pca_df.merge(sample_info[['sample', 'Population', 'Superpopulation']], left_index=True, right_on='sample')

print("Explained variance ratio:", pca.explained_variance_ratio_)


# ============================================================================
# Step 7: Visualize PCA Results
# ============================================================================
# Plot 1: PCA with Population True Labels
plt.figure(figsize=(8, 6))
for population in pca_df['Population'].unique():
    subset = pca_df[pca_df['Population'] == population]
    plt.scatter(subset['PC1'], subset['PC2'], label=population, alpha=0.7)
plt.xlabel('Principal Component 1', fontsize=FONT_SIZE_LABEL)
plt.ylabel('Principal Component 2', fontsize=FONT_SIZE_LABEL)
plt.title('PCA of STR Genotypes by Population (True Labels)', fontsize=FONT_SIZE_TITLE)
plt.legend(loc='center left', bbox_to_anchor=(1.02, 0.5), fontsize=FONT_SIZE_LEGEND, title='True Labels', 
           title_fontproperties={'weight': 'bold', 'size': FONT_SIZE_LEGEND}, ncol=2)
plt.xticks(fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
plt.tight_layout()
plt.show()

# Plot 2: PCA with Superpopulation True Labels
plt.figure(figsize=(8, 6))
for superpopulation in pca_df['Superpopulation'].unique():
    subset = pca_df[pca_df['Superpopulation'] == superpopulation]
    plt.scatter(subset['PC1'], subset['PC2'], label=superpopulation, alpha=0.7)
plt.xlabel('Principal Component 1', fontsize=FONT_SIZE_LABEL)
plt.ylabel('Principal Component 2', fontsize=FONT_SIZE_LABEL)
plt.title('PCA of STR Genotypes by Superpopulation (True Labels)', fontsize=FONT_SIZE_TITLE)
plt.legend(fontsize=FONT_SIZE_LEGEND, title='True Labels', 
           title_fontproperties={'weight': 'bold', 'size': FONT_SIZE_LEGEND})
plt.xticks(fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
plt.show()


# ============================================================================
# Step 8: Perform K-means Clustering
# ============================================================================
kmeans = KMeans(n_clusters=5, random_state=42)
clusters = kmeans.fit_predict(str_scaled)
pca_df['Cluster'] = clusters


# ============================================================================
# Step 9: Visualize K-means Clustering on PCA
# ============================================================================
# Plot 3: PCA with K-means Cluster Labels
plt.figure(figsize=(10, 8))
cluster_names = {0: 'AMR', 1: 'EAS', 2: 'SAS', 3: 'AFR', 4: 'EUR'}
for cluster in pca_df['Cluster'].unique():
    subset = pca_df[pca_df['Cluster'] == cluster]
    plt.scatter(subset['PC1'], subset['PC2'], label=cluster_names[cluster], alpha=0.7, s=50)
plt.xlabel('Principal Component 1', fontsize=FONT_SIZE_LABEL)
plt.ylabel('Principal Component 2', fontsize=FONT_SIZE_LABEL)
plt.title('PCA of STR Genotypes with K-means Cluster Labels', fontsize=FONT_SIZE_TITLE)
plt.legend(fontsize=FONT_SIZE_LEGEND, title='Clusters', 
           title_fontproperties={'weight': 'bold', 'size': FONT_SIZE_LEGEND})
plt.xticks(fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
plt.show()


# ============================================================================
# Step 10: Evaluate K-means Clustering Accuracy
# ============================================================================
true_labels = pca_df['Superpopulation']
predicted_clusters = pca_df['Cluster']
ari = adjusted_rand_score(true_labels, predicted_clusters)
nmi = normalized_mutual_info_score(true_labels, predicted_clusters)
print(f"Adjusted Rand Index (ARI): {ari:.3f}")
print(f"Normalized Mutual Information (NMI): {nmi:.3f}")


# ============================================================================
# Step 11: Visualize K-means Contingency Table
# ============================================================================
# Plot 4: Contingency Table: Superpopulation vs K-means Clusters
conf_matrix = pd.crosstab(pca_df['Superpopulation'], pca_df['Cluster'])
plt.figure(figsize=(6, 5))
sns.heatmap(conf_matrix, annot=True, fmt="d", cmap="YlGnBu", annot_kws={"size": FONT_SIZE_ANNOT+2}, square=False)
plt.title("True Superpopulation vs K-means Clusters", fontsize=FONT_SIZE_TITLE)
plt.xlabel("K-means Cluster", fontsize=FONT_SIZE_LABEL)
plt.ylabel("Superpopulation", fontsize=FONT_SIZE_LABEL)
plt.xticks(fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
plt.tight_layout()
plt.show()


# ============================================================================
# Step 12: Perform UMAP Analysis
# ============================================================================
umap_model = umap.UMAP(n_components=2, random_state=42)
umap_embedding = umap_model.fit_transform(str_scaled)
umap_df = pd.DataFrame(data=umap_embedding, columns=['UMAP1', 'UMAP2'], index=str_data_t.index)
umap_df['Cluster'] = clusters
umap_df = umap_df.merge(sample_info[['sample', 'Population', 'Superpopulation']], left_index=True, right_on='sample')


# ============================================================================
# Step 13: Visualize UMAP Results
# ============================================================================
# Plot 5: UMAP with K-means Cluster Labels
plt.figure(figsize=(10, 8))
for cluster in umap_df['Cluster'].unique():
    subset = umap_df[umap_df['Cluster'] == cluster]
    plt.scatter(subset['UMAP1'], subset['UMAP2'], label=cluster_names[cluster], alpha=0.7, s=50)
plt.xlabel('UMAP Component 1', fontsize=FONT_SIZE_LABEL)
plt.ylabel('UMAP Component 2', fontsize=FONT_SIZE_LABEL)
plt.title('UMAP of STR Genotypes with K-means Cluster Labels', fontsize=FONT_SIZE_TITLE)
plt.legend(fontsize=FONT_SIZE_LEGEND, title='Clusters', 
           title_fontproperties={'weight': 'bold', 'size': FONT_SIZE_LEGEND}, loc='lower right')
plt.xticks(fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
plt.show()


# ============================================================================
# Step 14: Perform Random Forest Classification
# ============================================================================
X = str_scaled
y = sample_info.set_index('sample').loc[str_data_t.index, 'Population']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

rf = RandomForestClassifier(random_state=42)
rf.fit(X_train, y_train)
y_pred = rf.predict(X_test)
print("Accuracy:", accuracy_score(y_test, y_pred))
print("Classification Report:\n", classification_report(y_test, y_pred))


# ============================================================================
# Step 15: Demonstrate Random Individual Prediction
# ============================================================================
random_idx = np.random.choice(X_test.shape[0])
random_individual = X_test[random_idx]
random_true_label = y_test.iloc[random_idx]
random_pred_label = rf.predict([random_individual])[0]
print("\nDemonstration: Random Individual Prediction")
print("---------------------------------------------")
print(f"Random Individual Index: {random_idx}")
print(f"Predicted Population: {random_pred_label}")
print(f"True Population: {random_true_label}")
print(f"Prediction Correct: {random_pred_label == random_true_label}")


# ============================================================================
# Step 16: Analyze and Visualize Precision Scores
# ============================================================================
report = classification_report(y_test, y_pred, output_dict=True)
classes = [key for key in report.keys() if key not in ('accuracy', 'macro avg', 'weighted avg')]
precision_scores = [report[key]['precision'] for key in classes]
precision_df = pd.DataFrame({'Population': classes, 'Precision': precision_scores})
precision_df = precision_df.sort_values(by='Precision', ascending=False)
sorted_classes = precision_df['Population'].tolist()
sorted_precision_scores = precision_df['Precision'].tolist()

population_order = pca_df['Population'].unique()
colors = plt.rcParams['axes.prop_cycle'].by_key()['color']
pop_color_map = {pop: colors[i % len(colors)] for i, pop in enumerate(population_order)}
bar_colors = [pop_color_map[pop] for pop in sorted_classes]

# Plot 6: Precision Scores by Population
plt.figure(figsize=(16, 8))
bars = plt.bar(sorted_classes, sorted_precision_scores, color=bar_colors, edgecolor='black', alpha=0.7)
plt.title('Precision Scores by Population in Random Forest Classification', fontsize=FONT_SIZE_TITLE)
plt.xlabel('Population', fontsize=FONT_SIZE_LABEL)
plt.ylabel('Precision Score', fontsize=FONT_SIZE_LABEL)
plt.grid(True, axis='y', alpha=0.3)
plt.xticks(rotation=45, ha='right', fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
for bar in bars:
    yval = bar.get_height()
    plt.text(bar.get_x() + bar.get_width()/2, yval + 0.01, f'{yval:.2f}', ha='center', va='bottom', fontsize=FONT_SIZE_ANNOT)
plt.tight_layout()
plt.savefig('rf_precision_barplot_sorted.png', dpi=300)
plt.show()

# Plot 7: Precision Scores for Top 3 and Bottom 4 Populations
top_3 = precision_df.head(3)
bottom_4 = precision_df.tail(4)
selected_df = pd.concat([top_3, bottom_4])
selected_classes = selected_df['Population'].tolist()
selected_precision_scores = selected_df['Precision'].tolist()
selected_colors = [pop_color_map[pop] for pop in selected_classes]

plt.figure(figsize=(8, 8))
bars = plt.bar(selected_classes, selected_precision_scores, color=selected_colors, edgecolor='black', width=0.6, alpha=0.7)
plt.title('Top 3 and Bottom 4 Precision Scores by Population', fontsize=FONT_SIZE_TITLE)
plt.xlabel('Population', fontsize=FONT_SIZE_LABEL)
plt.ylabel('Precision Score', fontsize=FONT_SIZE_LABEL)
plt.grid(True, axis='y', alpha=0.3)
plt.xticks(rotation=45, ha='right', fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
for bar in bars:
    yval = bar.get_height()
    plt.text(bar.get_x() + bar.get_width()/2, yval + 0.01, f'{yval:.2f}', ha='center', va='bottom', fontsize=FONT_SIZE_ANNOT+4)
plt.tight_layout()
plt.savefig('rf_precision_barplot_top3_bottom4.png', dpi=300)
plt.show()


# ============================================================================
# Step 17: Visualize Random Forest Confusion Matrices
# ============================================================================
# Plot 8: Confusion Matrix: True vs Predicted Population
pop_labels = sorted(y_test.unique())
pop_conf_matrix = confusion_matrix(y_test, y_pred, labels=pop_labels)
plt.figure(figsize=(10, 8))
sns.heatmap(pop_conf_matrix, annot=True, fmt="d", cmap="YlGnBu", annot_kws={"size": FONT_SIZE_ANNOT+2}, square=False,
            xticklabels=pop_labels, yticklabels=pop_labels)
plt.title("True vs Predicted Population by Random Forest", fontsize=FONT_SIZE_TITLE)
plt.xlabel("Predicted Population", fontsize=FONT_SIZE_LABEL)
plt.ylabel("True Population", fontsize=FONT_SIZE_LABEL)
plt.xticks(rotation=45, ha='right', fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
plt.tight_layout()
plt.show()

# Plot 9: Confusion Matrix: True vs Predicted Superpopulation
pop_to_super = sample_info.set_index("Population")["Superpopulation"].to_dict()
y_test_super = y_test.map(pop_to_super)
y_pred_super = pd.Series(y_pred, index=y_test.index).map(pop_to_super)
super_conf_matrix = confusion_matrix(y_test_super, y_pred_super, labels=sorted(y_test_super.unique()))
plt.figure(figsize=(6, 5))
sns.heatmap(super_conf_matrix, annot=True, fmt="d", cmap="YlGnBu", annot_kws={"size": FONT_SIZE_ANNOT+2}, square=False,
            xticklabels=sorted(y_test_super.unique()), yticklabels=sorted(y_test_super.unique()))
plt.title("True vs Predicted Superpopulation by Random Forest", fontsize=FONT_SIZE_TITLE)
plt.xlabel("Predicted Superpopulation", fontsize=FONT_SIZE_LABEL)
plt.ylabel("True Superpopulation", fontsize=FONT_SIZE_LABEL)
plt.xticks(fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
plt.tight_layout()
plt.show()


# ============================================================================
# Step 18: Calculate Population and Superpopulation Metrics
# ============================================================================
ari_pop = adjusted_rand_score(y_test, y_pred)
nmi_pop = normalized_mutual_info_score(y_test, y_pred)
print(f"Population-level Adjusted Rand Index (ARI): {ari_pop:.3f}")
print(f"Population-level Normalized Mutual Information (NMI): {nmi_pop:.3f}")

ari_sup = adjusted_rand_score(y_test_super, y_pred_super)
nmi_sup = normalized_mutual_info_score(y_test_super, y_pred_super)
print(f"Superpopulation-level Adjusted Rand Index (ARI): {ari_sup:.3f}")
print(f"Superpopulation-level Normalized Mutual Information (NMI): {nmi_sup:.3f}")


# ============================================================================
# Step 19: Visualize Sample Distribution by Population
# ============================================================================
pop_counts = sample_info['Population'].value_counts().reset_index()
pop_counts.columns = ['Population', 'Count']
pop_counts = pop_counts[pop_counts['Population'].isin(sorted_classes)]
pop_counts = pop_counts.sort_values(by='Count', ascending=False)
bar_colors = [pop_color_map[pop] for pop in pop_counts['Population']]

# Plot 10: Histogram of Sample Distribution by Population
plt.figure(figsize=(12, 6))
bars = plt.bar(pop_counts['Population'], pop_counts['Count'], color=bar_colors, edgecolor='black', alpha=0.7)
plt.title('Distribution of Samples by Population Background', fontsize=FONT_SIZE_TITLE)
plt.xlabel('Population', fontsize=FONT_SIZE_LABEL)
plt.ylabel('Number of Samples', fontsize=FONT_SIZE_LABEL)
plt.xticks(rotation=45, ha='right', fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
plt.grid(True, axis='y', alpha=0.3)
for bar in bars:
    yval = bar.get_height()
    plt.text(bar.get_x() + bar.get_width()/2, yval + 0.5, f'{int(yval)}', ha='center', va='bottom', fontsize=FONT_SIZE_ANNOT)
plt.tight_layout()
plt.savefig('population_distribution_histogram_sorted.png', dpi=300)
plt.show()


# ============================================================================
# Step 20: Visualize Sample Distribution for Specific Populations
# ============================================================================
specific_pops = ['ITU', 'CHS', 'GWD', 'ASW', 'IBS', 'ACB', 'BEB']
specific_counts = sample_info[sample_info['Population'].isin(specific_pops)]['Population'].value_counts().reset_index()
specific_counts.columns = ['Population', 'Count']
specific_counts = specific_counts.sort_values(by='Count', ascending=False)
specific_bar_colors = [pop_color_map.get(pop, 'gray') for pop in specific_counts['Population']]

# Plot 11: Histogram of Sample Distribution for Specific Populations
plt.figure(figsize=(12, 6))
bars = plt.bar(specific_counts['Population'], specific_counts['Count'], color=specific_bar_colors, edgecolor='black', alpha=0.7)
plt.title('Distribution of Samples with Top 3 and Bottom 4 Precision', fontsize=FONT_SIZE_TITLE)
plt.xlabel('Population', fontsize=FONT_SIZE_LABEL)
plt.ylabel('Number of Samples', fontsize=FONT_SIZE_LABEL)
plt.xticks(rotation=45, ha='right', fontsize=FONT_SIZE_TICKS)
plt.yticks(fontsize=FONT_SIZE_TICKS)
plt.grid(True, axis='y', alpha=0.3)
for bar in bars:
    yval = bar.get_height()
    plt.text(bar.get_x() + bar.get_width()/2, yval + 0.5, f'{int(yval)}', ha='center', va='bottom', fontsize=FONT_SIZE_ANNOT)
plt.tight_layout()
plt.savefig('specific_populations_histogram.png', dpi=300)
plt.show()
