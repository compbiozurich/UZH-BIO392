# File format
Jonas Kretz 
### infos **1000 Genomes Project** :
* sample size = 2504 genomes 	
* genome size --(3*10^9b) perfect human genom 	
* WES ca 1% of genom -->ca 3*10^7
* WES mean depth = 65.7X
* WGS mean depth = 7.4X	
* WES mean depth = 65.7X
### info cost:
cost per GB Lecture: 0.5 CHF/GB     Amazone EU (LONDON): ca 0.024$/GB = 0.02384CHF/GB
## SAM: Sequence Alignment/Map format
* info: TAB-delimited text based format for storage  of sequence aligned to reference (Standard torage where reads map to reference. BAM = binary version,

(1 Genome ca 500GB/30XBAM) **Cost and size bigger than BAM**

## BAM: Binary Alignment Map
* info: Binary SAM File used for aligned reads to data.

Storage:

	WGS:
  
	100GB/30XBAM---->24.67GB/7.4XBAM (lecture)
  
	24,67GB*2504 genomes = 61773.68GB
  
	WES:
  
	1% of 100GB-->1GB/30XBAM ---->2.19GB/65.7XBAM
  
	2,19GB*2504 = 5483.76GB 
  
Cost: 	  Lecture(0.5CHF/GB) WGS= 30886.84CHF WES= **2741.00CHF**

Amazone(0.02384CHF/GB) WGS= 1472.68CHF WES= **130.73CHF**
## CRAM
* info: Compress SAM/BAM files for long-term storage can be up to 60% smaller tahn SAM/BAM (https://www.ga4gh.org/news/cram-compression-for-genomics/)

aprox cost (Amazone WGS=750CHF and WES=65CHF

## VCF:Variant Call Format 
* info: is a text file format used for storing gene sequence variations. multiple interpretations of sequence compered to reference.(lecture slide 23)

Storage:

	WGS:
  
	125GB/30XVCF--->30.83GB/7.4XVCF (https://www.biostars.org/p/315213/)
  
	30.83GB*2504 genomes = 77198.32 GB
  
	WES:
  
	1% of 125GB and convert to 65.7 = 2.74GB/65.7XVCF
  
	2,74GB*2504 = 6860.96 GB
  
Cost:	Lecture(0.5CHF/GB) WGS: 38599.16CHF WES: **3430.48CHF**

Amazone(0.02384CHF/GB) WGS= 1840.41CHF WES= **163.57CHF**
## FASTA
* info: text based, only letters ideal for short sequence DNA, RNA or protein.

Cost and storag would be high. not ideal for a project like 1000 genes.
## BED: Browser Extensible Data

* info: ﬂexible way to deﬁne the data lines in an genome browser annotation tracks (lecture slide 22) more for chromosom position (mapping with genomic coverage)

not ideal for the task 
## Conclusion:
**The best Storage solution for the 1000GP would be a CRAM file since the cost would be lowest for it. Also the Data transfair should be taken in to considaration 
However files should be choosen by work what will be done with it and cost**
