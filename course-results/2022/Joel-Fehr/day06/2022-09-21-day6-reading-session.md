# Reading Session:  *A copy number variation map of the human genome*

<p align="center">
<img width="693" alt="Screen Shot 2022-09-28 at 13 58 40" src="https://user-images.githubusercontent.com/63153161/192773189-1abb832f-0200-46e9-970b-f49b99fc3bd0.png">
<p/>

##### [Paper](https://github.com/compbiozurich/UZH-BIO392/files/9664305/nrg3871.pdf)

---

### Why is important to construct a CNV map on health individuals of various ethnicities? 
###### (Introduction)
An updated CNV map of the human genomes is constructed and this map should help with the interpretation of of new CNV's for clinical and research applicaitons.
  > A major challenge in the field is that there is a growing number of CNVs (known as ‘variants of unknown significance’) that are suspected to be involved in disease susceptibility but for which additional population-level data are required.

---

### What is the CNV size that the authors defined? 
###### (Box 1 mentioned in introduction)
###### Noted: The CNV size definition is still under debate and may be different in other literature
CNV size mentioned in Paper: $4.8 - 9.5$%

---

### What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies? 
###### (CNV discoveries)
The primary approaches that are used for CNV detection are Microarray and NGS (*next-generation-sequencing*). The microarrays include techniques like oligonucleotide arrays and CGH (*comparative genomic hybridization*.) 
One limitation of these technologies is that no single technique is able to capture the entire spectrum of structural variations in the genome at they are
dependant on the platforms and the algorithms that are used. Many of these platforms have a lack of probes in regions that contain segmental duplications.
This leads to problems with recognizing CNV's that are associated with human disease. NGS call smaller variants but are biased towards the detection of deletions.
Array based methods have a limited resolution capacity.

---


### The authors used clustering method to combine data from different studies into merged CNVRs. What are the two criteria for cluster filtering? And why did they do this filtering? 
###### (Copy number variable regions), (The CNV map)

Two criterias:

  - Number of subjects that carry the variant. Variants with a larger number of subjects are less likely to be false positive.

  - Number of studies with variant in the cluster.

The filtering was done because:
  - Less likely to detect false positives.

---

### What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively? 
###### (The CNV map)
  - *Stringency level 1:* At least one subject and one study.
  - *Inclusive map:* At least two subjects and one study for each variant
  - *Stringent map:* At least two subjects and two studies

---

### Which percentage of the genome contributes to CNV in inclusive map and stringent map respectively? 
###### (Properties of the CNV map)
  - *Inclusive map:* $9.5$%
  - *Stringent map:* $4.8$%
 
---

### By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper
###### (Functional impact of CNV)
I think that non-coding genes are more variable because I imagine that protein-coding genes are more "strict" since they code for a protein
which often has to fulfill a precise and specific task. So I imagine that the functions of the proteins would be impaired if they are too much
variable or we would end up with the same protein, doing different things.

Paper: 
  > The exons of non-coding 45 genes had the highest proportion of copy number 40 variable sequence, which is higher than the exons of protein-coding genes.

---

### The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did theauthors say that they seem to be non-essential? 
###### (Homozygous deleted genes)
The genes are non-essential if they are missing from healthy individuals.
he func- tion of non-essential genes may be redundant (14 have paralogues), or they may be related to late-onset pheno- typic 
consequences that do not substantially reduce the fitness.

---

### If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV? 
###### (Clinical application of the CNV map part in Discussion)

It id important if the CNV overlaps with genes that are relevant for certain diseases and that have a clinical relevance.
