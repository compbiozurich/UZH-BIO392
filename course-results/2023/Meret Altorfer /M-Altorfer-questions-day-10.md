
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
(When the bases in REF and ALT are not the same, there is a variant.)

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
- first track: reference genome sequence  (uploaded via the genome button) 
- second track: VCF file, shows us where the alternate alleles are (light blue means there is a variant , grey means theres no difference between sampled sequence and reference sequence=
- third track: GTF files shows the length of our gene of interest (APC Gene)  and where the Coding Sequences (CDS) are on this gene (marked blue)
- forth track: BMA file shows number of reads and mapping quality (if coloured: bad quality)
### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
Intron variants are the most common (40%) but don't have much influence. The most impact has the variant in the coding sequence (GAGAGAGA) because it leads to a frameshift, and therefore protein with another function (because of different amino acids or stop-codons)



### Q5
**What phenotype or disease do you expect this variant to be involved with?**
 The phenotype with this frame-shift mutation is associated with formation of tumors in the large intestine or in the stomach, (due to the fact that APC is a tumor-supressor gene).
