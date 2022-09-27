# Task01 Estimate Storage Requirement for 1000 Genomes

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

Costs to store $1$PB $\implies$ $~35'000$ CHF
Costs to store $1$GB $\implies$ $~0.035$ CHF

## For the different file formats:

### SAM
 
### BAM
 
### VCF

### FASTA





