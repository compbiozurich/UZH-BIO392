# How much computer storage is required for 1000 genomes?

Size of WES and WGS genome data of one person.
|Type (Mean depth)|	FASTQ| BAM |VCF  | SUM |
|-----------------|------|-----|-----|-----|
|WES (100x)	      |   5GB|  8GB|0.1GB| 13GB|
|WGS (30x)        |  80GB|100GB|  1GB|180GB|

Source: <https://3billion.io/blog/big-data-among-big-data-genome-data>

Computer storage for 1000 genomes? 
- For WES :  13GB x 1000 =  13000GB =  13TB
- For WGS : 180GB x 1000 = 180000GB = 180TB



# When to use different file types?

## storing called variants
**Use VCF (Variant Call Format):**
- textbased standard file format for storing variants data
- Many millions of variants can be stored in a single VCF file
- supported by many variant calling tools like GATK
- can e compressed and indexed
- is much smaller than BAM or FASTQ files
- is compatible with genome browsers like IGV 
- essential for downstream analysis like annotation or filtering


## storing full archival purposes
**Use VCF:** for storing called variants
- Standard format for storing variants
- is typically compressed and indexed
- compact and widely supported

**Use FASTQ:** for storing raw sequencing data
- textbased standard format for NGS raw data
- includes Phred-scaled base quality scores for each base
- is typically compressed 
- used as input for mapping, alignment and variant calling
- enables reanalysis and quality control (e.g. FastQC)


## browser visualisation
**Use BAM:** to visualize mapped reads
- Binary fomat that stores aligned sequencing reads
- derived form SAM, but compressed
- compatible with genome browsers like IGV
- can be used for reanalysis or variant calling

**Use VCF:** to visualize genetic variants
- stores genomic differences compared to a reference genome
- more compact than SAM, BAM, FASTA or FASTQ 
- can be visualized in genome browsers like IGV or Ensembl
- can be used for population analysis




