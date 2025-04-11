# A draft human pangenome reference – the major outcomes and improvements 
## 1) Why is the pangenome project interesting?
The Human Pangenome Reference consists of 47 phased, diploid assemblies of the genome (more than 99% of the expected sequence and 99% accurate) of genetically diverse individuals. These individuals represent the global genetic diversity. These assemblies were then aligned, and a draft was generated that captures the known variants and haplotypes. For each participant also whole genome sequencing data from both parents is available which is useful for haplotype phasing. Additionally, to the genomes millions of base pairs of euchromatic polymorphic sequences and gene duplicates related to the existing reference GRCh38 were added. 
This creates a more diverse and accurate representation of the genome as one can observe directly where variability occurs compared to the classical single genome reference as for example the GRCh38. 

They constructed three graph construction methods which all are built up differently. They did not only chose a single one, because in this way they got a good comparison which methods work best and what their advantages are and also in general to see if their results could be reliable. 
The focus of the pangenome was to build a reference resource with multiple genomes, but the high accuracy of the haplotype-resolved assemblies also enabled access to previously inaccessible regions, new forms of genetic variation and further insight in mutational processes. 

They did a lot of comparing and analysis on how accurate and improved their methods are compared to the older references. There they saw that the pangenome showed huge improvements in multiple ways. They could prove a highly contiguous and accuracy of the sequences and the performance in gene variation, alignment, complex multiallelic SVs, etc. was better than compared to the single reference.

## 2) What makes the T2T approach different from previous reference genome construction 
For a long time, the human reference genome GRCh38 was used. This reference genome includes only about 92-95% of the haploid genome.  Recently, the first Telomere-to-Telomere (T2T) genome (T2T-CHM13) was finished. With this new genome, which contains 100% of then genome, genomic analysis can be improved, as it for example better represents the true copy number variant (CNVs). 
Although the T2T is very good, it is not able to represent variations / genetic diversity. So, the idea occurred to bring multiple genomes together and create a pangenome for reference. In this pangenome the GRCh38 and T2T-CHM13 were also included. 

As this pangenome is finished, further developments are to also make the pangenome to a T2T to not only get the diversity but also the full genome. 

## 3) General estimate what the future benefit for genome data analysis is and what can directly be tributed to the T2T / pangenome --> what is the Contribution?
The pangenome aims to improve downstream analysis workflows through removing mapping biases that can occur when using a single linear reference genome. 

It also improves the accuracy of calling small variants when doing short reads as the pangenome has a gain in both SNPs and indels compared to other approaches, due to using long reads. In challenging medically relevant genes, the increase is even larger for both. 
These improvements where driven both by better sequencing technology (reducing errors, longer reads, …) and assembly algorithms. 

A goal now is to increase the pangenome even further and introduce more individuals to capture most common variants and to push it towards T2T genomes for this cohort to represent the entire genome. With the more diverse human reference map also the eventual applications of genomic research and precision medicine are effective for all populations. Also, in general genome data analysis will get more accurate as now more and more is known and variances are introduced and one can compare with a diverse and not an single reference. Genome data analysis will get accessible to a broader range as it contains the diversity but due to the huge data amount it will also get more complicated which needs a good intarface to use the pangenome. 


### **Reference:**

Liao, WW., Asri, M., Ebler, J. *et al.* A draft human pangenome reference. *Nature* **617**, 312–324 (2023). [https://doi.org/10.1038/s41586-023-05896-x](https://doi.org/10.1038/s41586-023-05896-x)
