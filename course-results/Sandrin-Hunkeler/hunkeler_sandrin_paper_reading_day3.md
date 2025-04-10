## Day III – Progenetix 
#### Sandrin Hunkeler  (MSc. in Informatics)


---

#### 1) What is CNV/CNA?
- CNV stands for *Copy Number Variations*, frequently observed structural genome variations in the form of repeats and deletions
- CNA stands for *Copy Number Aberration*, more severe versions of CNVs which are present in the majority of cancer types
- CNAs affect large genomic regions and have an impact on cancer development

#### 2) How will you describe or introduce progenetix (scale, data source, cancer types and so on)?
- Progenetix is a publicly accessible cancer genome data resource that provides comprehensive insights into genomic variation profiles in cancer
- The database combines various data sources such as GEO, ArrayExpress, TCGA, cBioPortal and hundreds of processed publications
- It holds a rich combination of metadata about the geographical origin and mappings such as the cancer types mapped to NCIt and ICD-O
- The web platform simplifies data visualization and data querying
- Progenetix hosts over 138k CNV profiles from 127k individuals, including 115k tumor samples and 10 million genomic variants
- The dataset covering a wide spectrum of cancer loci including breast, brain, skin, colon, and lymph

#### 3) Describe NCIt, ICOD, UBERON codes, and their relationships. 

NCIt, ICOD and UBERON are schemas which allow classification and describe cancer types and diseases.

- NCIt (National Cancer Institute Thesaurus) is a dynamically developed hierarchical ontology used for cancer type classification which enables layered data aggregation and transfers between resources. Progenetix maps its preserved samples to the NCIt ontology for improved integration and querying.
- ICD-O (International Classification of Diseases in Oncology) is a classification system for diseases. ICD-O Morphology and Topography coding systems allow for high specificity while being limited in its hierarchical structure.
- UBERON is a cross-species anatomical structural ontology. Progenetix maps all ICD-O T codes to UBERON terms.

#### 4) What are CNV segmentations and CNV frequencies, and how to use them?
- CNV segmentation is used to label genomic regions with different copy numbers. Circular Binary Segmentation (CBS) is a statistically based segmentation algorithm which labels regions based on the change in local log2 values compared to the overall mean. CNV segmentation can be used to associate certain CNVs with cancer types.
- CNV frequency is the ratio of samples with a CNA in a specific region. They are used to compare population or datasets to gain information about genetic diversity and population characteristics

#### 5) What are APIs and how to use APIs in Progenetix?
- Application Programming Interfaces (APIs) allow querying services in a standardized format and process
- Progenetix offers state-of-the-art endpoint standards such as Beacon API (GA4GH v2) and Phenopackets-based APIs
- The API endpoints of Progenetix can be used to query data which is pre-processed, filtered and transformed according to the request to allow seamless integration into any client service or research
- The Progenetix APIs reduce the workload for researchers by providing powerful filters such as cancer type, tissue location, cell line, geographical location or morphology

#### 6) How does progenetix visualise CNA profiles?
- Progenetix visualizes the CNA profiles in an interactive *Results* tab. Various links allow to further visualize the results such as by a geographical map
- A histogram shows the percentage of samples affected across all chromosomes. Yellow bars represent copy number gains, while blue bars indicate losses
- The matched subset samples are listed by NCIt/ICD-O codes, the number of subset samples, the number of matched samples, and the relative frequencies of matches in the subset 
- The progenetix data can further be downloaded in CSV or JSON format

#### 7) What do you think should be improved in Progenetix?
- Improve the time it takes to display results
- Improve the intuitive user interface for people with a quantitative but less biology-focused background
- Add a Captcha for queries to protect the database from being used maliciously
- Create a similarity metric to cluster similar CNAs by population or chromosome
