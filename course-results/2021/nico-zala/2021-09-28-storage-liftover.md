# Day5 Tasks  

### How much computer storage is required for 1000 Genomes?  

**WGS:** ~3* 10^9 bp and an average coverage depth of 30x  
**WES:** ~3* 10^7 bp and an average coverage depth of 90x  


**Assumptions for calculations:**  

-2 bits per base are sufficient to encode TCGA: (00,01,10,11)  
-from slides: 50CHF/100GB --> 0.5CHF/1GB  
-BAM files are the binary compressed format of SAM files and are ~1/4 of the size of SAM files.  

-FASTA: 200Mb for 2*10^8 bp  
-VCF: 125GB per genome , depth 30

File Format | WGS | WES
----------- | --- | ---
**BAM** | 50'000 Fr | 1'500 Fr
**SAM** | 200'000 Fr | 6'000 Fr
**FASTA** |45'000 Fr |1'200 Fr
**VCF** |62'500 Fr | 1'850 Fr


### Different Genome Editions (Liftover and its problems)

In the early 2000s the first human reference genome was released. In the upcoming years several improved editions of the human reference genome were made.  
Even the latest version (GRch38) isn't perfect and contains still unplaced bases.  
In the field of biology and medicine a lot of studies were performed and identified data mapped to different versions of the reference genome.  
To use the genome analysis coming from different genome editions, the **liftover** was created to convert all data to the same genomic system.  

There exist


