# Paper Reading: Progenetix
## What is CNV/CNA?
- **copy number aberrations (CNAs)**: 
Structural genome aberrations which are present in the majority of cancer types and have a functional impact in cancer   development. So CNAs typically refer to copy number changes (deletion or insertions of large genomic regions) that are considered abnormal or aberrant and are often associated with cancer.
- **copy number variation (CNV)**:
CNVs refer to structural variations in the DNA of an organism where a segment of the genome has been duplicated (gained) or deleted (lost) compared to a reference genome with normal genomic content.

## How will you describe or introduce progenetix (scale, datasource, cancer types and so on)
Progenetix is a open accessible cancer genome data resource, that has the goal to provide a representation of genomic variation in cancer. The data is produced by a variety oncogenomic studies which are based on different molecular cytogenetics and squencing based technologies. Leading to a cancer genome CNA data including more than 138663 profiles including 115357 tumor copy number varaition profiles. The Progenetix database specializes in cataloging CNVs. Users can search for specific genes, genomic regions, or cancer types to access relevant data and studies within the Progenetix database.Furthermore, it offers tools for visualizing and analyzing the CNV data. For example it is possible to visualize cancer samples (of a distinct cancer type) and their chromosomal regions with their copy number gains (yellow) and copy number deletions (blue). 




- Our current model treats the most prevalent copy number as the baseline and derives the rel- ative copy number gain and loss per sample based on the assumption that the relative gene dosage imbalance exerts pathophysiological effects in cancer biology.
- cancer samples in Progenetix have been annotated with an ACIt code --0->788 ductubct NCIt terms => with reference to the NcIt coding system
- visualisation options, chromosomal regions, CNA by the precentage of samples with + yellow and - as CN loss
- resource provides an extensive collection of oncogenomic data with a focus on individual genome wide SNA profiles
## Describe NCIt, ICOD, UBERON codes, and thier relationships.
- **National Cancer Institute Thesaurus (NCIt)** = cancer types classification?
  is a dynamically developed hierarchical ontology => empowers layered daa aggregation and transfer between classification systems and reosurces
  
- **International Classification of Diseases in Oncology (ICD-O)** => the current ICDO is limited in its representation of hierarchical concepts and does not easily translate to modern ontologies
  ICD-O topography system provides organ- and substructure-specific mappint rooted in traditional clinical and diagnostic aspects of a tumor entitiy

- **UBERON** is a cross-species anatomical structural ontology system closely aligned with developmental processes, its relationship structure allows integrative queries linking multiple databases and between model animals and humans




## What are CNV segmentations and CNV frequencies, and how to use them?

## What are APIs and how to use APIs in progenetix?
- Beacon application programming interface (API)

## What do you thinkg should be improved in progenetix?
- user interface
- technically the query interface for retrieval of sample specific data is built on top of a forwardlooking implementation of the GA4 Beacon API with features from the upcomin version 2 of this standard
- info.progenetix.org



What is GRCh38

