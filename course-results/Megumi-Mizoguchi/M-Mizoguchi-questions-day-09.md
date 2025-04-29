
# Questions BIO392 day 9
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to <First letter>-<Last name>-questions-day-09.md, and upload it to your folder in the course GitHub. Please submit before 13:00 on 6th May.
These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
* CHROM indicates which chromosome or contig the variant is located on, based on the reference genome.
* POS specifies the exact position on the chromosome where the variant starts, with numbering beginning at 1.
* REF shows the reference base(s) at that position according to the reference genome. It represents the "original" sequence before any variation.
* ALT lists the alternate base(s) that differ from the reference at the given position. If ALT is a dot (.), it means no variant was detected and the sample matches the reference sequence at that site.

* CHROM: Which chromosome are we on? It is identified via the reference genome. 
chromosome 5

* POS: Which position contains a variant? 
POS 106700 and POS 137481

* REF: What is the nucleotide in the reference genome? A ‘.’ means there is no variant. 
The reference base is a.

* ALT: What is the alternate allele of our sequence at this position? 
At POS 106700, ALT = aa, and at POS 137481, ALT = agagagaga.

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
* Check the ALT column and see which nucleotide is noted there.  
* To double-check you compare it with the base in the REF column.
Done.

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
* We have the tracks with the alignments of each patient. We see the different reads and their associated information when we click on them (read name, alignment start and map quality). At the top of each alignment we see a profile which could be the coverage of each base.
* We also have one track that represents the gene, with information on the source and the location on the chromosome that we are at. 
* Another one representing the transcript.
* And the last one “merged_results.vcf” contains the variant information for each patient.  
Yes, I have checked all tracks.

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
The STR variant at position 112839979 (original POS 137481) has the most impact, as indicated by the IMPACT = HIGH annotation and the consequence = frameshift_variant in multiple protein-coding transcripts of the APC gene. A frameshift variant can disrupt the reading frame and lead to a non-functional protein, often resulting in severe functional consequences.
The variant at position 112809198 (original POS 106700) is labeled only as intron_variant with IMPACT = MODIFIER, which implies minimal or uncertain functional effect.

### Q5
**What phenotype or disease do you expect this variant to be involved with?**
The variant at position 112839979 affects the APC gene, a famous tumor suppressor gene.Frameshift mutations in APC are known to be associated with familial adenomatous polyposis (FAP) and significantly increase the risk of colorectal cancer. Thus, this STR expansion is expected to be involved in colon cancer predisposition.
