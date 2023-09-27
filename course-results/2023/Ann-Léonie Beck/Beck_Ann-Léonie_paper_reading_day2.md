## Question 1: What is CNV/CNA?

CNA: copy number aberrations
  they represent a type of nearly ubiquitous and frequently extensive structural genome variations ( rewrite )!
CNV : copy number variation

## Question 2: How will you describe or introduce progenetix (scale, data source, cancer types and so on)

progenetix is publicly accessible

the progenetix project organizes and presents individual cancer CNA profiles, as well as metadata from oncogenomic studies and data repositories.
the goal is to make inegrative analyses spanning all diffrent cancer biologies possible and to provide a comprehensive representation of genomic variation profiles in cancer

### scale: 
No. of studies from various data resources (eg. GEO, ArrayExpress, cBioPortal, TCGA)  1939

No. of samples from various data resources (eg. GEO, ArrayExpress, cBioPortal, TCGA)  138663
Tumor                                                                                 115357
Normal                                                                                23306

Classifications from various data sources (eg. GEO, ArrayExpress, cBioPortal, TCGA)  
ICD-O (Topography)                                                                    209
ICD-O (Morphology)                                                                    491
NCIt                                                                                  788
Collections from various data sources (eg. GEO, ArrayExpress, cBioPortal, TCGA)
Individuals                                                                          127549
Biosamples                                                                           138663
Callsets (se of variants from one genotyping experiment)                             138930
Variants                                                                             10716093


### data source: 
chromosomal comparative genomic hybridization (CGH), hunderds of publications reporting on genompe profiling experiments based on molecular cytogenetics (CGH, genomic arrarys) and sequencing (WGS or WES), complete incororation of arrayMap data collection, datasets from external resources and projects (eg. The Cancer Genome Atlas TCGA, cBioPortal) and recurrent collection and re-processing of array-based data from National Center for Biotechnology Information (NCBI)'s Gene Expression Omnibus (GEO) or European Molecular Biology Laboratory-European Bioinformatics Institute  (EMBL-EBI)'s ArrayExpress.

Integration with projects of the Global alliance for Genomics and Health (GA4GH) and ELIXIR

### cancer loci:
Hematopoietic and reticuloen- dothelial systems, Lymph nodes, Breast, Cerebellum,  Brain, NOS,Cerebrum, Liver, Stomach, Skin, Connective, subcutaneous and other soft tissues, Kidney, Colon, Ovary, Prostate gland, Lung and bronchus, Nervous system, NOS,Urinary bladder, Cervix uteri, Peripheral nerves incl.autonomous, Esophagus, Pancreas, Thyroid gland, Heart, mediastinum and pleura Bones, joints and articular cartilage, Spleen and others


## Question 3: Describe NCIt, ICOD, UBERON codes, and their relationships

NCIt : National Cancer Institute Thesaurus : dynamically developed hierarchical ontology, allows layered data aggregation and transfer between classification systems and resources, rarely used
ICOD: International Classification of Dieseases in Oncology: high specifity, organ and substructre- specific mapping
ICD-O--NCIt: data-driven generation of mappings, derieved NCIt codes were added to all samples. So that the hierarchical strucutre for data retrieval, analysis and exchange can be used. 
UBERON : cross species anatomical structural ontology system closely aligned with developmental processe
Existing ICD-O T codes were maped to UBERON terms. allows linking of related organs in the same organism or linking between model animals and humans

## Question 4: What are CNV segmentations and CNV frequencies, and how to use them?

CNV frequencies: the frequency at which a copy number variation occurs in a given genomic region or gene across a set of samples or indiciduals. the frequency indicates how often a particular CNV is observed in a population or dataset. it indicates how "common" a specific copy number change is (eg. in a population or in different cancer types) -> how significant is a specific CNV in a  disease. 

CNV segmentation: divides a genome into segments or regions based on the CNV observed in that genome. regions of a genome where copy number changes have occured can be identified by CNV segmentations.

CNV fraction: the fraction of genome with a copy number alteration

## Question 5: What are APIs and how to use APIs in progenetix
Application Programming Interfaces allows different software applications to communicate with each other. The API grants access to a database. In progenetix Beacon is used as the API. progenetix provides a query interface, which makes access to the API easier. 
The query interface is built on top of the API. Query types can for example be by city, id, geolatitude, geolongitude or geodistance

## Question 6 : How does progenetix visualise CNA profiles?

- summary with number of matched samples, variants, calls, frequency of alleles containing the CNA
- document of biosamples
- link to University of California Santa Cruz browser: overview of genomic elements
- customized visualization:
  - Result tab: genome-wide CNA by the percentage of samples, table containing subsets with ICD-o-3 or NCIt Ontology terms sorted by frequency of matched samples within subset
  - Biosamples tab: information of matched biosamples
  - Biosamples map tab: world map with matched geological locations
  - Variants tab: variant digest, biosample and callset

## Question 7: What do you think shloud be imporved in progenetix
points listed in the paper:
- cell line data access tool
- enhancing clincial and diagnostic annotation
- expanding cross-database refrences and the types of genomic variant data
- active data sharing
- integration through networked services and platforms




