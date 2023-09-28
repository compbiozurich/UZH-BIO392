Please provide 1- page size estimates and reasoning for the use of the different file types (i.e. which would you use for storing called variants, which for full archival purposes, browser visualisation), for 3-5 formats. Submit your files (.md) per pull request to your Github directory


## **Calculations for 1 human genome (WGS 30x if not otherwise specified)**

**FASTA file** (no header line):  
Every nucleotide letter can be encoded by 2 bits.  
3 *10^9 bp * 30 (average coverage) * 2 (2 bits per nucleotide)= 180 billion bits = 22.5 GB  

**FASTQ file** (no @ control lines, no carriage returns):  
A FASTQ file includes quality score for each base, which encompasses of a variety of different letters and symbols used. Thus, we can’t simply double the file size (2 bit per base + 2 bit per quality score) because a single character can’t be encoded by two bits anymore but every base needs approximately one byte (including quality score).  
3 *10^9 bp  * 30 (average coverage) * 1 byte = 90 GB (I found 80GB in the literature)  

For **WES**, typically a coverage of 100x is aimed at. Since the exomes contain only ~2% of the entire sequence, the file size has to be multiplied by 100/30 (different coverage) and divided by 50 (different bp number).   
For a FASTQ file, this means: 90GB *100/(30*50) = 90GB * 1/15 = 6GB (I found 5GB in the literature)  
This can be computed analogously for the FASTA format.   

**SAM/BAM/CRAM file**:  
In addition to a FASTQ file, a SAM file contains the mapping information including mapping quality information.   
A BAM file is its binary and compressed equivalent and has the size of ~100GB (value found in the literature).  
A CRAM file allows for more efficient compression of the data.   
Since neither sequencing nor mapping nor variant callingwork perfectly, the raw sequencing reads and associated quality data need to be archived to for future analysis.  in form of a FASTQ format for future reanalysis.  
As a BAM file contains all this information and can be converted back to a FASTQ file, the BAM file is the right format for archiving the data.  

**VCF file**:  
A typical human genome has ~5 million variants. Each line encodes one variant and uses ~45 bytes (one sample/VCF file).  
5’000’000 * 45bytes = 180’000’000 bytes = 180 MB  
This is the most efficient way of storing the data and is typically used for downstream analysis and interpretation and can be shared easily between collaborators. 



## **Calculations for 1000 human genomes**

FASTA (WGS 30x): 22.5GB * 1000 = 22’500 GB = ~2.2TB
FASTQ (WGS 30x): 90GB * 1000 = 90’000 GB = ~87.9TB

FASTQ (WES 100x): 6GB * 1000 = 6’000 GB = ~3TB

BAM (WGS 30x): 100GB * 1000 = 100’000 GB = ~97.7TB

VCF (WGS 30x): 180MB * 1000 = 180’000MB = ~176 GB  
Alternatively, we could store all the 1000 genomes in 1 VCF file. In that case, we would have less lines in total since some variants are shared. But, compared to a VCF with only one sample, 999 columns need to be added (1 column per sample). 
Assuming that 2% of the variants of an individual (i.e. 100’000) are rare and not shared with any other individual in this cohort of 1000 people, the VCF file will contain 4.9 Mio + 1000 * 100’000 = 104.9 Mio lines
(5’000’000 *1000 = 500Mio lines in total, when stored as VCF file per individual).   
Depending on the number of rare mutation, the number of shared rare mutations and the number of bytes per line with 1000 samples, this alternative might consume more or less disk space than saving each VCF file separately. 



## **Costs**

The BAM files of 1000 human genomes have the size of ~100TB.  
Assuming that 16TB cost CHF 550.-, the total storage space costs ~3'400 CHF (raw storage costs, no cost for services included). 

