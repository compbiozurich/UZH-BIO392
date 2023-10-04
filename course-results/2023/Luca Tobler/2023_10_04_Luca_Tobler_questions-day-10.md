# Questions BIO392 day 10

These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1

**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
- CHROM: chromosome on the reference genome where the variant is located 
- POS: position, first base has position 1, Telomeres have positions 0 or N+1. 
- REF: reference base, the first base of this string is in the position of the POS value. In the case of indels, where the ALT or the REF sring would be empty/null, the REF and ALT strings must include the base before the event. Permitted characters are: A,T,G,C,N. 
- ALT: The alternate alleles that differ from the reference genome. can be a comma seperated list. Permitted characters are: A,T,C,G,N,* (case insensitive).

### Q2

**Using these four columns, how could you determine whether a sequencing sample contains a variant?** 
An entry is generated whenever there is a variation. Exeptions are the "." and "*". "." means that the variant does not have a known identifier. and will also be placed if the Phred score indicates high uncertainty. 



### Q3

**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains** Your The upper most track contains the reference genome, as a nucleotide sequence. The next one are the merged results, showing locations where we found variations. the next track conatins the Genome annotations from the gtf files, it describes the structure of the reference genome. The next tracks show the alignments in the patients.

### Q4

**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?** 
the output shows an SNP of A, which leads to alternative variants of introns and transcripts (both coding and non-coding). The output also shows short tandem repeat of GAGAGAGA, which leads to a frameshift and would likely have a far greater impact. 

### Q5

**What phenotype or disease do you expect this variant to be involved with?**
according to: https://www.ncbi.nlm.nih.gov/clinvar/RCV000144571/
this seems to be involved with familial polyposis in the intestine