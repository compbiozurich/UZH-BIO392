
## 1. Why is important to construct a CNV map on health individuals of various ethnicities?
- because the CNV patterns differ among ethnicities. "normal" depends on the ethnological context.

## 2. What is the CNV size that the authors defined? 
Noted: The NV size definition is still under debate and may be different in other literature
- 50 bp to 3 Mb

## 3. What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies? (CNV discoveries)
- microarrays
  - The first studies to assay CNVs primarily used micro- arrays with large-insert clones (known as bacterial artificial chromosomes (BACs))7 and oligonucleotide arrays8. Subsequent microarrays have included both comparative genomic hybridization (CGH)9,10,14,41 and SNP-based arrays.
  - suited for quantitative variants
  - deletions easyer to identify
  - limited resolution (max. 450bp)
- NGS
  - calls smaller variants and is biased towards the detection of deletions
  - high sensitivity
  - ccurate sequence-level breakpoint resolution
- Currently, no single discovery strategy can cap- ture the entire spectrum of structural variations in the genome

## 4. The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering? (The CNV map)
- used a CNVR-clustering algorithm to identify sets of variants in which every possible variant pair had at least 50% reciprocal overlap
- ensured that structurally distinct CNVs were not merged
- filtered on the basis of the number of distinct subjects that carry the variant and the num- ber of distinct studies with at least one variant in the cluster
- The filter based on the number of subjects excluded singletons, and variants that are supported by a larger number of subjects are less likely to be false positives
- filter based on the number of studies ensured the exclu- sion of potential study-specific artefacts
- used thresholds: 
    (i) at least two subjects and one study for each variant  
    (ii) at least two subjects and two studies 

## 5.What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively? (The CNV map)
  (i) at least two subjects and one study for each variant (stringency level 2 (inclusive map)
  (ii) at least two subjects and two studies (stringency level 12 (stringent map))

## 6. Which percentage of the genome contributes to CNV in inclusive map and stringent map respectively? (Properties of the CNV map)
<img width="944" alt="Screenshot 2022-09-28 at 13 39 19" src="https://user-images.githubusercontent.com/103630748/192769708-088481ce-aa50-4cef-8afd-f737f2cbadc9.png">
- marked change between the map with stringency level 1 and the inclusive map could be explained if a proportion of the singleton variants were false positives and the rest were rare events

## 7. By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper? (Functional impact of CNV)
- non coding genes, for the lower selective pressure on them.
- exons of all genes (as defined by RefSeq62)were more variable than the genome average (that is, the background)(see image below)
- exons of non-coding genes had the highest proportion of copy number variable sequence, which is higher than the exons of protein-coding genes
- Previous studies have indicated a positive correla- tion between CNVs and gene density. Our analysis indicated that this is not universal


<img width="758" alt="Screenshot 2022-09-28 at 13 43 16" src="https://user-images.githubusercontent.com/103630748/192770503-4002b552-d254-4c05-8ac4-77f29f295637.png">
CNV gains and losses vs. gene type


## 8. The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors sav that they seem to be non-essential? (Homozygous deleted genes)
- null CNVs were limited to 0.75% of the genome in the stringent map
- genes seem to be non-essential, as they could be missing from the genomes of apparently healthy individuals
- might be duplicated genes
- function of non-essential genes may be redundant, or they may be related to late-onset phenotypic consequences that do not substantially reduce the fitness

## 9. If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV? (Clinical application of the CNV map part in Discussion)
- map can be used to guide the development of CNV-specific genotyping assays
- To assess the clinical importance of a CNV found in a case subject, the criteria could include:
  (i) whether it is found among the CNVRs of the CNV map 
  (ii) whether it overlaps with medically rel- evant genes. 
- Comparisons between 2 inclusive and stringent maps could allow consideration of conditional phenotypes
- Genomic background, including ethnicity, can influence the thresholds. 
  -  For example, the low copy number (4.8%) of the amylase gene is a disadvantage in Asian populations, particularly in the Japanese, but it has no effect in African populations
