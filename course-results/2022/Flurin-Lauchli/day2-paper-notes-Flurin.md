# notes on the paper "The Progenetix oncogenomic resource in 2021"
[paper](https://doi.org/10.1093/database/baab043)  

## questions to answer:

### What is CNV/CNA?
* CNV = copy number variations
* CNA = copy number aberrations
terms are used interchangeably to describe aberrant numbers of copies of one gene (one locus) with respect to a reference genome.

### How will you describe or introduce progenetix (scale, data source, cancer types and so on)? 
* Progenetix is a publicly accessible cancer genome data resource [progenetix](progenetix.org) that aims to provide a comprehensive representation of genomic variation profiles in cancer, through providing sample-specific CNA profiles and associated metadata as well as services related to data annotation, meta-analysis and visualization.
* The Progenetix resource provides an extensive collection of oncogenomic data with a focus on individual genome-wide CNA profiles and the use of modern ontologies and data schemas to render curated biological and technical meta- data, as well as thorough references to external repositories and annotation resources.<img width="1172" alt="Screen Shot 2022-09-21 at 15 16 27" src="https://user-images.githubusercontent.com/103630748/191513993-fc2a7a0c-ca24-4638-b4e2-4f8fb2e0280e.png">
> progenetix combines data from different ressources

* includes 138 663 CNV profiles, as well as information on the geographic origin of the sample, the predicted ancestry of the patient, the cancer type and and different classification methods
* comes with an interactive user-interface (online)


### Describe NCIt, ICOD, UBERON codes, and their relationships.
* NCIt (National Cancer Institute Thesaurus):
  - provides information on cancer type classification
  - hierarchical ontology

* ICD-O-3 (Inter- national Classification of Diseases in Oncology):
  - cancer type classification system
  - morphological and topological information of cancer sample used
  - works with tumor samples
  - limited in its representation of hierarchical concepts
  - limited translatability to modern ontologies

* UBERON
  - cross-species anatomical structural ontology system closely aligned with developmental processes
  - relationship structure allows integrative queries linking multiple databases and description logic query within the same organism (linking related organs) and between model animals and humans
  - all existing ICD-O codes were mapped to UBERON terms in progenetix

### What are CNV segmentations and CNV frequencies, and how to use them? 
* CNV segmentations = analysis of CNV data which outputs change-points in gene copy numbers
* CNV frequencies = the frequency of occurrence of a specific CNV at one locus (with respect to a sample population)

### What are APIs and how to use APIs in progenetix?
* API = Beacon application programming interface
  - the "language" a program/person has to use to communicate with progenetix.
  - information on this is given [here](https://docs.progenetix.org/services/)

### How does progenetix visualise CNA profiles?
  - as a genomwide plot of the precentage of samples with copy number gain (yellow, +) and with copy number loss (blue, -)<img width="1056" alt="Screen Shot 2022-09-21 at 15 13 14" src="https://user-images.githubusercontent.com/103630748/191513194-7fe7af06-c530-4024-93e4-10aa4e5b0560.png">


### What do you think should be improved in progenetix?
  - more data (of the same/better quality) would always be helpful


## paper best-of:
[highlights_Flurin_2022-09-21-day-02-paper-reading.txt](https://github.com/FlurinLa/Flurin_BIO392/files/9616915/highlights_Flurin_2022-09-21-day-02-paper-reading.txt)



