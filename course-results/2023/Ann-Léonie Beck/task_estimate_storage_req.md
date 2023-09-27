# WES & WGS

WES: whole exome sequencing

WGS: whole genome sequencing 

WGS:
- determines the order of all nucleotides in an individual's DNA
- can uncover variation in any part of the human genome (coding, noncoding, mtDNA regions)
- produces very large datasets -> costly

WES:
- genomic proteincoding regions (exons)
- cost-effective, requires less time than WGS
- the human exome contains ~85% of known disease-related variants
- lengthier sample preparation, quicker sequencing and data analysis comapred to WGS

(https://sequencing.roche.com/us/en/article-listing/wes-wgs-custom.html)

# SAM & BAM
SAM stands for sequence alignment and map
BAM stands for binary alignement and map

SAM files: 
- text file
- alignement information of various sequences mapped against reference sequences (or unmapped sequences)
- readable by humans

BAM files:
- binary file format -> unreadable for humans
- same info as SAM files
- standard alignment file
- smaller and more efficient for software comapred to SAM files -> ssaves time and reduces costs of computation and storage
  (https://zymoresearch.eu/blogs/blog/what-are-sam-and-bam-files)
  (https://www.internationalgenome.org/category/cram/)

  costs: $300-500/TB/year (with hidden costs of support and IT personnel) (PetaGene)

# CRAM
- compressed version of the BAM file
- was designed to reduce the data volume -> less storage (40-50%) 
(https://www.internationalgenome.org/category/cram/)
(https://www.sanger.ac.uk/tool/cram/)

# VCF
VCF stands for Variant Call Format
Stores gene sequence variations
- used by large scale variant mapping projects (eg. IGSR)
- Stanard output of variant calling software (eg. GATK) and standard input for variant analysis tools (eg. VEP) or variant archives (eg. EVA)
- unambiguous, scalable, flexible
- extra info can be added to the info field
- many millions of variants can be stored in a single VCF file
(https://www.ebi.ac.uk/training/online/courses/human-genetic-variation-introduction/variant-identification-and-analysis/understanding-vcf-format/)




The NIH estimates that genomics research will generate between 2 and 40 exabytes of data within the next data (1 exabyte = 100'000'000 GB). The NHGRI provides over 125 million dollers per year  
https://www.genome.gov/about-genomics/fact-sheets/Genomic-Data-Science

