
# Questions BIO392 day 9
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to <First letter>-<Last name>-questions-day-09.md, and upload it to your folder in the course GitHub. Please submit before 13:00 on 6th May.
These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
* CHROM: Which chromosome are we on? It is identified via the reference genome. 
<p> chromosome 5 </p> 
* POS: Which position contains a variant? 
<p> 106700 & 137481 </p> 
* REF: What is the nucleotide in the reference genome? A ‘.’ means there is no variant.  
<p> a </p> 
* ALT: What is the alternate allele of our sequence at this position? 
<p> aa & agagagaga </p> 

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
* Check the ALT column and see which nucleotide is noted there.  (e.g. aa or agagagaga)
* To double-check you compare it with the base in the 	REF column. (e.g.a)

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
* patient_1-3.bam: 
<p> We have the tracks with the alignments of each patient . We see the different reads and their associated information when we click on them (read name, alignment start and map quality). At the top of each alignment we see a profile which could be the coverage of each base. </p> 
* APC_canonical_relative_coordinates.gtf.gz: 
<p> We also have one track that represents the gene, with information on the source and the location on the chromosome that we are at. </p> 
* APC.fa:
<p> Another one representing the transcript. </p> 
* merged_results.vcf:
<p> Contains the variant information for each patient. </p> 

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
<p> The chr5 112839979 a agagagaga variant has more impact than the chr5 112809198 a aa variant. The agagagaga variant leads often to frameshifts, which has in most castes negative effects on protein coding. The aa variant has mostly effect on introns, which are mostly harmless (usually they are getting spliced out). </p> 

### Q5
**What phenotype or disease do you expect this variant to be involved with?**
<p> A variant in the APC gene, which is a regulator of the WNT signalling pathway, can lead to colorectal and stomach neoplasms. </p> 
