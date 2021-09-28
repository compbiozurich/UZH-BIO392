# **Task 1: Genome File Formats**
Genome Storage Space & Cost required for 1000 Genomes for WEG (Whole Exome Sequencing) and WGS (Whole Genome Sequencing)

Whole Genome Size = ~ 3 billion base pairs
Whole Exome Size = ~45 million base pairs (~1.5% of WGS)

2 bits per base are sufficient to encode the genome (using 00, 01, 10, 11)
2 * 3 * 10^9b = 6, 000, 000, 000 b 
1MB = 8'000'000 b --> genome: ~715 MB 
~1’400’000 genomes = 1PB
1000 genomes = 0.00071 PB

1. BAM 
Is a compressed binary version of Sequence Alignment/Map (SAM)
~715 MB per genome (WGS)
WGS for 1000 genomes = ~715GB
WES for 1000 genomes = ~


2. SAM (Sequence Alignment/Map) (https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/nichols/presentations/ohbm2014/imggen/Nho-ImgGen-WGSeqPractical.pdf)
Is a genetic format for storing large nucleotide sequence alignments (plain text format)
 ~500GB per genome (WGS)
 WGS for 1000 genomes = ~500TB
 WES for 1000 genomes = ~7.5TB (1.5%)
 
 3.

Task: Exploration of different file formats and their use cases
* SAM
  
* BAM

* CRAM
    VCF
    FASTA

