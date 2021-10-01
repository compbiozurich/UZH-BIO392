# Answers paper questions 
https://www.nature.com/articles/nrg3871  

> A major contribution to the genome variability among individuals comes from deletions and duplications — collectively termed copy number variations (CNVs) - which alter the diploid status of DNA.
> We now typically define the size of CNVs as larger than 50 bp, whereas smaller elements are known as insertions or deletions (indels). These structural variations encompass more polymorphic base pairs than SNPs by an order of magnitude

• Why is important to construct a CNV map on health individuals of various ethnicities? (Introduction)   
  
Population-level data is required to create an accurate CNV map and since human population is structured we need to capture samples from all structures (ethnicities)  
Healthy individuals are needes to know which CNV do not lead to pathogenic phenotype 
  
• What is the CNV size that the authors defined? (Box 1 mentioned in introduction)    
  
larger than 50 bp uo to 3 Mb  
  
• What are the primary approaches used for CNV detection? And what are the advantages and limitations for these technologies? (CNV discoveries)  
  
Microarrays and next-generation sequencing (NGS) are now the primary approaches used for CNV detection.  
NGS approaches:
  * call smaller variants and are biased towards the detection of deletions
  * hight sensitivity and the ablity to provide accurate sequence level breakpoint resolution
  * bad for duplication

Array apprpaches:
  * The array-based detection methods are suitable for studying quantitative variants
  * CGH is more sensitive to detecting small differences in copy number and better for duplicates
  * More duplications are missed by SNP-based array
  * highest-resolution array has minimum threshold for CNV detection of 450 bp
  * BAC CGH, are typically inflated owing to low resolution and overestimation of the breakpoints
  
• The authors used clustering method to combine data from different studies into merged CNVRs (Copynumber variable regions). What are the two criteria for cluster filtering? And why did they do this filtering? (The CNV map)   
  
Some variants were rare, private singletons or false discoveries; therefore, it is important to account for the presence of singletons. Different platforms have different degrees of accuracy for determining the beginning and end of the variants.  
--> filtered on the basis of the number of distinct subjects that carry the variant (against false positives) and the number of distinct studies with at least one variant in the cluster (against study artefacts)    
  
• What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively? (The CNV map)  
  
**map with the stringency level 1:** The map supported only by at least one subject and one study  
**stringency level 2 (inclusive map):** At least two subjects and one study for each variant  
**stringency level 12 (stringent map):** At least two subjects and two studies   
  
• Which percentage of the genome contributes to CNV in inclusive map and stringency map respectively? (Properties of the CNV map)   
  
Inclusive map: 9.5%  
Stringency map: 4.8%

• By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper? (Functional impact of CNV)
  
I'd assume protein coding genes are less variable due to averse fitness effects in case of CNV.  
Exons of non-coding genes had the highest CNV proportion and this supports my intuition.  


• The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential? (Homozygous deleted genes)  
  
Since they are missing from the genomes of apparently healthy individuals. They may just be redundant or their phenotypes not having siginificant (fitness) effects.  

• If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV? (Clinical application of the CNV map part in Discussion) 
Patient has:
  
  * CNVs in regions with not much variation in CNV map, likely pathogenic
  * CNVs in CNVRs of CNV map, likely benign
  * CNVs in list of disease-related genes but not in  CNVRs of CNV map, likely pathogenic

(CNV map is composed out of many healthy individuals)



