## GATK Report


* **We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?**


  It shows the comparison of the tumorcells and normalt tisse. The tumor cells seem to have a mutation in this base which is indicated by the red line. The normal cells cave a Cytosin while the tumorcells have a Thymin at this position.
  
  
----  
  
* **What does the coverage tell you?**


  The coverage gives confirmation that this mutation is not there just by chance rather its recurring. This shows and can confirm that this is a common mutation for this cancertype.


----   
* **What are the three grouped tracks for the bamout? What do the colors indicate? What differentiates the pastel versus gray reads?**

  (HC -> HaplotypeCaller)
  The three grouped tracks are the normal samples, tumor samples and the HC. The grey reads belong to the referennce genome where the pastel reads to haplotypes each color representing what HC the reads are part of. 
  Only thee green and red one seem to be relevant for this C → T Mutation. The green one seems to refer the tumor cells and the red one to the normal cells.
 


---
* **How do you feel about this somatic call?**



  It seems to be very promising that this C → T Mutation can be acossiated with this cancertype. 

