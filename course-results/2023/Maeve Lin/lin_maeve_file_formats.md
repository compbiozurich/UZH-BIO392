# Estimate Storage Requirements for 1000 Genomes
## SAM: Sequence Alignment Map
### Data structure
Stores sequences that have been aligned to a reference genome. 

### Format
* Header (@)
* Alignment section with 11 mandatory fields (including a quality score)

### Sequence type
Short and long reads

### Cost factors

### Raw storage costs

### Advantage and when to use
First standardized data format. It is a text file, meaning that humans can read it. It is the output of all sequencers. 


## BAM: Binary Sequence Alignment Map
### Data structure
It is the binary and compressed version of SAM.

### Format
* Header
* Alignment section (including a quality score)

### Cost factors

### Raw storage costs

### Data requirement
30X file: 100GB
40X Exome: 6GB (https://www.strand-ngs.com/support/ngs-data-storage-requirements) 

### Advantage and when to use
Compressed, so it is smaller and faster to process. BAM files should be used for full archival purposes, because they contain the information of a whole genome but they are not too big, so storage is not that expensive. 


## VCF: Variant Call Format
### Data structure
Only stores the variants of a sequence in comparison to a reference genome. 

### Format
* Header (#)
* Body: tab-separated with eight mandatory columns


### Cost factors

### Raw storage costs

### Advantage and when to use
Use the VCF for storing called variants and for analyzing the data, because it only has the most necessary information. 
