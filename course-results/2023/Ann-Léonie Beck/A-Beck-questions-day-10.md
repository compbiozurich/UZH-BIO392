
# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**

CHROM: stands for chromosome. identifier or id string from reference genome. 

POS: stands for position. base position in reference (first base -> position 1, telomeres -> position 0 or N+1)

REF: stands for reference base (or bases). either a,c g, t, n. POS value refers to first base in this string. 

ALT: stands for alternate base (or bases). variants are listed here( . stands for no variant)

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
if under ALT a base is listed, the sample contains a variant. 

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**

the coordinates
information about the reads of the three patients (eg. alignment start, quality ...)

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
the agagagaga variant is worse because

### Q5
**What phenotype or disease do you expect this variant to be involved with?**
Your answer here
