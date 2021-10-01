# Notes to 'A copy number variation map of the human genome'

## Why is important to construct a CNV map on health individuals of various ethnicities?
CNV map of healthy individuals are needes so that geneticists can discriminate pathogenic or high-risk variants from benign variants in patients.

## What is the CNV size that the authors defined?
The current map includes microscopic and submicroscopic variants from 50 bp to 3 Mb.

## What are the primary approaches used for CNV detection? And what are the advantages and limitations for these technologies?
The two primary approaches used for CNV detection are:
**microarrays**:
* Good for studying quantitative variants
* Limited resolution
* Detects duplications more readily than sequencing

**next-generation sequencing (NGS)**:
* Call smaller variants and are biased towards the detection of deletions
* Have both hight sensitivity and the ablity to provide accurate sequence level breakpoint resolution

Both approaches are not as good in detecting deletions compared to earlier platforms.

## The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering?
Clusters were filtered on the basis of these two criteria:
* The number of distinct subjects that carry the variant: This filter excluded singletons, and variants that are supported by a larger number of subjects are less likely to be false positive.
* The number of distinct studies with at least one variant in the cluster: This filter ensured the exclusion of potential study-specific artefacts.

## What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively?
* Stringency level 1: at least one subject and one study 
* Inclusive map (stringency level 2): at least two subjects and one study for each variant
* Stringent map (stringency level 12): at least two subjects and two studies

## Which percentage of the genome contributes to CNV in inclusive map and stringency map respectively? 
* Inclusive map: 9.5%
* Stringency map: 4.8%

## By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper?
I would say that non-coding genes are more variable since they do not code for proteins. If protein-coding genes would alter more, we would have a lot more non-functional/wrong proteins which would be a bigger restriction for the cell.
The paper states that exons of non-coding genes had the highest proportion of copy number variable sequence, which is higher than the exons of protein-coding genes.

## The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential?
These genes would be non-essentioal, as they could be missing from the genomes of apparently healthy individuals. The function of non-essential genes may be redundant, or they may be related to late-onset phenotypic consequences that do not substantially reduce the fitness.

## If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV?
To assess the clinical importance of a CNV found in a case subject, the criteria could include:
* whether it is found among the CNVRs of the CNV map
* whether it overlaps with medically relevant genes.
