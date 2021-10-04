# Task 1: Estimate Storage Requirements for 1'000 genomes

## WES & WGS
Whole Exome Sequencing and Whole Genome Sequencing

# Different file formats

--> storage cost: 0.50 CHF/GB
--> 2503 Genomes
--> 88 million variants
--> mean depth = 7.4x

Compressed, 1 genome = 100 gigabyte

**SAM file format:**
(Internet research)= 1 30x Genome needs about 500GB.
GWS used 7.4x --> (7.4*500)/30 = 123.33 GB/Genome 7.4x SAM
For 2504 genomes --> 2504*123.34 GB = 308'818.32 GB.
One GB= 0.50CHF --> 0.50*308'818.32 = 154'409.16CHF for the whole GWS.

**BAM file format:**
A BAM file is the compressed binary version of a SAM file that is used to represent aligned sequences up to 128 Mb. 30x BAM file = 100 GB --> 7.4x BAM file = (7.4*100)/30 = 24.76 GB/Genome

**VCF file format:**
VCF only contains variants as BAM files contain all reads aligments --> VCF are therefore much smaller than BAMS.
(Internet research)=all variations of a human genome need ~125 MG
For our 2504 genomes --> 2504*125MG = 313 GB for the whole GWS required.
This costst ~0.50CHF*313GB = 156.50 CH (cheapest format!)

**FASTA file format:**
1 MB per assembly

**FASTQ file format:**
1 GB per WGS

**The VCF format**
