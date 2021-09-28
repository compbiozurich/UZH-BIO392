# Day5 Tasks  

### How much computer storage is required for 1000 Genomes?  

**WGS:** ~3*10^9 bp and an average coverage depth of 50x  
**WES:** ~3*10^7 bp and an average coverage depth of 100x  

2 bits per base are sufficient to encode TCGA: (00,01,10,11)  
from slides: 50CHF/100GB --> 0.5CHF/1GB  
BAM files are the binary compressed format of SAM files and are ~1/4 of the size of SAM files.  

File Format | WGS | WES
----------- | --- | ---
**BAM** | 50'000 Fr | 1'500 Fr
**SAM** | 200'000 Fr | 6'000 Fr
**FASTA** ||
**VCF** ||


### Different Genome Editions (Liftover and its problems)
