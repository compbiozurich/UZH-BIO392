# Questions BIO392 day 9
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to <First letter>-<Last name>-questions-day-09.md, and upload it to your folder in the course GitHub. Please submit before 13:00 on 6th May.
These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
* CHROM: Which chromosome are we on? It is identified via the reference genome. \
  
  Chromosome 5
  
* POS: Which position contains a variant?
  1. position 5 : 106700 
  2. position 5 : 137481
* REF: What is the nucleotide in the reference genome? A ‘.’ means there is no variant.
  1. a
  2. a
* ALT: What is the alternate allele of our sequence at this position?
  1. aa
  2. agagagaga

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
* Check the ALT column and see which nucleotide is noted there. 
* To double-check you compare it with the base in the 	REF column.

  When looking at the "[4]ALT" column and see a ' . ' it means that there is no variant. Whenever we see a sequence, it means that this is the sequence alternative to our reference sequence and therefore a variant. Additionally, at the "patient + number" column we see 0/0 for no variant and 1/1 for a homozygous variant and therefore now which exact patient has a variant at the specific spot. 0/1 or 1/0 indicates a heterozygous variant. 

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
* We have the tracks with the alignments of each patient. We see the different reads and their associated information when we click on them (read name, alignment start and map quality). At the top of each alignment we see a profile which could be the coverage of each base.
* We also have one track that represents the gene, with information on the source and the location on the chromosome that we are at. 
* Another one representing the transcript.
* And the last one “merged_results.vcf” contains the variant information for each patient.  

When looking at page, at the top we see the transcript. When zooming in completely, i get the exact seqeunce.
Below that we see the merged_results.vcf file. We have 4 rows, I think the upper one is the reference. When there is no variant, the box is grey, otherwise we see turquoise spots for our two Variants. When clicking on them I see the exact location and the Reference and the Alternative Sequence and which Patient it is from.
Below that we see the gene track, that gives us the Source (HAVANA, in our case) and when we click on it the exact location.
Lastly, on the bottom we see tha reads of each patient. Grey ones are well algined, read bases show mismatches and paired-end-reads are marked blue. When clicking on the reads we get information about the mapping quality and the exact location of the read. On top of all the reads we can see the coverage. 


### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
Your answer here

### Q5
**What phenotype or disease do you expect this variant to be involved with?**
Your answer here
