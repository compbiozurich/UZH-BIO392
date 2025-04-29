§
# Questions BIO392 day 9
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to <First letter>-<Last name>-questions-day-09.md, and upload it to your folder in the course GitHub. Please submit before 13:00 on 6th May.
These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
* CHROM: Which chromosome are we on? It is identified via the reference genome.
  - in our case we are on chromosome 5
* POS: Which position contains a variant?
  - there is a variant in position 106700
  - and there is a variant in position 137481
* REF: What is the nucleotide in the reference genome? A ‘.’ means there is no variant.
  - in both position there is an 'a' in the reference genome
* ALT: What is the alternate allele of our sequence at this position? 
  - position 106700: aa instead of a
  - position 137481: agagagaga instead of a


### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
* Check the ALT column and see which nucleotide is noted there.
  - if there is a '.' we know that there is no variant, meaning the same nucleotide as in the reference genome
  - when there is a nucleotide (or multiple nucleotides) written in this column it means it is a variant
* To double-check you compare it with the base in the REF column.
  - To confirm you can then check, whether the nucleotide in the ALT column really is different from the REF column, to make     sure that it is a variant

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
* We have the tracks with the alignments of each patient. We see the different reads and their associated information when we click on them (read name, alignment start and map quality). At the top of each alignment we see a profile which could be the coverage of each base.
* We also have one track that represents the gene, with information on the source and the location on the chromosome that we are at. 
* Another one representing the transcript.
* And the last one “merged_results.vcf” contains the variant information for each patient.  

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
Your answer here

### Q5
**What phenotype or disease do you expect this variant to be involved with?**
Your answer here
