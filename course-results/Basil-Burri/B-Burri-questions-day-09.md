# Assignment by Basil Burri
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**

- **CHROM:** Specifies the chromosome where the variant is located. Specification is based on the reference genome. 
- **POS:** Indicates the base position of the variant on the chromosome.
- **REF:** Base in the reference genome at the given position. The "." indicates that no variant is found at the position. 
- **ALT:** Specifies the alternative allele observed in the sample at this position that differs from the reference.

**Information from our example**
- Which chromosome are we on? **CHROM: chr5 (chromosome 5)**
- Which position contains a variant? **POS: 106700, 137481**
- What is the nucleotide in the reference genome? **REF: "a" at pos 106700, "a" at pos 137481**
- What is the alternate allele of our sequence at this position? **ALT: "aa" at pos 106700, "agagagaga" at pos 137481**

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**

First, one can check whether a position (POS) has a known variant (ALT). By comparing the alternative base(s) from the ALT column with the base from the reference column (REF), one can be sure that it is really a variant. By looking at the sample column of the position with the variant, one can see whether a sample contains on both alleles (1/1), on one allele only (1/0 or 0/1), or on none of the alleles (0/0) the variant.

**Information from our example**
- patient_1 has on both alleles (1/1) the variant "aa" at pos 106700 on chr5.
- patient_3 has on both alleles (1/1) the variant "agagagaga" at pos 137481 on chr5.

### Q3
**After loading all the files into IGV, there should be four different kinds of tracks. Briefly explain what type of information each track contains**

**Alignment Tracks**
- The alignment tracks (patient_1.bam, patient_2.bam, patient_3.bam) display the short reads aligned to the reference.
- Each read is represented as a horizontal bar, color-coded to indicate orientation, mismatches, or insertions/deletions.
- By clicking on the reads, one can display metadata: Read name, position on the reference genome, mapping quality.
- Above each alignment track, a coverage histogram is displayed that shows the sequencing depth at each base.

**Gene Annotation Track**
- This track provides structural information about the gene based on the GTF annotation file (in our example the APC_canonical_relative_coordinates.gtf.gz file). The track can show the location of exons and introns, gene boundaries, and UTRs. The track includes gene source information (in our example HAVANA).

**Transcript Track**
- This track displays individual RNA transcripts associated with the gene from a GTF file (in our example the APC_canonical_relative_coordinates.gtf.gz file).

**Variant Call Track**
- This track contains merged variant calls derived from all patients (in our example the merged_results.vcf file). Each variant is positioned on the genome. This merged VCF format allows visual comparison to the reference across all patients.

### Preliminary work for Q4 and Q5

- **Problem:** The genomic coordinates in our VCF file do not match the true coordinates in the human reference genome due to our use of only the APC gene sequence, which starts at position 112702498 on chromosome 5. To convert to GRCh38 coordinates, we need to add 112702498, and VEP requires chromosome identifiers as numbers without the "chr" prefix.
- **Solution in BASH** ``$ awk 'BEGIN {OFS="\t"} /^#/ {print; next} {if ($1=="chr5") {$1="5"; $2=$2+112702498; split($8, info, ";"); for(i in info) {if(info[i]~/^END=/) {split(info[i], end, "="); end[2]=end[2]+112702498; info[i]="END="end[2]}} $8=""; for(i=1; i in info; i++) {$8=$8 info[i]; if(i<length(info)) $8=$8";"} } print}' merged_results.vcf > merged_results_GRCh38.vcf
``


### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**

- [Variant Effect Predictor results for our example](https://useast.ensembl.org/Homo_sapiens/Tools/VEP/Results?tl=HzKmIptCs1D4LCl6-11001336)
- The variant "GAGAGAGA" at location 5:112839979-112839988 will lead to a frameshift in the protein coding region of the APC regulator of WNT signaling pathway (ENST00000257430.9).

### Q5
**What phenotype or disease do you expect this variant to be involved with?**

- A frameshift mutation in the APC gene disrupts its normal function in regulating β-catenin degradation, leading to constitutive activation of the WNT pathway even in the absence of WNT signal. This dysregulation results in the accumulation of β-catenin, which drives cell proliferation and prevents apoptosis. The disruption of WNT signaling is a common driver of tumorigenesis in **colorectal cancer**, where APC mutations contribute strongly to the development of the disease. [Reference](https://pmc.ncbi.nlm.nih.gov/articles/PMC5803335/)
