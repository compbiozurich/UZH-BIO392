
# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
`CHROM` stands for "chromosome". This column contains a number indicating the chromosome number in the reference genome.
`POS` stands for "position". This column contains the reference position.
`REF` stands for "reference base/s". In this column, it is stated which base/s are found at position `POS` on chromosome `CHR` of the reference genome.
`ALT` stands for "alternate base/s". This column contains a list of alleles found at position `POS` which differ from the `REF` allele/s.

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
If there is a variant, the `ALT` column should contain something other than ".". We could use this information to filter for all the rows which indicate a variant.

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
At the very top, we see the reference genome sequence track. It is represented by colored bars (if we zoom in, colored letters indicating the nucleotides).
The gtf file we read in contains information about where genes are located in the reference genome.
Additionally, there are three tracks generated for each alignment file we load:
* the Alignment track
* the Coverage track
* the Splice Junction Track
The Coverage track shows how many reads cover each individual locus. This is displayed as a gray bar chart.
The Alignmant track displays the individual reads. Insertions (with respect to the reference) are indicated with a purple `I` symbol, deletions with a black bar.
The Splice Junction Track will be displayed only if selected so in the Alignment Preferences panel.


### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
I expect the variant at position 137481 (or translated: 112839979) to have more impact because it induces a frameshift (while the other variant is located in an intron).

### Q5
**What phenotype or disease do you expect this variant to be involved with?**
Large intestine and/or stomach tumour
