
# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**

**CHROM:** This stands for 'Chromosome' and refers to the chromosome the sequence is from compared to a reference genome.

**POS:** This stands for 'Position' and refers to the position of a variation when the sequence is compared to the reference genome. 

**REF:** This stands for 'Reference Bases' and refers to the bases present at a specific position in the reference genome.

**ALT:** This stands for 'Alternate Bases' and refers to the bases that are not present at said position in the analyzed sequence.

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**

We would have to refer to the 'ALT' column and see if the listed bases vary from the 'REF' column.

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**

reference genome: Is the reference with which we compare the sequences. 

merged_results.vcf:

APC_canonical_relative_coordinates.gtf.gz: This adds the annotations of the genome.

patient_1-3.bam: This indicates the different sequenced sequences for each patient.

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**

I expect variant 85 (POS=137481) to have the most impact because it impacts a protein. The other variant affects a regulatory feaure, and while this may still have a significant impact, I expect the altered protein to lead to a larger issue. 

### Q5
**What phenotype or disease do you expect this variant to be involved with?**

According to a database, the affected gene is PLEKHG4B. The protein functions as a gunine nucleotide exchange factor (GEF). If this protein is no longer functional, this might lead to cells no longer being able to grow since the Ras pathway is blocked.
