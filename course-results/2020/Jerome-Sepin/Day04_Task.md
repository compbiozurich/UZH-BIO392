# Task: Reasoning for the use of different file types
---
## Which would you use for storing called variants, which for full archival purposes, browser visualisations etc

FASTA, BAM, VCF, 

SAM, CRAM, BED

Associated costs
Cost factors
Raw Storage costs

## Fasta:
#### The FASTA format is a text-based format for representing either nucleotide sequences or amino acid (protein) sequences, in which nucleotides or amino acids are represented using single-letter codes. Further in the data is also stored the information from where the sequence comes from (The line starting with a ">") and also additionall Informations may be present.
#### I think because it is in this format already quite good readable it is good for visualisation but propaply not for comparing thousands of genomes, not to mention to store them in this file format.
#### I downloaded the ALDH2-Gene from Ensembl as a FASTA-File (Ending: .fa) and it was 53kb heavy. For about 500 AS, thus 1500 bps.. a human genome consisting of 3'000'000'000 bp (haploid!) therefore 2 Mio times bigger would cover 848'000 Mb. Compared to 715 Mb for a perfect genome (diploid?), this is quite a lot. And this is only the sequence by itself!

BAM:
The corresponding SAM Format can be used to store sequence data, both aligned as well as unaligned, in a human readable format.

BAM and SAM formats are designed to contain the same information. The SAM format is more human readable, and easier to process by conventional text based processing programs, such as awk, sed, python, cut and so on. The BAM format provides binary versions of most of the same data, and is designed to compress reasonably well.
