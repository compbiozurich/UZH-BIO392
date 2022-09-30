# Task 1
## STR background reading
### Read the following sections of ‘A genomic view of short tandem repeats’: Abstract + Introduction, Genotyping STRs from high-throughput sequencing data
### Afterwards, you should be able to answer the following questions:

## Why is STR variation relevant to health and disease?
-it plays an important role in some diseases (Fragile X Syndrome, Spinal and bulbar muscular atrophy) and pathogenic effects (affecting RNA splicing)

-contibute a high number of denovo mutations per generation (in spontaneous conditions such as autism and neurodevelopmental disorders)

## What are some of the challenges in analysing STRs from NGS data?
-short reads often do not span entire repeats, effectively reducing the number of informative reads. 

-STR variations present as large insertions or deletionsthat may be difficult to align to a reference genome, and
thus introduce significant mapping bias toward shorteralleles.

-PCR amplification during library preparation often introduces “stutter” noise in the number of repeats at STRs


# Task 2
## Introduction to TRAL
### Read ‘TRAL: tandem repeat annotation library’
### Afterwards, you should be able to answer the following questions:

## Why should you use multiple tandem repeat detection algorithms to look for repeats in biological sequence?
-different TR types require different algorithms and different methologies

## What different functionalities does TRAL provide?
-Executing and parsing results of several TRDs, despite no commonly accepted file format 

-Validating TR predictions and clustering redundant or overlapping results

-Filtering out false positive TR predictions in a robust statistical framework

-Annotating known TRs homogenously across homologous sequences, and discerning variation among the TRs
