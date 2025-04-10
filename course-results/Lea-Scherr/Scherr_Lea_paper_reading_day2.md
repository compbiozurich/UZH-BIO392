# Exercise 8.3.25 - Pangenome
## Why is the pangenome project interesting?

It contains 47 phased, diploid assemblies from genetically divers individuals.\
Though it's impossible for one genome like T2T-CHM13 to represent the genetic diversity of our species, it is a step in the right direction. \
Now to overcome not only this but also the reference bias that comes hand in hand with this, it is better to switch to a pangenome. Said pangenome is supposed to better capture global genomic diversity.
### Achievements
- It adds 119 million base pairs of euchromatic polymorphic sequences and 1'115 gene duplications in comparison to the previous existing reference.
- It covers more than 99% of expected sequence with high accuracy.
- It reduced small variant discovery errors by 34%.
- It can faithfully recapitulate the existing knowledge of medically relevant loci. This will enable future efforts to study the role of compley variation in human disease. 
- It enables more accurate SV (structural variant) detection and can identify new haplotypes in complex genomic regions.

---

## What makes the T2T approach different from previous reference genome constructions?
It combines multiple sequencing methods and it completes the 8% that have been missing in previous reference genomes. It increases the number of known genes and repeats in the human genome through introducing 182 Mbp of missing sequence.

They sequenced CHM13 extensively and repeatedly with multiple technologies (e.g. HiFi and ONT). Following this, they assembled, validated and polished the genome and finished the remaining problematic regions including the centromeric regions, the short arms of the acrocentric chromosomes and human ribosomal DNA.

Before, there was an underrepresentation of repetitive sequences, which where unsolvable. GRCh38 contained 151 Mbp of unknown sequence and regions that are artificial or otherwise incorrect. Although the Nanopore sequencing (ONT) was able to solve a lot of problems, it still had a relatively high error rate.

Moreover, the error-rate of T2T-CHM13 is 1 error per 10 Mbp which exceeds the historical standard of "finished" sequence. 

---

## What future benefit for genome data analysis can the T2T/pangenome approach attribute?
### Challenges & areas of improvements/limitations
- It is still an active research area, because you still face computational challenges (the incredible amount of sequences you have to align) and how you decide which alignments should be included. 
- Additionally, further work will be required in multiple aspects, one area being to better identify medically relevant complex SVs. 
- Reference-based sequence mapping needs to be improved. 
- Analysis with more samples is required. They are planning to expand the pangenome to 350 individuals, which should capture the most common variants. This using the T2T approach. 
- There still are sequencing errors. 
### Aims & Outlook
- Improve downstream analysis workflows by removing mapping biases (that arise when working with only one reference genome, such as GRCh38 or CHM13)
- Improve the accuracy of calling small variants from short reads. 
- Work together with low-cost long-read sequencing for comprehensive SV genotyping. 
- It should benefit individuals of different ancestries differently.
- It aims to improve our understanding of genomics and our ability to predict, diagnose and treat disease. E.g. through precision medicine. 
- The methods could also prove valuable for other species. 


#### References
(1) [Paper: A draft human pangenome reference](https://doi.org/10.1038/s41586-023-05896-x) \
(2) [Paper: The complete sequence of a human genome](https://pmc.ncbi.nlm.nih.gov/articles/PMC9186530/)