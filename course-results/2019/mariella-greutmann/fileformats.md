## 1. How much computer storage is required for the 1000 Genomes project?
According to 1000 Genome Homepage:

1000 Genomes Release,	Variants,	Individuals,	Populations
Phase 3, 84.4 million,	2504,	26

1000 genome interest: short and structural variation between individuals
* WGS:
  * recommends 20-30x coverage
  * to store whole genome sequence data use BAM (suitable for alignment with reference)
  * 2504 (individuals) x 25 (coverage) x 715MB (storage needed for 1 genome) =  44759000 MB = 44.759 TB

* VCF for variant calls: When interested in intra-individual differences not the whole genome has to be stored, but loci of interest. On the 1000 genome page it says there are 85 mio variants, probably mix of SNPs and longer variation.
  * Min. storage needed would be if all were SNP's 
  * 85e6 (variation) x 2 b = 170000000 bits / 8 x 1000 = 21250 KB = 21.25 MB

cost factor may be coverage and the number of basepairs requirements

## 2. size estimates and reasoning for the use of the different file types (i.e. which would you use for storing called variants, which for full archival purposes, browser visualisation), for 3-5 formats.

* VCF for variants
* BAM for alignments of sequences
* HGVS allows the annotation of sequence variants with relation to a genomic or protein reference
