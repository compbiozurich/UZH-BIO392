# Variant Annotation Formats
Here is a briefly summary of genomic variant formats and their use cases.

## ISCN (International System for Human Cytogenomic Nomenclature) [1](https://en.wikipedia.org/wiki/International_System_for_Human_Cytogenetic_Nomenclature) [2](http://varnomen.hgvs.org/bg-material/consultation/ISCN/) [3](http://www.slh.wisc.edu/clinical/cytogenetics/basics/)
- international standard for human chromosome nomenclature
- covers the description of numerical and structural chromosomal changes detected using microscopic and cytogenetic techniques
- includes band names, symbols and abbreviated terms used in the description of human chromosome and chromosome abnormalities
- example symbols:
  - *del* Deletion
  - *dic* Dicentric chromosome
  - *inv* Inversion
  - *t* Translocation
 - example usage:
    - *46,XX,t(1;2)(p32;q22)*: 46 chromosomes, female (XX sex chromosomes), with a balanced translocation between chromosomes 1 and 2 with breakpoints in the short arm of chromosome 1 at band 1p32 and the long arm of chromosome 2 at band 2q22.

## HGVS (Human Genome Variation Society) [4](https://varnomen.hgvs.org/#:~:text=HGVS%2Dnomenclature%20is%20used%20to,serves%20as%20an%20international%20standard.&text=HGVS%2Dnomenclature%20is%20authorised%20by,HUman%20Genome%20Organization%20(HUGO).) [5](http://varnomen.hgvs.org/recommendations/general/)
- HGVS-nomenclature is used to report and exchange information regarding variants found in DNA, RNA and protein sequences and serves as an international standard
- all variants should be described at the most basic level, the DNA level. Descriptions at the RNA and/or protein level may be given in addition
  - example variants: 
    - *>* substitution (c.4375C>T: the C nucleotide at position c.4375 changed to a T)
    - *del* deletion (c.4375_4379del: the nucleotides from position c.4375 to c.4379 (CGATT) are missing (deleted))
- all variants should be described in relation to an accepted reference sequence
  - a letter prefix is mandatory to indicate the type of reference sequence used.
  - example prefixes:
    - *c.* for a coding DNA reference sequence
    - *g.* for a linear genomic reference sequence
    - *m.* for a mitochondrial DNA reference sequence

## VCF (Variant Call Format) [5](https://samtools.github.io/hts-specs/VCFv4.2.pdf) [6](https://compbiozurich.org/UZH-BIO392/course-material/2020/2020-09-18-BIO392-files.pdf) [7](https://en.wikipedia.org/wiki/Variant_Call_Format#:~:text=The%20Variant%20Call%20Format%20(VCF,as%20the%201000%20Genomes%20Project.))
- tab-delimited text format
- stores the results of a single or multiple interpretations of genome sequencing datasets, in comparison to a reference genome (stores only variants)
- contains meta-information lines, a header line, and then data lines each containing information about a position in the genome
- allows extra information to be added to the info field
- standard format for file-based storage of human genome variants

| 1     | 2    | 3     | 4   | 5    | 6     | 7     | 8     | 9    | 10  | 11   |
|-------|:----:|:-----:|:---:|:----:|:-----:|:-----:|:-----:|:----:|:---:|-----:|
| CHROM | POS | ID | POS | REF | ALT | QUAL | FILTER | INFO | FORMAT | SAMPLEs |
The name of the sequence (typically a chromosome) on which the variation is being called. This sequence is usually known as 'the reference sequence', i.e. the sequence against which the given sample varies.| bitwise FLAG | References sequence NAME | 1- based leftmost mapping POSition | MAPping Quality | CIGAR String | References name of the mate/ next read | Position of the mate/ next read | observed Template LENgth | segment SEQuence | ASCII of Phred-scaled base QUALity+33


## VRS (GA4GH Variation Representation Specification)

# Genomic Coordinate Systems

## 0 or 1-based

## interbase
