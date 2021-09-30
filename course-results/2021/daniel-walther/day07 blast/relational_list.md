_daniel walther_
_(using the copied template provided by the teacher)_

_tools:_
* [ClinVar Homepage](https://www.ncbi.nlm.nih.gov/clinvar/)
  * [Variation Viewer](https://www.ncbi.nlm.nih.gov/variation/view), a genome browser for variation information. Blue and red bars inicate duplications and deletions (red probably indicating deletions). Can zoom and do all sorts of cool interactive things. Top left: search bar; top of genome browser: current genome section.
  * [How to search ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/docs/help/), a list of links to tutorials, not only video like in the course.
* [ClinGen Homepage](https://clinicalgenome.org/)
* [nomenclature of variants](https://varnomen.hgvs.org/bg-material/simple/), presumably there are different 'Gewohnheiten'

# day07 afternoon task (ClinVar, ClinGen)

The __purpose__ of this exercise is to get familiar with __genome variant resources__ and the __workflow__ in finding and researching relations between genetically caused diseases and gene variants information.

## Variants and diseases

just choose one of the results, there could be many different solutions since many mutations can cause the same or similar symptoms, but these exercises are about getting to know the platforms and not research cause-effact relationships or so.

### [Relational list using ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/)

> ClinVar: A database of genomic variants and the interpretation of their relevance to disease. (slides)

|Disease|Gene|Variants|
|-------|----|--------|
|Hemochromatosis|HJV|NM_213653.3:c.959G>T|
|Thalassemia|HBB, HBA (mostly HBB (Hemoglobin beta subunit))||
|Haemophilia|VWF|NM_000552.4(VWF):c.3922C>T|
|Cystic Fibrosis|NPHP4|NM_015102.5(NPHP4):c.2940_2944dup|
|Tay sachs disease|HEXA|NM_000520.6(HEXA):c.409C>T|
|Fragile X syndrome|FMR1, FMRP|rs193922936|
|Huntington's disease|PRNP|NM_000311.5(PRNP):c.532G>A|


### [Relational list using ClinGen](https://clinicalgenome.org/)

> ClinGen: an authoritative central resource that defines the clinical relevance of genes and variants for use in precision medicine and research. (slides)

|Gene|Gene name|Chromosomal location|Gene product|Disease|
|----|---------|--------------------|------------|-------|
|CFTR|CF transmembrane conductance regulator|7q31.2|epithelial ion channel, transport of chloride ions across the cell membrane|Cystic fibrosis|
|CYBB|||||
|HJV|||||
|CDKN2A|||||
|KRAS|||||
|TP53|||||
|FMR1|FMRP translational regulator 1, or |GRCh38.p13: Xq27.3 (assembly: location)|The encoded protein binds RNA and is associated with polysomes. may be involved in mRNA trafficking from the nucleus to the cytoplasm. A trinucleotide repeat (CGG) in the 5' UTR is normally found at 6-53 copies, but an expansion to 55-230 repeats is the cause of fragile X syndrome (this could help in finding the variant call name => rs193922936). (Expansion of the trinucleotide repeat may also cause one form of premature ovarian failure (POF1).)|Fragile X syndrome|

I go the exercise. No need for redundancy. Shortly: use _Variation Viewer_ of ClinVar to find the _Variation ID_, which can often be used in the NCLM's SNPsummary and PubMed sites.

### Combining the two tables

Combining the two tables would be an obviousl next step, but the apparent exercise purpose is fullfilled at this point.
