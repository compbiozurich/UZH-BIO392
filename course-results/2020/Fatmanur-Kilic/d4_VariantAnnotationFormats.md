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

## VCF (Variant Call Format)

## VRS (GA4GH Variation Representation Specification)

# Genomic Coordinate Systems

## 0 or 1-based

## interbase
