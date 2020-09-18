# Task: Reasoning for the use of different file types
---
## Which would you use for storing called variants, which for full archival purposes, browser visualisations etc

FASTA, BAM, VCF, 

SAM, CRAM, BED

Associated costs
Cost factors
Raw Storage costs

Fasta:
The FASTA format is a text-based format for representing either nucleotide sequences or amino acid (protein) sequences, in which nucleotides or amino acids are represented using single-letter codes. Further in the data is also stored the information from where the sequence comes from (The line starting with a ">")

BAM:
The corresponding SAM Format can be used to store sequence data, both aligned as well as unaligned, in a human readable format.

BAM and SAM formats are designed to contain the same information. The SAM format is more human readable, and easier to process by conventional text based processing programs, such as awk, sed, python, cut and so on. The BAM format provides binary versions of most of the same data, and is designed to compress reasonably well.
