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

## Tables (to be completed)

### WES (Whole Exome Sequencing)

File format | Size | Total cost | Cost per genome
----------- | ----------- | ------------ | -------------
SAM | 500 GB/sample
BAM | Content
VCF | Content
FASTA | Content

### WGS (Whole Genome Sequencing)

File format | Size | Total cost | Cost per genome
----------- | ----------- | ------------ | -------------
SAM | Content
BAM | Content
VCF | Content
FASTA | Content
