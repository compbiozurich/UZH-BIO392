
# Questions BIO392 day 9
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to <First letter>-<Last name>-questions-day-09.md, and upload it to your folder in the course GitHub. Please submit before 13:00 on 6th May.
These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
* CHROM: Which chromosome are we on? It is identified via the reference genome.
  * We are on chromosome 5.
* POS: Which position contains a variant?
  * For example the position 106700 contains a variant. 
* REF: What is the nucleotide in the reference genome? A ‘.’ means there is no variant.
  * The nucleotide in the reference genome at this position is "a". 
* ALT: What is the alternate allele of our sequence at this position?
  * For this specific position there is an alternate allele: "aa" 

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
* Check the ALT column and see which nucleotide is noted there.
  *  For position 137481: agagagaga
* To double-check you compare it with the base in the REF column.
  * Base in the REF column: "a" 

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
* We have the tracks with the alignments of each patient. We see the different reads and their associated information when we click on them (read name, alignment start and map quality). At the top of each alignment we see a profile which could be the coverage of each base.
  * bases that don't match the reference are highlighed/marked
  * Pairs with larger than expected insert size are colored red
  * the bam files of the patients 
* We also have one track that represents the gene, with information on the source and the location on the chromosome that we are at. 
* Another one representing the transcript.
  * shows the bases in different colours 
* And the last one “merged_results.vcf” contains the variant information for each patient.  

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
Your answer here

$ awk 'BEGIN {OFS="\t"} /^#/ {print; next} {if ($1=="chr5") {$1="5"; $2=$2+112702498; split($8, info, ";"); for(i in info) {if(info[i]~/^END=/) {split(info[i], end, "="); end[2]=end[2]+112702498; info[i]="END="end[2]}} $8=""; for(i=1; i in info; i++) {$8=$8 info[i]; if(i<length(info)) $8=$8";"} } print}' merged_results.vcf > merged_results_GRCh38.vcf



### Q5
**What phenotype or disease do you expect this variant to be involved with?**
Your answer here
