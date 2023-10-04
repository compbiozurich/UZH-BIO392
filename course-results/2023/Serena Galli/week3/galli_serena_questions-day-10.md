
# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**

CHROM: chromosome number
POS: reference position on the given chromosome
REF: reference base/bases (A/C/G/T/N), in case of an insertion in the sequence of interest, the REF field contains the base before the variant
ALT: alternate base/bases in the sequence of interest, comma-separated list of alleles that deviate from the reference, '.' means no alternative alleles are detected; these are so-called monomorphic reference sites (GangSTR checks for every STR present in the reference genome, whether there is an alteration in the sequence of interest or not)

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
If the ALT field contains a string of bases, a variant was detected in the sample of interest. 
Besides strings, there are several special cases of deviation from the reference, which are symbolized for example with '*', '<*>', etc.

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**

* first track: shows the reference sequence of the APC gene
* second track: shows the variants in the APC gene (in our case including the monomorphic sites) and shows in which sample (patient 1/2/3) it was detected
* third track: shows the annotation of a genomic sequence, i.e. it tells us if a given genomic region is part of the transcript/exon/coding sequence/UTR of the APC gene
* fourth track: shows the alignment of reads to the reference for each patient individually. It gives an idea about coverage. Reads are colored in red, when the inferred insert size is larger than expected and colored in blue if an inferred insert size is smaller than expected. This can point to problems with sequencing, problems with alignment or the presence of an deletion (red) or insertion (blue). 


### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**

Variant 1 (additional a) in patient 1 is an intron variant and therefore doesn't affect the protein gene product. 
Variant 2 (additional agagagaga) in patient 3 is a frameshift variant, i.e. the entire gene sequence following the mutation will be incorrectly read and there might be a premature stop. For most of the different gene products of APC, the protein will be altered. 

### Q5
**What phenotype or disease do you expect this variant to be involved with?**

neoplasm of the gastrointestinal tract (large intestine / stomach)
