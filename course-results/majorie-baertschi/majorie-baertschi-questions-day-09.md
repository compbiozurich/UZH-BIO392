# Questions BIO392 day 9
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to <First letter>-<Last name>-questions-day-09.md, and upload it to your folder in the course GitHub. Please submit before 13:00 on 6th May.
These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
* CHROM: This column tells us which chromosome we are on. It is identified via the reference genome.
  - in our case we are on chromosome 5
* POS: Tells us which position contains a variant
  - in our example there is a variant at position 106700
  - and there is a variant at position 137481
* REF: This column tells us about the nucleotide in the reference genome at the same position. A ‘.’ means there is no variant.
  - in both position there is an 'a' in the reference genome
* ALT: Tells us what the alternate allele of our sequence is at this position
  - position 106700: aa instead of a
  - position 137481: agagagaga instead of a


### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
* Check the ALT column and see which nucleotide is noted there.
  - if there is a '.' we know that there is no variant, meaning we have the same nucleotide as in the reference genome
  - when there is a nucleotide (or multiple nucleotides) written in this column it means it is a variant
* To double-check you compare it with the base in the REF column.
  - To confirm you can then check, whether the nucleotide in the ALT column really is different from the REF column, to make     sure that it is a variant.

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**

* On the top we have a colorful track, which is the reference sequence overview. The color reflects the nucleotide base at this position. We have 4 different colors for the 4 different bases.
  
* Then we have the merged_results.vcf track, which shows variant calls from a VCF file. We have vertical blue bars, that indicate at which position we have a SNP for example or another variation. This is indicated for each patient.
  
* We then have a track called "APC_canonical_relative_coordinates.gtf.gz". This track represents the annotated gene structure. The blue boxes represent the exons and the white arrows show the direction of transcription of the gene. This also provides information about the location on the chromosome that we are on.

* Lastly we have the three tracks with the alignments of each patient (patient_1.bam...). We see the different reads and their associated information when we click on them (read name, alignment start and map quality). At the top of each alignment we see a grey histogram which could be the coverage of each base. When we hover over it, we see the coverage for each base. Below that, we have the sequencing reads. We have grey bars where we have aligned reads (compared to reference genome), when we have red bars we have mismatches, deletions or insertions.



### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**

Most likely the GAGAGAGA allele at position 5:112839979-112839988 is the one having the greatest impact, because it is a frameshift mutation. When we have an altered reading frame because of a frameshift, this often leads to a premature stop codon. Then we have a shortened/truncated and often a not functional protein (due to non_mediated_decay NMD). And because APC is a tumor suppressor gene, the consequences of a NMD and a non-functional protein can be uncontrolled cell growth and eventually cancer. The other variant we identified is an Intron variant, which normally don't have great functional impact, so in our case it's also not expected that the intron variant has an impact on the APC gene function. 

### Q5
**What phenotype or disease do you expect this variant to be involved with?**

As mentioned above, the APC gene codes for a tumor suppressor protein. When we have a variant in the APC gene with functional impact this can lead to abnormal cell growth and tumor formation. Therefore we can say this variant we identified is most likely involved with a cancer phenotype. In the paper by [Lu Zhang and Jerry W. Shay](https://pmc.ncbi.nlm.nih.gov/articles/PMC5963831/pdf/djw332.pdf) they nicely explain why the loss of APC tumor suppressive functions initiates colon cancer. APC is a key negative regulator of the canonical Wnt signaling
pathway. This pathway controls cell proliferation and differentiation in the gastrointestinal tract. When we have no APC, Wnt signaling is activated and cell proliferation and differation are no longer coordinated in the GI tract. This leads to unregulated cell growth in the intestinal epithelium, promoting colon cancer.
