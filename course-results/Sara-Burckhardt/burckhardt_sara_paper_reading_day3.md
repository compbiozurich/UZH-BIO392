# The Progenetix oncogenomic resource in 2021
Huang, Q., Carrio-Cordo, P., Gao, B. et al. The Progenetix oncogenomic resource in 2021. Database (2021) Vol. 2021: article ID baab043; DOI: [https://doi.org/10.1093/database/baab043](https://academic.oup.com/database/article/doi/10.1093/database/baab043/6323245)

## What is CNV/CNA?
Copy number variation (CNV) and copy number aberrations (CNA) are structural genome variations due to deletions, duplications or insertions. In cancer they are ubiquitous and frequently extensive and can have a functional impact on the cancer development. 

## How will you describe or introduce progenetix?
A freely accessible data resource where the idea is to bring all the available data together and process them such as that one can easily compare them (identify & characterize molecular subtypes, meta-analysis of large genomic variant collections, …). Progenetix focuses on individual cancer CNA profiles and associates phenotypic information and additional metadata dedicated to cancer studies in all different cancer biologies. They also provide services related to data annotation, meta-analysis and visualization. 
The data is from individual studies and datasets that report genome profiling experiments based on molecular cytogenetics and sequencing. Progenetix includes over 138’000 CNV profiles with 788 distinct NCIt terms (2021). 

## Describe NCIt, ICOD, UBERON codes, and their relationships.
* NCIt is the *National Cancer Institute Thesaurus* which categorizes distinct cancer types in a dynamically developed hierarchical ontology. 
* The *International Classification of Diseases in Oncology* (ICD-O) classifies cancer sample in an organ- and tissue-specific mapping based on traditional clinical and diagnostic aspects. It is limited in hierarchical representation. 
* *UBERON* is a cross-species anatomical structural ontology system closely aligned with developmental processes. Here one can make logic query within and between organisms (eg. model animals and humans).

All three are classification systems and have their advantages and disadvantages. Progenetix mapped them together so that the samples contain the three codes, making it able to look at them in the different classifications. 

## What are CNV segmentations and CNV frequencies, and how to use them?
* CNV segmentations are regions of the genome with consistent CNVs in an individual. They can be used for structural analysis of individuals. 
* CNV frequencies are percentages of genomic regions with CNVs across samples they are used to compare and identify trends between multiple individuals, populations, etc. 

## What are APIs and how to use APIs in progenetix?
APIs are application programming interfaces that provide support for a number of data services that make use of special resources in Progenetix or alternative forms of data delivery. In Progenetix the Beacon API is used. [Beacon](https://docs.genomebeacons.org/) is a protocol and specification that facilitates the discovery of genomic variants and biomedical data from different organisational and geographic locations. 


## How does progenetix visualise CNA profiles?
Progenetix visualises CNA profiles in  CNV Histograms where on the x-axis the different chromosomes are displayed and on the y-axis the percentage of loss and gain. The distribution per region is then visualized in blue for loss and in yellow for gain. 

## What do you think should be improved in progenetix?
The starting interface is not very welcoming and intuitive designed and it is not clear which links on the left side of the page are subgroups of another as one sees after clicking on one (there then the design changes). 
