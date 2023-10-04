
# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**

1. CHROM = chromosome, referring to a certain refference genome
2. POS = position,is a 1. based counting system .. so base 1 = 1
3. REF = reference base, give the base at the position referring to the reference genome
4. ALT =   alternate base(s), alternative Variants as deletions/insertions


### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**

Looking in the ALT column gives information about the variants ...
The MISSING value ‘.’ indicates that there are no variants. If there basses given in the REF column,
than you know that there variants.

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
Your answer here

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
Your answer here

### Q5
**What phenotype or disease do you expect this variant to be involved with?**
Your answer here
