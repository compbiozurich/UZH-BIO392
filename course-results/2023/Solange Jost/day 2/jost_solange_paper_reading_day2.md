# The Progenetix oncogenomic resource in 2021
## Questions regarding the paper

### 1: What is CNV/CNA?

* CNV = "copy number variants" and refers to changes in the number of gene copies in an individual genome.
* CNA = "copy number aberrations" and refers to deletions or amplifications of large continuous genome segments.

### 2: How will you describe or introduce progenetix (scale, data source, cancer types and so on)?

[Progenetix](progenetix.org) is the largest publicly accessible cancer genome database with individual sample data. It brings together data from various sources, including publications and various datasets that only existed seperately before. The focus lies on copy number abnormalities (CNVs/CNAs). In 2021, it included data from 138'663 samples and 259 different (CNIt) cancer types.
The main data sources are the "ArrayExpress Archive of Functional Genomics Data", the "cBioPortal for Cancer Genomics", "The Cancer Genome Atlas Program" (TCGA), the "arrayMap data collection" and the "Gene Expression Omnibus".

Additionally, Progenetix curates associated phenotypic information as well as sample metadata such as geographic origin and ancestry group information. For each sample, the same data formats and processing are used. The website offers a nice interactive user interface and visualization options.

### 3: Describe NCIt, ICDO, UBERON codes, and their relationships.

"ICD-O" stands for "International Classification of Diseases in Oncology", "NCIt" for "National Cancer Institute Thesaurus. Both are used for cancer sample classification. ICD-O uses the classical approach of classification based on organs and substructures. NDIt makes use of a hierarchical structure and translates better to modern ontologies. In Progenetix, all cancer samples have been annotated with an NCIt code. The genomes are grouped in 51 prominent nodes.

"UBERON", another ontology system, incorporates developmental processes to link related organs within an organism or to link data of different organisms with each other.


### 4: What are CNV segmentations and CNV frequencies, and how to use them?

* CNV segmentation = analysis of CNV data which outputs change-points in gene copy numbers
* CNV frequency = the frequency of occurrence of a CNV at a specific locus

### 5: What are APIs and how to use APIs in progenetix?

"API" stands for "application programming interface". It refers to the way of communication between computer programs. It can be described as the "language" one has to use to communicate with progenetix.
Details can be found on this [page](https://docs.progenetix.org/services/).

### 6: How does progenetix visualise CNA profiles?

CNA profiles are visualized as genomwide plot displaying the percentage of samples with copy number gain in yellow and samples with copy number loss in blue. It will include all samples fitting your specific search.
<img width="1052" alt="image" src="https://github.com/compbiozurich/UZH-BIO392/assets/145435381/50a678d8-d578-4b93-911e-43c60b5ec400">


### 7: What do you think should be improved in progenetix?

Like it is mentioned in the paper, I think that an expansion of references and annotation will open the door to even more possibilities. And, of course, the bigger the database, the better. So, the further collection of more and high-quality databases should still be a main priority.


