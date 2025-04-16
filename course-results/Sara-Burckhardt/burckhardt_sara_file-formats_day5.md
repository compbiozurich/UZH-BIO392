# Task 4: File Formats

## What is WES and WGS, what is the difference? 
#### WES: Whole exome sequencing 
* Sequencing only the protein-coding regions (1-2% of the hole genome) 
* Advantages:
  * Most genetic variants associated with human diseases are found
  * Can be used for early discovery of genetic diseases or variants and mutations in eg. cancer tissue
  * Much smaller and so also cheaper
* Disadvantages:
  * One can miss important variants outside of the exome (eg. regulatory regions), misses structural variants/large insertions/deletions

#### WGS: Whole genome sequencing 
* Sequencing the entire genome (protein-coding + non-coding regions) 
* Advantages:
  * Identify all variants -> get better overview of the genetic makeup/ get information about ancestry/population genetics 
* Disadvantages:
  * Provides a lot of data = more computational resources -> more expensive
  * More false positive results (especially low-frequency variants) 

The Choice depends on the question: 
* WES: should be sufficient when focus on disease-causing variants or for large population comparisons (less complex)
* WGS: For individual genetic makeup, broader question or diseases linked to non-coding regions 

[Source](https://www.novogene.com/eu-en/resources/blog/wgs-vs-wes-which-genetic-sequencing-method-is-right-for-you/)

### Size		
#### WES: 		Exome 	
*	40x=Coverage, 	110,000,000= No. of Reads, 	75 = read length
*	5.7 GB = BAM File Size,	7.1 GB = Strand NGS Size 	-> ca. *8GB*
* With backups/… -> 1000 exon samples = *16TB* (one exon minus backup = 8GB)

#### WGS:		Whole Genome 	
* 37.7x  = Coverage, 	975,000,000 = No.of Reads, 	115 = read length
* 82 GB = BAM File Size, 	 	104 GB = Strand NGS Size (+overhead) 	-> ca. *150GB*
* With backups/ … -> 1000 genomes = *46TB* (one genome minus backup = 150GB)


[Source](https://www.strand-ngs.com/support/ngs-data-storage-requirements) 

