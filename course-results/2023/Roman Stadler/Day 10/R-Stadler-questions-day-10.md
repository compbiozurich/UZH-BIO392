
# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**

- CHROM (Chromosome):
  - name or identifier of the chromosome where the variant is located
  - can also include scaffold or contig names if the variant is not assigned to a specific chromosome
  - Specification: An identifier from the reference genome or an angle-bracketed ID String

- POS (Position):
  - specifies the position or base pair coordinate on the chromosome where the variant is found
  - usually given as a numeric value
  - Specifiation:  Telomeres are indicated by using positions 0 or N+1, where N is the length of the corresponding chromosome or contig


- REF (Reference allele):
  - the DNA base that is found at the given position in the reference genome sequence
  - used as a point of comparison to determine the variant allele(s).

- ALT (Alternate alleles):
  - contains the alternate alleles or variant alleles observed at the specified position.
  - can contain multiple alternate alleles separated by commas if there are multiple variants
  - Each allele in this list must be one of: 
    - a non-empty String of bases (A,C,G,T,N)
    - the ‘*’ symbol (allele missing due to overlapping deletion)
    - the MISSING value ‘.’ (no variant)
    - an angle-bracketed ID String (“<ID>”)

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**

First we would need to identify the locus that we are searching for using the chromosmoe and position columns.
Then, the reference- and alternative allele columns can indicate if a variant is present.
If the reference allele matches the sample, then there won't be an entry, and thus we don't have a variant.
If, however, we have an entry, we can look at the reference and alternative allele columns to see how our sample is different. 
Moreover, if there is a value in the reference and a dot in the alternative, this means that there is either the absence of a variant or uncertainty in the variant calling process.


### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**

- Reference Sequence Track (APC.fa):
  - represents the reference genome sequence.
  - the custom APC reference sequence you loaded from the 'APC.fa' file

- Variant Call Format (VCF) Track (merged_results.vcf):
  - represents variations and differences in the APC gene and other regions of interest compared to the reference genome

- Gene Annotation Track (APC.gtf.gz):
  - The GTF (Gene Transfer Format) file track contains gene annotation information.
  - provides details about the gene structure, including the location of transcripts, exons, introns, coding sequences, and other features within the APC gene
  
- Alignment Tracks (BAM files):
  - the alignment tracks represent the alignment of sequencing reads to the reference genome
  - each alignment track provides information about read coverage, read depth, and the alignment quality for the samples


### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
Your answer here

### Q5
**What phenotype or disease do you expect this variant to be involved with?**
Your answer here
