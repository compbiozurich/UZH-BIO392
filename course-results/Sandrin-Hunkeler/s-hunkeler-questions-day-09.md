# Day 9 - Understanding of Sequence Analysis
#### Sandrin Hunkeler (MSc. in Informatics)

---

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
- CHROM: Describes the chromosome of the reference genome on which the variant is located.
- POS: Indicates the position on the chromosome where the variant is located.
- REF: Denotes the nucleotide which is present on the reference CRHOM at the POS. If at POS is no alternative it is denoted as ‘.’.
- ALT: If there is an alternate allele, it is noted here as the sequence of nucleotides which are present at the position POS instead of the REF. If there is no alternate allele for the sample, it is denoted with a ‘.’.


### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
- If the ALT column does not contain a "." it indicates that this POS differs from the REF and the sample has a variant.
- To verify, we can compare if the ALT column contains a nucleotide which is different from the REF column.


### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**


#### Alignment Tracks (Patient Reads)
- Each patient has its own track showing aligned sequencing reads.
- Clicking on a read reveals metadata such as:
  - Read name
  - Alignment start
  - Mapping quality
- It was loaded from the BAM files.

#### Gene Annotation Track
- Displays genes within the current chromosome region.
- Shows metadata such as gene name, location, and source.
- Helps determine where variants occur in relation to known genes.
- It was loaded from the GTF file.

#### Transcript Track
- Represents the reference transcripts for the genes.
- Holds additional information about exon-intron structure and strand orientation.
- It helps for understanding how a variant or region affects RNA and protein products.

#### Variant Track
- Contains variants for each patient in relation to the reference genome.
- Displays variant position in the genome, reference and alternative alleles, and related annotations.
- Useful for identifying and comparing variant presence across the different patients.

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**

#### Variant 1) POS:112809198 REF:a	ALT:aa
- This variant is located in intron regions of the APC gene.
- It mainly results in intron_variant, NMD_transcript_variant, and non_coding_transcript_variant
- It has not referenced any exons or other variants
- It is likely to have a low impact on protein function, as it does not affect coding sequences.

#### Variant 2) POS:112839979 REF:a	ALT:agagagaga
- This variant occurs also in the APC gene.
- It is annotated as frameshift_variant in multiple protein-coding transcripts but also as intron_variant in some others.
- Multiple overlaps with other variants are listed.
- The frequent specification as frameshift variant indicates that it is likely to have a high impact on the protein.

### Q5
**What phenotype or disease do you expect this variant to be involved with?**

- Multiple variants reference [intestine tumors](https://www.ensembl.org/Homo_sapiens/Variation/Phenotype?db=core;r=5:112839480-112840479;source=COSMIC;tl=EAYsiwikdEPmQHio-11001089;v=COSV57362825;vdb=variation;vf=1186386420)
- The APC gene itself is listed as a [tumor supressor gene](https://flexikon.doccheck.com/de/APC-Gen)
- I therefore assume frameshift mutations have a high impact on the function on the resulting protein and increase the risk for various cancers.
