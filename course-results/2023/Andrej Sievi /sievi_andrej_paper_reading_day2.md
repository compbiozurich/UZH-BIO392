## Question 1: What is CNV and CNA?

### Copy number aberrations (CNAs):
Dosage imbalance get detected in diffrent regions in the Genome. The somatic mutations often leads to cancer.
These Alteration are monitored to recognize the origin of the cancer.


### copy number variation (CNV):
Sequences of genome are repeated but the number of repeats are diffrent between the individuals.
It has a great application in the diagnostics in metabolism and susceptibility to infectious diseases and more.
It is mostly measured in duplications and deletions. 


## Question 2: How will you describe or introduce progenetix (scale, data source, cancer types and so on)?

Progenetix is a data storage platform which is accessible for everyone. The Goal is to provide genomic variation profiles in cancer.
The storage is filled from several studies and with diffrent approaches to detect the source of cancer.
The most common approaches are: 
  - The Cancer Genome Atlas (TCGA)
  - cBioPortal
  - array-based data from National Center for Biotechnology Information (NCBI)’s Gene Expression Omnibus (GEO)
  - European Molecular Biology Laboratory-European Bioinformatics Institute (EMBL-EBI)’s ArrayExpress 

On this application the focus lies on the detection of CNA/CNV for all types of human malignancies.
It stores diffrent types of Cancer sorted in bodylocalisation, geographical occurence or genlocation and much more.


## Question 3: Describe NCIt, ICOD, UBERON codes, and their relationships

### National Cancer Institute Thesaurus (NCIt)
NCIt tracks the development ontology. Mutation from diffrent sides can lead to the same cancer. With this approach you can monitor the steps and their origin and diffrent classification.

### ICD-O: International Classification of Diseases for Oncology
Provides organ- and substructure specific mapping and diagnostic aspects of tumor entity

### Uberon: 
is a cross-species anatomical structural ontology system closely aligned with developmental processes.
Classified in anatomical manner such as structure, function and developmental lineage



## Question 4: What are CNV Segementations and CNV frequencies, and how to use them?
CNV are divided into two classes: 
 1. Seqmentation: Chromosomes-arm (p: short-arm, q: long-arm)
 2. Frequencies: Small aberration in the genome like duplication (gain) or depletion (loss).


Depending on the type of cancer, other mechanisms are bypassed or switched off. 
Oncogen is like the gas pedal that is always down and promotes cell proliferation and
interfere with the Genregulation. Tumorsuppressor gen are like the break which is defect.
So it does not react in case the Cell division is abnormal. 


## Question 5: What are APIs and how to use APIs in progenetix?
### API: Application programming interface
It is a tool that allow two or more programms to communicate with each other. It is easier for the user to handle 
big Data. With the API you can generate desired output by selecting paramteres as follwing. 
  - mapping of the region the mutation occurs (geohraphically)
  - tissue location
  - cancer type
  - chromosomal location
  - cell line
  - customized visualisation


## Question 6: How does progenetix visualise CNA profiles?
In the progenetix all chromosom are listed from 1 to 22 and XY. 
In the Header the NCIT number for a specific Disease is written. (e.x.: Serous Neoplasm(NCIT:C7074))
For a given Disease a given samples where testet.
On the plot the duplication are colored in Orange and the deletion in Blue. For all the testet samples
you now can say how many samples have a change at a certain locus. 


<img width="1061" alt="image" src="https://github.com/compbiozurich/UZH-BIO392/assets/145455261/e38149f2-77d0-490b-9223-e2fd1d2c52bb">


## Question 7: What do you think should be improved in progenetix?

Collecting more Data. And assemble it under the same server. 
More specific and detailed filter function.
