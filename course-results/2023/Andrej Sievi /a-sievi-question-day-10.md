# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
* CHROM: We are looking at Chromosom 5. The CHROM tells us on which Chromosmom our investigation taking place. 
* POS: On position it is displayed which position on CHROM we are looking at. 
* REF: On referrence it is displayed which nucleotide at the place on CHROM occurs from the reference genom.  
* ALT: ALT displays the alteration from the reference genom to our investigation genom.
 At CHROM:chr5	106700	we have an alteration(duplication) to a	from aa.
 And at  CHROM: chr5	137481 there is an alteration to a from agagagaga
 A ‘.’ means there is no variant. 
  

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
* Check the ALT column and see which base is noted there.  
* To double-check you compare it with the base in the 	REF column.
* 
* Uracil base is not contained. A ‘.’ means there is no variant.

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
In the IGV we uploaded the genom reference, VCF file, annotations and our BAM file from the three patient. 
With the alignment we can see the STR on the patients. The Variant Effect predictor tells us if the STR are located in the exon or intron nad further
the impact on the patient or even Disease

colored pairs: too close or too far awar from each other




### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
the change from a to agagagaga should have the most severe impact due to frameshift. 

### Q5
**What phenotype or disease do you expect this variant to be involved with?**
Your answer here
