## Task 1

Why is STR variation relevant to health and disease? \
-> fastest mutating loci in the genome

What are some of the challenges in analysing STRs from NGS data? \
-> short reads often do not span entire repeats \
-> STR variations present as large insertions or deletions that may be difficult to align to a reference genome


## Task 2

Why should you use multiple tandem repeat detection algorithms to look for repeats in biological sequence? \
-> to find TRs in the refrence genome \
-> the different algorightms create redundant or overlapping annotations, several statistical frameworks for filtering false positive annotations

What different functionalities does TRAL provide?
-> for de novo annotations, a scaffold for executing and parsing external TRD software is implemented \
-> a flexible system to establish overlap and clustering of TRs in TRAL \
-> tools to distinguish true from false positve \
-> TRAL can be used to build cpHMMs from each TR for annotation of homologous TRs on other sequences 


## Task 3 GangSTR background reading

GangSTR extracts information from paired-end reads into a unified model to estimate maximum likelihood TR lengths \
STR = short tandem repeats 

What sets GangSTR apart from other STR genotyping tools? \
-> ability to robustly genotype a range of TR classes, which will likely enable identification of novel pathogenic expansions as well as genome-wide association studies of TR variation in large cohorts \
-> end-to-end method that takes sequence alignments and a reference set of TRs as input and outputs estimated diploid repeat lengths \
-> not limited by fragment or read lenght 

What types of information does GangSTR use for STR genotyping? \
-> fragment length, coverage, and existence of partially enclosing reads
