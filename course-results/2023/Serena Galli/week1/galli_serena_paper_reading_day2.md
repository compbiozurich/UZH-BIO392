# Day2: Paper reading

## What is CNV/CNA?

Copy number aberration (CNA) represents a type of structural genome variations, involving DNA segments of length at least 1kb that vary in copy number among individuals in a population. CNAs can involve both gains (amplification) or losses (deletion) of genetic material.
The terms Copy number variation (CNV) and CNA are either used interchangeably or CNV is used to refer to germline events, whereas CNA refers to somatic events. 


## How will you describe or introduce progenetix (scale, data source, cancer types, etc.)?

Progenetix is an publically available resources that incorporates data from thousands of individual publications, which relied on different methods to analyse genomic variations such as molecular cytogenetic-based and sequencing-based technologies. The data was either included from existing resources such as Gene Expression Omnibus (GEO), ArrayExpress etc or was derived directly from publications. The database includes samples of many different cancer types/locations, collected in different geographic regions and provening from different ancestry groups. 


## Describe NClt, ICOD, UBERON codes and their relationships. 

These are different cancer classification systems: 
* The National Cancer Institute Thesaurus (NCIt) classification is based on a hierarchical ontology. 
* The ICD-O is a dual classification with coding systems for both topography (ICD-O T codes) and morphology (ICD-O M codes), rooted in traditional clinical and diagnostic aspects of a  tumor entity but with only limited relation to tumour biology. 
* UBERON is a cross-species anatomical structural ontology system closely aligned with developmental processes. 

Progenetix provides a mapping from all existing ICD-O T codes to 'UBERON' terms and also generated ICD-O - NCIt mappings in a data-driven way. 

## What are CNV segmentations and CNV frequencies, and how to use them?

CNV segmentation refers to the process of identifying and delineating copy number variation (CNV) regions in a genome. CNV identification requires partitioning of the genome into complex segments (CNV segmentations). CNV segments are identified by merging the regions with similar read-count values. 

The CNV frequency corresponds to the fraction of samples with a CNV in a given genomic region (e.g. chromosome arm, gene) of all the samples examined. 

Besides benign CNVs, some CNVs are responsible for the etiology of numerous human diseases and studying the effect of CNV on phenotype can reveal valuable information about the biology of a given disease. The CNV profile can also be used for disease classification. 


## What are APIs and how to use APIs in progenetix?

An API, or Application Programming Interface, is a set of rules and protocols that allows different software applications to communicate and interact with each other. APIs enable different software systems to exchange data and functionality seamlessly. 

Progenetix provides data through the Beacon API. The Beacon API is a standard API developed by the Global Alliance for Genomics and Health (GA4GH) that allows querying and retrieving genetic variant data from different genomic databases. Progenetix has implemented the Beacon API to provide access to its cancer genome data. More specifically, the query interface for retrieval of sample specific data is built on top of a forward-looking implementation of the GA4GH Beacon API with features from the upcoming version 2 of this standard.

## How does progenetix visualise CNA profiles?

Progenetix uses CNV histograms to visualize CNV frequencies/CNV profiles.  

## What do you think should be improved in progenetix?
Progenetix could benefit from integrating data from other sources to provide a even more comprehensive and diverse dataset.
