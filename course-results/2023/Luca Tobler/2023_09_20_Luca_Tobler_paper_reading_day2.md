# Day 2: Paper Reading - Luca Tobler

## What is CNV/CNA?

-   Copy number aberrations **(CNAs)** are alterations in the number of copies of specific DNA segments within a cell's genome. These aberrations can involve either an increase (amplification) or a decrease (deletion) in the number of copies of a particular DNA segment. CNAs are common in the majority of cancers and can have a significant impact on the development and progression of the disease.

-   **(CVN)** stands for Copy number variation and refers to a type of genetic variation that involves differences in the number of copies of specific DNA segments or genes within an individual's genome.

## How will you describe or introduce progenetix (scale, data source, cancer types and so on)?

[Progenetix](progenetix.org) is a publicly accessible cancer genome data resource that aims to provide a comprehensive representation of genomic variation profiles in cancer. It focuses on Copy Number Aberrations (CNAs), which are common in various cancer types and play a significant role in cancer development. Progenetix offers sample-specific CNA profiles and associated metadata, along with services for data annotation, meta-analysis, and visualization.

Originally established in 2001 with a focus on data from chromosomal Comparative Genomic Hybridization (CGH) studies, Progenetix has expanded over the years to include data from hundreds of publications, incorporating information from various genomic profiling experiments, including molecular cytogenetics (CGH, genomic arrays), and sequencing (whole-genome or whole-exome sequencing).

In recent years, Progenetix has grown to encompass additional data sources, including those from The Cancer Genome Atlas (TCGA), cBioPortal, National Center for Biotechnology Information (NCBI)'s Gene Expression Omnibus (GEO), and European Molecular Biology Laboratory-European Bioinformatics Institute (EMBL-EBI)'s ArrayExpress. It also maintains tight integration with projects like the Global Alliance for Genomics and Health (GA4GH) and ELIXIR, contributing to the development of open data standards and expanding its features to serve the cancer genomics community effectively.

## Describe NCIt, ICDO, UBERON codes, and their relationships.

-   **ICDO**, the International Classification of Diseases in Oncology', specifically ICD-O-3 has been used by Progenetix for oncology classification since its establishment. It allows for high specificity in classification thanks to its Morphology and Topography coding systems. It is however limited in hirarchical classification, which is why Protogenix implement a data-driven mapping of ICD-O---NCIt.

-   **CNIt** stands for The National Cancer Institute Thesaurus (NCIt). Relevant to Progenetix is its dynamic, hirarchical method of oncology classification. It is dynamically developed and allows for layered data aggregation and transfer between classification systems and resources.

-   **UBERON** codes: Uberon is an anatomical ontology system that represents anatomical structures across species and aligns with developmental processes. It facilitates cross-species comparisons, integrates with other biological databases, and maps clinical tumor data for research. It's part of the Monarch Initiative, enhancing data interoperability and aiding researchers in various fields.

## What are CNV segmentations and CNV frequencies, and how to use them?
CNV frequencies are the frequency of copy number variations in a given genome region across all samples of a specific cancer type.

CNV segmentations are the segments where there are CNVs. 

## What are APIs and how to use APIs in progenetix?

An **API** (Application Programming Interface) is a set of rules and protocols that allows different software applications to communicate and interact with each other, enabling them to access and exchange data and functionality seamlessly. The development of an API called **Beacon** was undertaken to facilitate seamless integration and interaction between the Progenetix cancer genome data resource and other projects, such as the Global Alliance for Genomics and Health (GA4GH) and ELIXIR. This integration allows for the extension of Progenetix's features, promotes the adoption of open data standards, and enables easier access and utilization of its data by other applications and researchers.

## How does progenetix visualise CNA profiles?
Users can upload custom segment files for visualization of genome wide CNA.

![](https://progenetix.org/services/intervalFrequencies/?datasetIds=progenetix&id=pgx:icdot-C62.9&output=histoplot)
The image shows the frequency of regional aberrations across the whole genome. In orange are copy number gains, in blue losses.

## What do you think should be improved in progenetix?
Going forward, it is crucial that the database is continuosly expanded with more data, as well as storing this data in a way that allows for comparative approaches and querying across different databases. 
