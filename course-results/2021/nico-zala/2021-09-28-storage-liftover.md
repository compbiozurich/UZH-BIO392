# Day5 Tasks  

### How much computer storage is required for 1000 Genomes?  

**WGS:** ~3*10^9 bp and an average coverage depth of 30x  
**WES:** ~3*10^7 bp and an average coverage depth of 90x  


**Assumptions for calculations:**  

-2 bits per base are sufficient to encode TCGA: (00,01,10,11)  
-from slides: 50CHF/100GB --> 0.5CHF/1GB  
-BAM files are the binary compressed format of SAM files and are ~1/4 of the size of SAM files.  

-FASTA: 200Mb for 2*10^7 bp  
-VCF: 125GB per genome , depth 30

File Format | WGS | WES
----------- | --- | ---
**BAM** | 50'000 Fr | 1'500 Fr
**SAM** | 200'000 Fr | 6'000 Fr
**FASTA** |450'000 Fr |12'000 Fr
**VCF** |62'500 Fr | 1'850 Fr


### Different Genome Editions (Liftover and its problems)
