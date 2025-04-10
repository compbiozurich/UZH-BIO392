#Notes on CNV Paper
# 1. Why is important to construct a CNV map on health individuals of various ethnicities?
 (Introduction)  
To represent the population as whole. capture maximum extent of variability
# 2. What is the CNV size that the authors defined? (Box 1 mentioned in introduction) 
50 bp tp 3Mb
Noted: The CNV size definition is still under debate and may be different in other literatures 
# 3. What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies? (CNV discoveries)
Microarrays
+ suitable for studying quantitative variants
- miss many variants that are small
- duplications are missed less than in NGS
- limited resolution capacity
Next-Generation Sequencing (NGS)
 + call smaller variants
 - are biased towards the detection of deletions
 + high sensitivity
 + provide accurate sequence level breakpoint resolution
and many more...
# 4. The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering? (The CNV map) 
identify sets of variants in which every possible variant pair had at least 50% reciprocal overlap
Clusters were then filtered on the basis of the number of distinct subjects that carry the variant and the number of distinct studies with at least one variant in the cluster
to ensure structurally distinct CNvs were not merged at this stage
excluded singletons and variants that are supported by a larger number of subjects are less likely to be false positives
ensured the exclusion of potential study-specific artefacts
# 6. What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively? (The CNV map) 
map with stringency level 1: at least one subject and one study
Inclusive map (stringency level 2): at least two subjects and one study for each variant
Stringent map (stringency level 12): at least two subjects and two studies
# 7. Which percentage of the genome contributes to CNV in inclusive map and stringent map respectively? (Properties of the CNV map) 
Inclusive map: 9.5% (7.5 losses, 3.9 gains)
Stringent map: 4.8% (3.6 losses, 2.3 gains)
# 8. By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper? (Functional impact of CNV)
The exons of non-coding genes had the highest proportion of CNV sequence, which is higher than the exons of protein-coding genes.
- non-protein coding genes --> selective pressure is lower --> less variation tolerated in protein-coding genes: evolution strongly conserves these genes
-  Non-coding genes play regulatory or structural roles: higher mutation tolerance, more variability
# 9. The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential? (Homozygous deleted genes)  
They are protein-coding genes --> have more gene family members, they may be redundant (14 have paralogues)
some are described in OMIM as age-related phenotypes
# 10. If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV? (Clinical application of the CNV map part in Discussion)
A CNV found in a patient that overlaps with any of these genes while not being found in the CNV map would suggest medical importance. CNVS that are associated with the more stringent gene sets (DECIPHER and embryonically lethal geness) --> have higher likelihood of pathogenicity
