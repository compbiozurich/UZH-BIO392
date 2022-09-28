# 2022-09-28 paper exercise day_06

## A copy number variation map of the human genome

### 1. Why is important to construct a CNV map on healthy individuals of various ethnicities? 
> The aim for clinical geneticists is to be able to discriminate pathogenic variants from benign variants in patients, but additional data of healthy individuals of various ethnicities are required due to the growing number of variants of unknown significance that are suspected to be involved in disease susceptibility. 

<br>

### 2. What is the CNV size that the authors defined? 
 Noted: The CNV size definition is still under debate and may be different in other literature.
> The authers defined the size to include microscopic and submicroscopic variants from 50 bp to 3 Mb. 

<br>

### 3. What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies? 
The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). 
> The primary approaches used for CNV detection are Microarrays and next-generation sequencing (NGS).
> The first studies to assay CNVs primarily used microarrays with bacterial artificial chromosomes (BACs) and oligonucleotide arrays. Subsequent microarrays have included both comparative genomic hybridization (CGH) and SNP-based arrays. During the past few years use of NGS technologies has been particularly widespread.
> 
Array-based methods:
> advantages: suitable for studying quantitative variants, identifying deletions and duplications however methods vary in their ability to detect deletions or duplications (more duplications are missed by SNP-based array platforms than by array CGH). 

> limitations: limited resolution capacity, inflated estimates of toatal CNV content due to low resolution and overestimatin of breakpoints, detection of small variants

NGS:
> advantages: detection of small variants, detection of deletions, high sensitivity and the ability to provide accurate sequence-level breakpoint resolution

> limitations: detection of duplications

<br>

### 4. What are the two criteria for cluster filtering? And why did they do this filtering? 
criteria 1:
> number of distinct subjects that carry the variant

criteria 2:
> number of distinct studies with at least one variant in the cluster

Reason for filtering:
> The filter based on the number of subjects excluded singletons, and variants that are supported by a larger number of subjects are less likely to be false positives. The filter based on the number of studies ensured the exclusion of potential study-specific artefacts

<br>

### 5. What are thresholds in stringency level 1, inclusive map, and stringent map respectively?
> CNVRs that were recognized with higher stringency have support from a higher number of subjects and studies.

Thresholds in stringency level 1:
> at least one subject and one study for each variant

Thresholds in inclusive map (stringency level 2):
> at least two subjects and one study for each variant

Thresholds in stringent map (stringency level 12):
> at least two subjects and two studies

<br>

### 6. Which percentage of the genome contributes to CNV in inclusive map and stringent map respectively? 

> 9.5% of the human genome contributes to CNV in the inclusive map (7.5% for losses and 3.9% for gains) 

> 4.8% the human genome contributes to CNV in the stringent map (3.6% for losses and 2.3% for gains) 

<br>

### 7. By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper? 
> By my intution non-coding genes are more variable. They found that the exons of non-coding genes had the highest proportion of copy number variable sequence, which is higher than the exons of protein-coding genes.

<br>

### 8. The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential? (Homozygous deleted genes)
> They seem to be non-essential genes, as the individuals lacking them still seem to be healthy. Their function may be redundant or they could be related to late-onset phenotypic consequences that don't substantially reduce the fitness. 

<br>

### 9. If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV? (Clinical application of the CNV map part in Discussion)
> This map is useful as a tool in the investigation of CNVs for medical applications. To assess the clinical importance of a CNV found in a case subject, the criteria could include: whether it is found among the CNVRs of the CNV  map and whether it overlaps with medically relevant genes. There are no solid boundaries between what we recognize as traits and diseases, nor between variants that are classified as benign or neutral and variants that are classified as predisposing risk factors or disease- related. Genomic background, including ethnicity, can influence the thresholds.

