
# Questions BIO392 day 10
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-10.md, (e.g., M-Mustermann-questions-day-10.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**

* **CHROM** (= Chromosome): Information about the contig identifier or chromosome where the genetic variant is located in the genome.
* **POS** (= Position): Information about the reference position (genomic position) where the genetic variant on the specified contig or chromosome (CHROM) is found. The 1st base has the position 1.
* **REF** (= Reference Base(s)): Information about the DNA base (A,C,G,T,N case insensitive) found in the reference genome at the genomic position (given by CHROM & POS). Multiple bases are permitted.
* **ALT** (= Alternate Base(s)): Information about the alternative DNA base (A,C,G,T,N case insensitive) found in the genome at the genomic position (given by CHROM & POS) compared to REF. '*' stands for a missing allele due to overlapping deletion and '.' for a missing value (no variant). Multiple bases are permitted her as well.

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**

To determine whether a sequencing sample contains a variant, one can compare the 'REF' and the 'ALT' values. If they differ from each other, that means there is a variant. The 'ALT' can contain multiple bases, meaning there can be multiple variants at the same position ('CHROM' & 'POS').

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**

* **1st track:** Shows reference sequence, the different nucleotides are each a different colour.
* **2nd track:** Shows the different sequence regions (exons, introns, coding sequence (CDS), untranslated regions, etc.)
* **3rd track:** Shows the read coverage of the sequence regions.
* **4th track:** Shows the alignment track (how the sequences/reads are aligned).

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**

Out of the two STR variants identified, the 2nd variant (chr. 5, pos. 137481, ref. a, alt. agagagaga, patient_3) will have the most impact because the 1st STR variant is an intron variant meaning it won't be expressed or operative in the final RNA product. The 2nd STR variant is a frameshift variant causing a completely different translation from the original (reference). The polypeptide that will created will most likely be either be abnormally short or abnormally long and probably not functional.

### Q5
**What phenotype or disease do you expect this variant to be involved with?**

The variant is in the APC gene (regulator of WNT signaling pathway). APC encodes a tumor suppressor protein that acts as an antagonist of the Wnt signaling pathway and it is also involved in other processes such as cell migration, transcriptional activation, adhesion, and apoptosis. Mutations/defects in the APC gene cause (according to [this study](https://pubmed.ncbi.nlm.nih.gov/10470088/#:~:text=APC%20is%20often%20cited%20as,also%20have%20two%20APC%20mutations.)) familial adenomatous polyposis (FAP), which can lead to colorectal adenomas.
