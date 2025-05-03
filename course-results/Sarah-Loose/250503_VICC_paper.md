# [Exploring Genome Resources/ VICC](https://doi.org/10.1038/s41588-020-0603-8)


<img width="1301" alt="grafik" src="https://github.com/user-attachments/assets/091207f0-9bb9-41e8-88cb-41a2d06ff984" /> [^1]

Compared to primary databases which only contain simple genomic data, interpreted databases contain informations like clinically relevant annotations and are often curated.



## VICC (The Variant Interpretation for Cancer Consortium)
-  Project of GA4GH, established to co-develop standards for genomic data sharing across knowldge bases
- Example: AMP/ASCO/CAP have have published structured somatic variant clinical interpretation guidelines that do not cover oncogenicity, like the ACMG)/AMP guidelines for germline variants.
- Goal: develop a dynamic, open-resource meta-knowledge base with accessible interface, not for clinical annotation but for faster gathering of knowledge

## Issue:
### Different nomenclatures:
- Human Gene Nomenclature Committee (HGNC) gene symbols
- Human Genome Variation Society (HGVS) variant nomenclature
- externally referenced (identified elements of an established ontology or database) or knowledgebase-specific (shorthand, internal identifier) representations
Therefore things like disease shorthands could vary.

## Solution:
- standardizing all variant interpretations across databases (describing genes, variants, diseases and drugs)
- genes were harmonized using the HGNC gene symbols
- Variants were harmonized through a combination of knowledgebase-specific rules from COSMIC and ClinGen Allel Registry
- Diseases were harmonized using the European Bioinformatics Institute (EBI) Ontology Lookup Service to get Disease Ontology and identifiers


## VICC resources seleceted based on similar somatic disease focus:

Cancer Genome Interpreter Cancer Biomarkers Database (CGI)
Clinical Interpretation of Variants in Cancer (CIViC)
Jackson Laboratory Clinical Knowledgebase (JAX-CKB)
MolecularMatch (MMatch),
OncoKB
Precision Medicine Knowledgebase (PMKB)

Information from these six oncology-focused interpreted databases were pooled together and unified.
Gathers more knowledge for previously underresearched variants, and potentially eradicates some biases. 
Furthermore, standartized data formats allow for easier workflows between applications and e.g. APIs.

## Outlook:
Harmonized metaknowledge base facilitates precision medicine


[^1]: Wagner, A.H., Walsh, B., Mayfield, G. et al. A harmonized meta-knowledgebase of clinical interpretations of somatic genomic variants in cancer. Nat Genet 52, 448–457 (2020). https://doi.org/10.1038/s41588-020-0603-8


