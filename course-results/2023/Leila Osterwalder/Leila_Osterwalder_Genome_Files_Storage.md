# Task: Estimate storage requirements for 1000 genomes

## Calculation storage requirement for 1000 genomes

### Whole genome sequencing
Each base pair takes 2 bits of storage (use 00, 01, 10, and 11 for T, G, C and A), therefore a genome with 3 billion bases needs 6 billion bits which is equivalent to 0.75 Gigabytes. Following the same logic, 1000 genomes need 1000 x 6 billion bits of storage space which is about 750 Gigabytes.

### Whole exome sequencing
A human exome contains about 30 x 10^6 base pairs which would be equivalent to 60 million bits of storage (2 x 30 x 10^6). Sequencing the exome for 1000 genomes would thus require about 7.5 Gigabytes.

## When to use which file types?
-	**SAM**: text-based format to store sequence alignment data.
-	**BAM**: BAM is a binary version of SAM. SAM and BAM are used to store aligned sequencing reads against a reference genome. A single 30x BAM file takes 100GB storage.
-	**CRAM**: CRAM is a compressed version of the SAM/BAM format, designed to reduce storage space while retaining the alignment information. It's useful for storing large-scale sequencing data. CRAM is suitable for long-term archival purposes where storage efficiency is important.
-	**VCF**: Variant Call Format is used to store information about genetic variants (like SNPs). 
-	**FASTA**: used to store nucleotide or protein sequences. It is a simple format used for representing individual sequences. Reference genomes are often stored in FASTA format.
-	**FASTQ**: This format is used to store raw sequence data. FASTQ files contain the sequencing reads and their associated quality scores.

## Associated costs 
-	50 CHF per genome (stored in a BAM format), thus 50'000 CHF for 1000 genomes
-	Sequencing service on health2030genome website:
  
  ![Bild 01 10 23 um 16 32](https://github.com/compbiozurich/UZH-BIO392/assets/145456687/a90904ac-acbe-4add-b1fc-590cd618dea4)


## Familiarize with VCF format
-	plain-text format used to store gene sequence variants
-	VCF files consist of meta-information lines (starting with ##), a header line, and data lines 
-	The header line contains information like position in the genome, reference allele (allele found in reference genome), Phred-scaled quality score and other information

## Sources:
-	https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7276491/#:~:text=On%20account%20of%20their%20larger,tiers%20is%20very%20nearly%20inconsequential.
-	https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2023/2023-09-26-BIO392-intro-variants-technologies.pdf
-	https://www.health2030genome.ch/service-fees/ 
-	https://www.internationalgenome.org/wiki/Analysis/Variant%20Call%20Format/vcf-variant-call-format-version-40/#:~:text=VCF%20is%20a%20text%20file,for%20each%20position%20or%20not. 
