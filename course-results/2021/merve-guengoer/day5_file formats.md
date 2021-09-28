# **Task 1: Genome File Formats**
Genome Storage Space & Cost required for 1000 Genomes for WEG (Whole Exome Sequencing) and WGS (Whole Genome Sequencing)

Whole Genome Size = ~ 3 billion base pairs
Whole Exome Size = ~45 million base pairs (~1.5% of WGS)

2 bits per base are sufficient to encode the genome (using 00, 01, 10, 11)
2 * 3 * 10^9b = 6, 000, 000, 000 b 
1MB = 8'000'000 b --> genome: ~715 MB 
~1’400’000 genomes = 1PB
1000 genomes = 0.00071 PB
Raw Storage Costs: 500’000CHF = 1PB 

1. SAM (Sequence Alignment/Map) (https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/nichols/presentations/ohbm2014/imggen/Nho-ImgGen-WGSeqPractical.pdf)
Is a genetic format for storing large nucleotide sequence alignments (plain text format)
 ~500GB per genome (WGS)
 WGS for 1000 genomes = ~500TB (Estimated cost: CHF 250'000)
 WES for 1000 genomes = ~7.5TB (1.5%) (Estimated cost: CHF 3'750)
 
 
2. BAM https://compbiozurich.org/UZH-BIO392/course-material/2021/2021-09-28-BIO392-file-formats-storage-genomes.pdf
Is a compressed binary version of Sequence Alignment/Map (SAM)
~100 GB per genome (WGS)
WGS for 1000 genomes = ~100 TB (Estimated cost: CHF 50'000)
WES for 1000 genomes = ~ 1.5 TB (1.5%) (Estimated cost: CHF 750)

 
3. VCF (Variant Call Format)https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0
Is a text file format containing meta-information lines; a header line, and then data lines (each containing information about a position in the genome)
~125 MB per genome (WGS)
WGS for 1000 genomes = ~125 GB (Estimated cost: CHF 62.50)
WES for 1000 genomes = ~ 1.9 TB (1.5%) (Estimated cost: CHF 0.95)

4. FASTA



Task: Exploration of different file formats and their use cases
* SAM
  
* BAM

* CRAM
    VCF
    FASTA

