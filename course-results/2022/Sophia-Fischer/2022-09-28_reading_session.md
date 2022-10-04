# 1. Why is important to construct a CNV map on health individuals of various ethnicities?

Constant evolution and adpation of the chromosmal DNA sequence of humans causes a great amount of variation. CNVs are part an example for this variation which allows for different phenotypes. These different traits can be adaptive or maladpative. To distinguish benign mutations from pathogenic ones there a map of CNVs of healthy individuals from various ethnicities is essential.

# 2. What is the CNV size that the authors defined? 
Currently, the map contains a range of variants from 50bp to 3Mb


(DGV has collected and curated 2,391,408 CNVs (comprising 202,431 CNVRs))

Noted: The CNV size definition is still under debate and may be different in other literature
# 3. What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies? (CNV discoveries)
*no single one of these strategies can currently capture the entire spectrum of structural variations in the genome*
## Microarrays
- comparative genomic hybridization (CGH) 
- SNP-based arrays
- advantage: suitable for studying quantitative variants
- limitation:limited resolution capacity
## NGS
- advantage: high sensitivity, provide accurate sequence-level breakpoint resolution
- limitation: call smaller variants and are biased towards detections of deletions

## BAC CGH 
- advantage: easier detection of deletions or duplications
- limitations: miss many small variants

# 4. The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering? (The CNV map)
criteria: 
- each posible variant pair had at leas 50% reciprocal overlap
filter:
- number of distinct subjects that carry the variant (excludes singletons)
- number of distinct studies with at least one variant in the cluster (excludes potential study-specific artefacts) \
--> merge into final consensus CNVRs

# 5. What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively?

## threshold in stringency level 1
at least one subject and on study (included all CNV and CNVRs!)
## threshold in stringency level 2
at least two subjects and one study for each variant
## threshold in stringency level 12
at least two subjects and two studies

# 6. Which percentage of the genome contributes to CNV in inclusive map and stringent map respectively? (Properties of the CNV map)
level 1: 9.5% total, 1.1%-16.4% for gains, from 4.3%-19.2% for losses \
level 2: 4.8% total, 3.6% for losses and 2.3% for gains) (50% less than level 1)

# 7. By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper? (Functional impact of CNV)
intuition: non-coding genes should be more variable because they are much more abundant and do not lead to change of phenotype--> no selection \
paper: non-coding regions had highest proportion of CNVs (makes sense to me, see explanation above)

# 8. The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential? (Homozygous deleted genes)
genes seem non-essential, redundant function or related to late-onset phenotypic consequences that do not reduce fitness
# 9. If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV? (Clinical application of the CNV map part in Discussion) 
1. asses if the CNV is found among the CNVRs of map
2. check whether it overlaps with medically relevant genes \
if CNV verlaps with DECIPHER critical genes/ cancer genes but is *not* in CNV map it is likely of medical importance
