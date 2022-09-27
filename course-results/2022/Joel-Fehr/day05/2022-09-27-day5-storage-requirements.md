# Task01 Estimate Storage Requirement for 1000 Genomes

We have to differentiate between WES *Whole Exome Sequencing* and WGS *Whole Genome Sequencing*.
We also have to distinguish between the differnt file formats (SAM, BAM, VCF, FASTA).

## No specific file format: 
We only need two bits per base to encode the whole genome (`00, 01, 10, 11` for `TCGA`).

$2$ bits per base are sufficient to encode the genome (using $00$, $01$, $10$, $11$)

$8$ bits = $1$ byte

$8000000$ bits = $1$ Megabyte

*WGS:* $2 * 3 * 10^9 = 6000000000$ bits (Genome has $3 \times 10^9$ basepairs)

*WES* $2 \times 3 \times 10^7 = 60000000$ bits

*WGS:* $\implies 6000000000$ bits $= 750$ Megabytes

*WES:* $\implies 60000000$ bits $= 7.5$ Megabytes

For $1000$ genomes: $1000 \times 750 = 750$ Gigabytes

For $1000$ genomes: $1000 \times 7.5 = 7.5$ Gigabytes

Costs to store $1$ PB $\implies$ $~500'000$ CHF (see in slides[^1])

Costs to store $1$ GB $\implies$ $~0.5$ CHF

## For the different file formats:

*calculated for* $1000$ *genomes.*

### WGS

format | size | cost |
----------- | ----------- | ------------ 
Raw | 750 GB | 375 CHF | 
SAM[^2] | 400'000 GB | 200'000 CHF | 
BAM[^1] | 100'000 GB | 50'000 CHF | 
VCF[^3] | 125'000 GB | 62'500 CHF | 
FASTA[^3] | 20'000 GB | 10'000 CHF |

### WES

format | size | cost |
----------- | ----------- | ------------ 
Raw | 7.5 GB | 3.75 CHF | 
SAM[^2] | 4'000 GB | 2000 CHF |
BAM[^1] | 1'000 GB | 500 CHF |
VCF[^3] | 1'250 GB | 625 CHF |
FASTA[^3] | 200 GB | 100 CHF |


[^1]:https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2022/2022-09-27___Michael-Baudis__Genomic-Technologies-and-Genome-Editions___BIO392-HS22.pdf
[^2]:https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/nichols/presentations/ohbm2014/imggen/Nho-ImgGen-WGSeqPractical.pdf
[^3]:https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0




