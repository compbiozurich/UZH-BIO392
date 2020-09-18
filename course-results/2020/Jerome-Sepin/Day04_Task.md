# Task: Reasoning for the use of different file types
---
## Which would you use for storing called variants, which for full archival purposes, browser visualisations etc

FASTA, BAM, VCF, 

SAM, CRAM, BED

Associated costs
Cost factors
Raw Storage costs

## Fasta:
The FASTA format is a text-based format for representing either nucleotide sequences or amino acid (protein) sequences, in which nucleotides or amino acids are represented using single-letter codes. Further in the data is also stored the information from where the sequence comes from (The line starting with a ">") and also additionall Informations may be present.
I think because it is in this format already quite good readable it is good for visualisation but propaply not for comparing thousands of genomes, not to mention to store them in this file format.
I downloaded the ALDH2-Gene from Ensembl as a FASTA-File (Ending: .fa) and it was 53kb heavy. For about 500 AS, thus 1500 bps... A human genome consisting of 3'000'000'000 bp (haploid!) therefore 2 Mio times bigger would cover 848'000 Mb. Compared to 715 Mb for a perfect genome (diploid?), this is quite a lot. And this is only the sequence by itself!

![alt text](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2020/Jerome-Sepin/FASTA_ALDH2.png)

## SAM:
The SAM Format can be used to store sequence data, both aligned as well as unaligned, in a human readable format.
A SAM and also a BAM format have a header first and afterwards a section which is called an alignment. Whereas the header contains information about the entire file the alignment section cointains information about each sequence by itself (how it aligns to the reference genome)

### Example of a Header:
![alt text](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2020/Jerome-Sepin/Header_Example.png)
### Example of an Alignment and how its fields should then look like:
![alt text](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2020/Jerome-Sepin/Alignment_Example.png)

## BAM:

The BAM format provides binary versions of most of the same data as in SAM, and is designed to compress reasonably well. 

I actually could not find any sequences in SAM or BAM file format and I wounder why?
