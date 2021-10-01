# *A copy number variation map of the human genome* by Zarrei et al. (2015)

## Notes
* Structural variation: largest component are copy number variations (CNVs), which increase or decrese the DNA content; typically defined as larger than 50 bp, smaller are insertions or deletions (indels)
* Threshold over which the effect of a CNV may be associated with a disease is defined by clinicians and is arbitrary
* *Database of Genomic Variants (DGV)*: created in 2004 as a comprehensive catalogue of human CNV and structural variation among "control" individuals => CNV map
* Aim: create a CNV map of the human genme for variations that are not associated with adverse phenotypes
* Separate CNV maps for deletions and duplications, and one for both together
* 2'391'408 CNVs from 55 studies were curated from DGV, of which the authers chose a collection which was only from peer-reviewed publications
  * Studies based on sequencing (NGS and Sanger)
  * Assays based on oligonucleotide or SNP arrays
  * Studies using other methods (e.g. FISH, PCR, MLPA and optival mapping)
 * 26 studies remained, majority of CNVs from NGS, followed by array methods
 * After additional quality control, 23 studies made up the final collection
  * 2'057'368 variants (195'085 gains and 1'862'284 losses)
  * 2'647 subjects from diverse ethnicities
* Methods: CNVRs that were recognized with higher stringency have support from a higher number of subjects and studies; stringency level was based on previous estimates of genome copy number variability, overlap with reference variants from different platforms and minimal variability of highly contrained genomic elements
* Inclusive CNV map: 3'132 CNVR gains and 23'438 CNVR losses (9.5% of the human genome)
* Most CNVRs: 300 - 3'000bp long; unevenly distributed in the genome and among chromosomes
* Null CNV map: generation by compiling all CNVs in the DGV that were identified as being homozygously deleted and restricting them to regions that were shared with CNVR losses in the inclusive and stringent maps; restricted to 0.75% of the genome in the stringent map

## Answers to questions

### Introduction
* Why is it important to construct a CNV map on healthy individuals of various ethnicities?
  * There is a growing number of CNVs known as variants of unknown significance (clinically speaking) that are suspected to be involved in disease susceptibility but for which population-level data of healthy individuals is required to compare to
* What is the CNV size that the authers defined?
  * 50 bp to 3 Mb

### CNV discoveries
* What are the primary approaches used for CNV detection? And what are the advantages and limitations for these technologies?
  * Microarrays: suitable for studying quantitative variants, but miss many variants that are small
  * NGS: call smaller variants and are biased towards detection of deletions; high sensitivity, high resolution
  * Disadvantages: lack of probes in regions of the genome that contain segmental duplications; SNP-based array platforms and NGS miss more duplications than array CGH

### The CNV map
* The authors used clustering methods to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering?
  * 1. Identification of sets of variants in which every possible variant pair has at least 50% reciprocal overlap
  * 2. Filtering on the basis of the number of distinct studies with at least one variant in the cluster
  * They did it because the different methods and studies have different accuracies when calling the beginning and end of variants
* What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively?
  * Level 1: at least one subject and one study for each variant
  * Level 2: at least two subjects and one study for each variant
  * Level 12: at least two subjects and two studies for each variant

### Properties of the CNV map
* Which percentage of the genome contributes to CNV in the inclusive map and the stringent map respectively?
  * Inclusve map: 9.5%
  * Stringent map: 4.8%

### Functional impact of CNV
* By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper?
  * Just based on my intuition, I would say that there is more variability in non-coding genes, since there the variability might have a smaller impact on the functionality of proteins and therefore the viability of the organism
  * This paper: the exons of all genes were more variable than the genome average ("background"); exons of non-coding genes had the highest proportion of copy number variable sequence, which is higher than the exons of protein-coding genes; by contrast, exons of many of the constrained gene sets or other fitness-altering phenotypes were less variable than the genome average; long intergenic non-coding RNAs and promoters were enriched in CNVRs, while enhancers and ultra-conserved elements were impoverished

### Homozygous deleted genes
* The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions fo these genes? And why did the authors say that they seem to be non-essential?
  * Their function might be redundant (14 have paralogues), or they may be related to late-onset phenotypic consequences that do not substantially reduce the fitness (some are described as age-related phenotypes)
  * Because they seem to be missing from the genomes from apparently healthy individuals

### Discussion and future work
* If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV?
  * CNVs in regions with not much variation in healthy individuals => more likely pathogenic; in regions with much variation in healthy individualy => more likely benign
  * CNVs in list of disease-related genes but not in CNV map => more likely pathogenic; the other way around => more likely benign
