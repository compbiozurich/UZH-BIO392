
# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**

* **CHROM** (= Chromosome): Information about the contig identifier or chromosome where the genetic variant is located in the genome.
* **POS** (= Position): Information about the reference position (genomic position) where the genetic variant on the specified contig or chromosome (CHROM) is found. The 1st base has the position 1.
* **REF** (= Reference Base(s)): Information about the DNA base (A,C,G,T,N case insensitive) found in the reference genome at the genomic position (given by CHROM & POS). Multiple bases are permitted.
* **ALT** (= Alternate Base(s)): Information about the alternative DNA base (A,C,G,T,N case insensitive) found in the genome at the genomic position (given by CHROM & POS) compared to REF. '*' stands for a missing allele due to overlapping deletion and '.' for a missing value (no variant). Multiple bases are permitted her as well.

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**

To determine whether a sequencing sample contains a variant, one can compare the 'REF' and the 'ALT' values. If they differ from each other, that means there is a variant. The 'ALT' can contain multiple bases, meaning there can be multiple variants at the same position ('CHROM' & 'POS').

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**

.

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**

Your answer here

### Q5
**What phenotype or disease do you expect this variant to be involved with?**

Your answer here
