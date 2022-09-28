##  A copy number variation map of the human genome (Zarrei et al 2015)

Paper link: https://www.nature.com/articles/nrg3871
 
**1. Why is important to construct a CNV map on healthy individuals of various ethnicities?
(Introduction)**

The DNA sequence along human chromosomes is contantly changing, and this process enables humans to evolve and adapt.
A new trait can be adaptive or maladaptive in different enviromental contexts (e.g. pathogentic CNVs). 

**Wanted**: be able to discriminate pathogenic or high-risk variants from benign variants in patients by using information about CNVs found in healthy individuals. To give a complete representation of what the genotype of an healthy individual can be, need to include data from various ethnicities or choose the control population s.t. it makes the most sense for comparison with the sample of interest. 


**2. What is the CNV size that the authors defined? (Box 1 mentioned in introduction)**
Noted: The CNV size definition is still under debate and may be different in other literature

> **Copy number variation (CNV).** A genomic segment of at least 50 bp that differs in copy number based on the comparison of two or more genomes.

**3. What are the primary approaches used for CNV detection? And what are the advantages
and limitations of these technologies? (CNV discoveries)**

Microarrays and next-generation sequencing (NGS) are the primary approaches used for CNV detection.

**Array-based methods**

😄 Advantages: study quantitative variants (estimate total CNV content)

😞 Limitations: miss variants that are small, limited resolution capacity

**Sequencing-based methods**

😄 Advantages: smaller variants can be detected, high sensitivity

😞 Limitations: lack of probes in regions of the genome that contain segmental duplications

**4. The authors used clustering method to combine data from different studies into merged
CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And
why did they do this filtering? (The CNV map)**

Clusters were then filtered on the basis of:
1) the number of distinct subjects that carry the variant 👉 exclude singletons and avoid false-positives for variants that are present in large nr of subjects
2) the number of distinct studies with at least one variant in the cluster 👉 exclude potential study-specific artefacts

**5. What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent
map (stringency level 12) respectively? (The CNV map)**

General: CNV map
> The aim of the CNV map is to document the variability of the human genome in healthy individuals from various populations. To capture the maximum extent of variability, we combined variants from different studies into a single map. Common variants would be detected in different individuals and ethnicities.

* *map with stringency level 1*: the map is supported only by at least one subject and one study;
* *inclusive map (stringengy level 2)*: at least two subjects and one study for each variant 
* *stringent map (stringency level 12)*: at least two subjects and two studies

**6. Which percentage of the genome contributes to CNV in inclusive map and stringent map
respectively? (Properties of the CNV map)**

* inclusive map: 9.5%
* stringent map: 4.8%

**7. By your intuition, which kind of genes are more variable between protein-coding genes and
non-coding genes? How about their findings in this paper? (Functional impact of CNV)**

*Idea*: different genomic elements are expected to be under different degrees of constraint for variation in copy number. 

Intuitively, it would make more sense if variotion is mostly occurring in introns (non-coding sequences): no phenotypic outcome (avoid disease).

In the study, they found that *"the exons of non-coding genes had the highest proportion of copy number variable sequence"*. They also found that *"long intergenic non-coding RNAs (lincRNAs) were enriched in CNVRs. Promoters were enriched in CNVRs (FIG. 3) compared with the entire genome"*.

**8. The authors generated a null CNV map and found genes for which at least 85% of the
exons were homozygous deleted. What are the functions of these genes? And why did the
authors say that they seem to be non-essential? (Homozygous deleted genes)**

**9. If you are a medical doctor, how do you use this map as a tool to assess the clinical
importance of a CNV? (Clinical application of the CNV map part in Discussion)**
