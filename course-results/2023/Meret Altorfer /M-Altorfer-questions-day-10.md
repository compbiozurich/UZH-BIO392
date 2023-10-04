
# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
- **CHROM**:specifies the name of the chromosome or reference sequence,  where the variant is located
- **POS**: position of the variant on the reference chromosome. It prepresents the starting base of the variant.
- **REF**: reference allele at the given position in the reference genome
- **ALT**: alternate allele(s) at the given position of the sequenced sample

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
First, we have to idetnify the chromosome and position (CHROM and POS) where we want to determine if a vriant is present in our sequencing sample. 
Second,we look at the REF and the ALT columns. We can compare the allele(s) of the reference genome with our sequencing sample to identify variants. 

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
Your answer here

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
Your answer here

### Q5
**What phenotype or disease do you expect this variant to be involved with?**
Your answer here
