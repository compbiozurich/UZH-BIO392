#Project 1: 

Motivation: 

Chose Chromosome 3 (no background, just because it seemed interesting) 
Goal: look at the Population structure of Chromosome 3 and hopefully get some nice plots 
Fragestellung: 


PLINK convert
1)	Download both files, the vcf.gz and cvf.gz.tbi into a folder on the desktop 
2)	Download PLINK and check in the Terminal if it works (with help function) 
3)	Convert them in the bash / terminal to a bed file 
  *	Change the file names 
  *	plink –chr3.t.vcf --make-bed --out data_plink
  * Gibt verschiedene files: ein bed, bim, fam und text file 

## LD Pruning 
1)	Code 
a.	plink --bfile chr3 --indep-pairwise 50 5 0.2 --out pruned
Parameter	Bedeutung
50	Fenstergröße: 50 SNPs werden gleichzeitig betrachtet
5	Schrittweite: Nach jedem Schritt werden 5 SNPs weitergegangen
0.2	r²-Schwelle: Wenn zwei SNPs innerhalb des Fensters r² > 0.2 haben → prune
(from chatgpt) 
Nach dem Pruning bekommst du:
•	pruned.prune.in → Liste der behaltenen SNPs
•	pruned.prune.out → Liste der entfernten SNPs
•	 not the case for us -> only one file 
Code: plink --bfile daten --extract pruned.prune.in --make-bed --out daten_gepruned

-	Did not work -> probably because the bam file did not have unique Ids -> 
o	Changed it so that there are only unique variant ids 
o	Plink –bfile chr3 -- ….
o	Then prune it again with the chr3_unique files 
Extract pruned SNPs 
-	Code: plink --bfile chr3 --extract pruned.prune.in --make-bed --out data_pruned
o	Extracts the SNPs in the “in” file from the bfiles 
o	Gives: Creates the output in binary PLINK format (producing data_pruned.bed, data_pruned.bim, data_pruned.fam).

-	The threshold was too low so we did the pruning again with a threshold of 0.1 and then even 0.05

## PCA analysis 
-	Code: plink --bfile chr3_pruned_data –pca approx --out chr3_pca

-> make a plot in R or python 
The eigenvec file: 
-	Each row represents one individual, and each column represents the value of a specific principal component for that individual.

Principal components (chatgpt)
-	Principal components are the main directions in your data that capture the most variation (differences) between samples.
-	To reduce complexity, find patterns, remove noise 
-	Principal components are linear combinations of the original variables.
-	They are ordered:	PC1 explains the most variance.		PC2 explains the second most, and so on.
-	They're orthogonal (uncorrelated) — like independent axes.
-	
-	Each sample (individual) has genotypes at many positions (e.g. SNPs).
-	PCA reduces these thousands of values to just a few components (e.g., PC1, PC2).
-	Plotting PC1 vs. PC2 can reveal:	Population structure, Admixture, Outliers or batch effects


## Admixture:
-	For windows download Ubuntu a Linux distribution 
-	Then install admixture over there from this webpage 
o	https://dalexander.github.io/admixture/download.html
-	We had very much problem, because we had under other problems to many variables/SNPs
-	The .Q file output from an ADMIXTURE run contains the ancestry proportions for each individual across the K inferred populations. (Chatgpt)
-	In ADMIXTURE, the clusters are not predefined groups — instead, they are statistical patterns of genetic variation inferred directly from your data.
-	You need external knowledge (like sample metadata or PCA) to label or interpret the clusters biologically.!!!!

Admixture is done with the bed file 
Before admixture: had to filter by minor allel frequency due to a high variance number (to high for admixture) 
