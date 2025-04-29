# Task 4: File Formats

## What is WES and WGS, what is the difference? 
#### WES: Whole exome sequencing 
* Sequencing only the protein-coding regions (1-2% of the hole genome) 
* Advantages:
  * Most genetic variants associated with human diseases are found
  * Can be used for early discovery of genetic diseases or variants and mutations in cancer tissue
  * Much less data and so also cheaper
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
* WES: should be sufficient when focusing on disease-causing variants or for large population comparisons (less complex)
* WGS: For individual genetic makeup, broader question or diseases linked to non-coding regions 

[Source](https://www.novogene.com/eu-en/resources/blog/wgs-vs-wes-which-genetic-sequencing-method-is-right-for-you/)

### Size		
#### WES: 		Exome 	
*	40x=Coverage, 	110,000,000= No. of Reads, 	75 = read length
*	5.7 GB = BAM File Size,	7.1 GB = Strand NGS Size 	-> ca. **8GB**
* With backups/etc. -> 1000 exon samples = **16TB** 

#### WGS:		Whole Genome 	
* 37.7x  = Coverage, 	975,000,000 = No.of Reads, 	115 = read length
* 82 GB = BAM File Size, 	 	104 GB = Strand NGS Size (+overhead) 	-> ca. **150GB**
* With backups/etc. -> 1000 genomes = **46TB**

[Source](https://www.strand-ngs.com/support/ngs-data-storage-requirements) 

## Different File Formats
#### FASTA
* a text file, not optimised for size
*	Use: linear annotation of nucleotides or amino acids -> the exact unaligned sequence
  *	--> for storing full archival purpose 

#### SAM: Sequence Alignment Map   
*	Use: storing alignment of lots of different sequences to a reference sequences
   * Characterizing and mapping the differences

#### BAM: binary version of Sequence Alignment Map (SAM)
*	Use: sames use as the SAM but a binary version 
  *	very fast for computers to read but not readable without a BAM-viewer
  *	--> visualized mapped genes -> browse edition 
 
#### CRAM: compressed version of BAM 
* space efficient; with multiple optimization and differential access options
*	Use: uses reference-based compression of sequence data and lossless/lossy mode of compression -> only stores the differences between the sequence and the reference
*	Size: 30-60% smaller than BAM equivalent 

#### VCF: Variant Call Format 
*	standard format for file-based storage of human genome variants, text file 
*	Use: storing variations between a reference genome and an aligned sequences (based on SAM/BAM alignment)
  *	used for output of a genome experiment, with multiple samples, for population studies,..., ->  very efficient
  *	--> for storing called variants and to visualize genetic variants -> browse edition 

[Source](https://rnnh.github.io/bioinfo-notebook/docs/file_formats.html#sam)


### Storage and Costs 
How much does it cost? 
Google Cloude Storage - Standard: [Europa/Zürich](https://cloud.google.com/storage/pricing?hl=de#europe)
* 0.025$/GB/Month = 0.3$ /GB/year

|File | Size per Genome (WGS, 30x Mean depth) | Costs per year | For 1000 Genomes per Year|
|------|---------------|----------------|---------------------------|
|FASTQ |80GB |24$|24'000$|
|BAM| 100GB |30$|30'000$|
|VCF| 1GB | 0.3$|300$|

|File | Size per Genome (WES, 100x Mean depth) | Costs per year | For 1000 Genomes per Year|
|------|---------------|----------------|---------------------------|
|FASTQ |5GB |1.5$|1500$|
|BAM| 8GB |2.4$|2400$|
|VCF| 0.1GB | 0.03$|30$|

[Source](https://3billion.io/blog/big-data-among-big-data-genome-data)


