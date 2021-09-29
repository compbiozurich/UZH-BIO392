# Storage requirements for 1000 genomes

## Starting point (from Mr. Baudis lecture)
* Human genome = 3 * 10^9 bases, encoded by 2 bits per base => 6'000'000'000 b
* Perfect genome (no overhead): 715 MB
* 1 PB = 35'000 CHF; real costs 2x + duplication, facilities, service... => 500'000 CHF
* 1 30x BAM file => 100 GB
* 500'000 CHF => 1 PB => 10'000 genomes => 50 CHF/genome (BAM format)

## Additional information
* WGS = 3'000'000'000 bp
* WES = 30'000'000 bp
* 500'000 CHF/1 PB = 0.50 CHF/GB
* BAM = 100 GB/WGS
* SAM = 4x BAM = 400 GB/WGS
* VCF = 125 GB/WGS
* FASTA = 

## Tables (referring to 1'000 genomes, to be completed)

### WES (Whole Exome Sequencing)

File format | Size | Total cost | Cost per genome
----------- | ----------- | ------------ | -------------
Raw | 7.15 GB | 3.575 CHF | 0.003575 CHF
SAM | 4'000 GB | 2'000 CHF | 2.00 CHF
BAM | 1'000 GB | 500 CHF | 0.50 CHF
VCF | 1'250 GB | 625 CHF | 0.625 CHF
FASTA | Content

### WGS (Whole Genome Sequencing)

File format | Size | Total cost | Cost per genome
----------- | ----------- | ------------ | -------------
Raw | 715 GB | 357.5 CHF | 0.3575 CHF
SAM | 400'000 GB | 200'000 CHF | 200 CHF
BAM | 100'000 GB | 50'000 CHF | 50 CHF
VCF | 125'000 GB | 62'500 CHF | 62.50 CHF
FASTA | Content
