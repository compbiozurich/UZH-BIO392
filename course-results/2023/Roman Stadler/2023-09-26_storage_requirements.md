# How much computer storage is required for 1000 Genomes?  
We need 2 bits for one "character" in the gene strand.  

## Whole Genome Sequencing ($3 \times 10^9$ basepairs):  
$2 \times 3 \times 10^9 = 6000000000$ bits  
$6000000000$ bits $= 750$ Megabytes  
For $1000$ genomes: $1000 \times 750mb = 750$ Gigabytes  


## Whole Exome Sequencing ($3 \times 10^7$ basepairs):  
$2 \times 3 \times 10^7 = 60000000$ bits  
$60000000$ bits $= 7.5$ Megabytes  
For $1000$ genomes: $1000 \times 7.5mb = 7.5$ Gigabytes  


# Different file formats
File Format Recommendations for Genomics Data

## SAM (Sequence Alignment/Map):  
Use Case: Storing Sequence Alignments  
Reasoning: SAM files are commonly used to store the results of sequence alignment, where short DNA or RNA sequences are aligned to a reference genome. 
They contain information about read alignments, such as the sequence, quality scores, and alignment positions. 
SAM files are human-readable and can be used for downstream analysis or visualization.
However, they can be large and are often converted to BAM format for efficient storage.

## BAM (Binary Alignment/Map):
Use Case: Efficient Storage of Sequence Alignments  
Reasoning: BAM is a binary version of SAM that is more space-efficient and quicker to access. It's recommended for the storage of sequence alignments when space and retrieval speed are concerns. 
BAM files retain the same information as SAM but in a more compact and indexed form, making them suitable for long-term storage and efficient data retrieval.

## VCF (Variant Call Format):
Use Case: Storing Called Variants  
Reasoning: VCF files are designed for storing information about genetic variants (e.g., SNPs, indels) detected in a set of samples. 
They contain variant calls, quality scores, and annotations, making them essential for storing and sharing variant data. 
VCF files are widely used in genomic research and are the standard for representing variants.

## FASTA (FAST-All):
Use Case: Storing DNA or Protein Sequences  
Reasoning: FASTA is a simple and widely used format for storing DNA, RNA, or protein sequences. 
It consists of headers and sequence data. 
FASTA files are ideal for archiving reference genomes or sequences, as they are easy to read, edit, and share. 
However, they do not contain alignment information or variant data, making them less suitable for those purposes.

# Associated costs

Sources:  
- https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2023/2023-09-26-BIO392-intro-variants-technologies.pdf    
- https://en.wikipedia.org/wiki/FASTA_format  
- https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/nichols/presentations/ohbm2014/imggen/Nho-ImgGen-WGSeqPractical.pdf  
- https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0  

## Whole Genome Sequencing

format | size | cost |
--------- | --------- | ---------- 
Raw | 750 GB | 375 CHF | 
SAM | 400'000 GB | 200'000 CHF | 
BAM | 100'000 GB | 50'000 CHF | 
VCF | 125'000 GB | 62'500 CHF | 
FASTA | 20'000 GB | 10'000 CHF |

### Whole Exome Sequencing

format | size | cost |
--------- | --------- | ---------- 
Raw | 7.5 GB | 3.75 CHF | 
SAM | 4'000 GB | 2000 CHF |
BAM | 1'000 GB | 500 CHF |
VCF | 1'250 GB | 625 CHF |
FASTA | 200 GB | 100 CHF |

	
# Familiarize with VCF format

- Header: Contains metadata and info about the reference genome  
- Data Section: Each line is a variant. The columns include info on the chromosome, position, variant, id, reference allelle, alternative allele, quality filtering and more.  
- Genotype Information: info about the genotype of individual samples can be stored as columns in the header.  







