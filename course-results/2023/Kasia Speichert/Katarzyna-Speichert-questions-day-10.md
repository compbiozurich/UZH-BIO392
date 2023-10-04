
# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
<br>CHROM: chromosome number form the reference genome
POS: base position within the reference chromosome (1st base = position no1)
REF: a base from the reference genome (either A,C,G,T or N)
ALT: represents an alternative allele that is found in our analyzed sample


### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
>br> I would compare the reference base to the alternative allele at the specific location. 

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
<br> For each bam file we observe reference genome track to which the sequences are alligned; merged .vcf results, APC_canonical_relative_coordinates and the sequence alignment tracks. 

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**

I expect the variant a -> agagagaga for the patient 3 to have the most impact since the mutation occurs mostly in the coding region which is affected in comparision to the other variant which is mostly included in introns.

### Q5
**What phenotype or disease do you expect this variant to be involved with?**

