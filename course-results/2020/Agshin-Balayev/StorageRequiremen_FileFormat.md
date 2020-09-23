# Storage Requirement

## WGS: if 2 bits per base are used: 1000*2*3.1*10^9= 6.2x10^12 bits /10 = 6.2x10^11 bytes/1024=605468750 KB/1024=591278.076172 MB/1024 = 577.4 GB
## WES: if 2 bits per base are used: 1000*2*3.1*10^7= 6.2x10^10 bits /10 = 6.2x10^9 bytes/1024=6054687.5 KB/1024=5917 MB/1024 = 5.77 GB

#File Formats

## SAM: text file used for sequence alignment. Useful for browser visualization.
## BAM: binary file used for sequence alignment and compressed version of the SAM.
## CRAM: binary file and extermely compressed version of SAM file. 
## FASTA: text file to store reference genome. Useful for archival purposes.
## FASTQ: text file to store read info
## VCF: text file to embed variants. Useful for preserving variants. 
## MPEG-G: standard with certain improvements to limitations facing genomic alignment value. For example:
* 10x improvement in compression relative to BAM 
* Selective access
* API to zipped version
* Data protection mechanism
* Usage of streamline applications
* Fastq/SAM/BAM from/to conversion

