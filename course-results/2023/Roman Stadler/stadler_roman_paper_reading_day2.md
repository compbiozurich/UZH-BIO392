# The Progenetix Oncogenomic Resource 

![](https://progenetix.org/img/progenetix-logo-black.png)

1.  What is CNV/CNA?
    - CNV stands for copy number variants
      - It describes whether there are any changes in the number of copies of certain genes in the genome of an individual
    - CNA stands for copy number abberations
      - A person has more or fewer copies of a gene in their genome
      - This can happen if copies are gained (amplification) or lost (deletion)

2.  How will you describe or introduce progenetix (scale, data source, cancer types and so on)?
    - [Progenetix](https://progenetix.org/)  is a publicly accessible cancer genome data resource
    - It provides an overview of mutation data in cancer, with a focus on copy number abnormalities (CNV/CNA), for all types of human malignancies
    - The data is based on individual sample data from currently 145265 samples
    - The progenetix resource contains data of 834 different cancer types (NCIt neoplasm classification), mapped to a variety of biological and technical categories
    - A possible use of the database can be the search for local copy number aberrations, involving for example a gene, and the exploration of cancer types with these CNVs
    - It provides a page to allow users to visualize their own CNV data
      - using the standard Progenetix plotting options for histograms and samples

3.  Describe NCIt, ICOD, UBERON codes, and their relationships
    - NCIt: National Cancer Institute Thesaurus
      - NCIt was developed more dynamical and therefore layering data aggregations and transferring to other systems and resources is possible
    - ICD-O: International Classification of Diseases in Oncology 
      - Is limited to hierarchical concepts and is hard to apply to modern ontologies
      - The combination of the ICD-O Morphology and Topography coding systems depicts diagnostic entities with high specificity
    - "ICD-O—NCIt" mappings allow us to take advantage of NCIt’s hierarchical structure for data retrieval, analysis and exchange
    - UBERON allows cross-species anatomical structural ontology
    - All existing ICD-O T codes have been mapped to UBERON terms

4. What are CNV segmentations and CNV frequencies, and how to use them?
    - The CNV segements represent the part of the genome which shows variation in number 
    - The frequency is used to describe how many of those CNV segements are found in one genome of e.g a tumor
    - The user can perform a query with start and end position range with filter options for cancer type, tissue location, morphology, cell line or geo- graphic location
    
![](https://progenetix.org/img/9p-example-histogram.png)
    
    
5. What are APIs and how to use APIs in progenetix?
    - [Application Programming Interfaces](https://en.wikipedia.org/wiki/API) are rules, how applications can communicate with eachother
    - In Progenetix, Beacon is the API used to connect to wanted information in datasets

6. How does progenetix visualise CNA profiles?
    - The visualization can be customized via visualization options
      - For example, one could watch out for selected chromosomal regions or group the data by studies and subset
    - As an alternative, users can upload their own data for single or even multiple samples to visualize genome-wide CNA
    - We can observe the genome-wide CNA by the percentage of samples, CN gain and loss

7. What do you think should be improved in progenetix?
    - Collect more research data 
    - Connect data from all over the world




