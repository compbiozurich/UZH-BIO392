Most species have more than one versions of the reference genome. Please find out:  

* The name and time of the latest version for Human, Mouse and E Coli.  
  Human: GRCh38/hg38 (Dez 2013)   
  Mouse: GRCm39/mm39 (Jun 2020)  
  E. Coli: ASM584v2 (Sep 2013)  
  
* The name and time of the first version for Human, Mouse and E Coli.  
  Human: NCBI34/hg16 (July 2003)  
  Mouse: NCBI35/mm7 (Aug 2005)  
  E. Coli: ASM584v1 (Jun 2004)  


* How many reference genomes were released in total for Human, Mouse, and E Coli.  
  Human: 5  
  Mouse: 5   
  E. Coli: 2  

* Find out the difference in chromosome length between the latest patch of hg38 and the last patch of hg19. 
  hg38 total sequence length: 3,099,706,404  
  hg19 total sequence length: 3,101,788,170  
  difference in chromosome length btw hg38 and hg19: 2'081'766 bp  

* With your favorite gene, find out its position in hg38 and hg18 (Human Gene OXT).  
  hg38 chr20:3,071,620-3,072,517
  hg18 chr20:3,000,266-3,001,162
* Show gene TP53 in the genome browser  
  
* Where is this gene? (chromosome, cytoband, and exact start and end positions)   
* How many isoforms does it have?  
  17 isoforms observed in the genome browser  
* How many exons does it have?   
  12 but depends on the isoform  
* What the size of its longest exon? (roughly)  
   1300bp
* Find the three closest genes in upstream and downstream, respectively.  
  ATP1B2
  WRAP53
  
  
  ### Liftover with UCSC Genome Browser 
* Down-lift: TP53 from hg38 to hg19  
chr17:7,668,421-7,687,490 -> chr17:7571739-7590808
* Up-lift: TP53 from hg19 to hg38
 chr17:7,571,720-7,590,868 -> chr17:7,668,402-7,687,550
* Cross-species-lift: TP53 from human to mouse
(GrCh38 to GRCm39)
chr17:7,668,421-7,687,490 -> chr11:69471228-69482695  
* Multi-step-lift: TP53 from hg38 to hg 18
(hg38 -> hg19 -> hg18)
chr17:7,668,421-7,687,490 -> chr17:7571739-7590808 -> chr17:7512464-7531533

* Liftover multiple positions with a BED file / Lift a larger range and interpret the result / Limitations of the liftover  
Works for the biggest part but several error messages were displayed eg. #Deleted in new, #Partially deleted in new, #Split in new 
We observe that the mapping is often not trivial and has various caveats  
SNVs with mutliple coordinates in target/base can eg cause problems.  
