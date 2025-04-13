## What is CNV/CNA? 
*Copy Number Variations/Copy Number aberrations*: specific sequence repeats in the genome that vary between individuals. It is a form of structural variation and can be important in cancer development and progression. Sections of DNA can be duplicated or deleted. 
## How will you describe or introduce Progenetix (scale, data source, cancer types and so on)?
*Progenetix* is a derived database that focuses on CNVs and provides mutation data related to cancer. The individual sample data is curated from different sources, with the majority coming from genomic arrays from SNP platforms, as well as from CGH experiments and whole genome/exome sequencing (WGS/WES) studies. As of now, the database includes **156,871 samples** across **906 distinct cancer types**. This open resource offers key features such as local CNV aberrations, as 
well as CNV cancer profiles and annotated references to research articles about cancer genome screening experiments.
## Describe NCIt, ICDO, UBERON codes, and their relationships.
*ICD-O:International Classification of Diseases in Oncology* is classification system combining morphology and tooplogy. While it captures diagnostic entities in great detail, it lacks a hierarchical organization.\
*NCIt: National Cancer Institute thesaurus* is a hierarchical ontology, which provides a structured, hierarchical classification of cancer types, giving cancer samples an NCIt code and creating an "NCIt hierarchy tree". In Progenetix (as of 2021), ICD-O--NCIt mappings were generated to add the NCIt codes to all the samples, combine the two systems together. \
*UBERON: Uber-anatomy ontology* "is a cross-species anatomical structural ontology system". This can standardize anatomical terms across humans and model organisms, by linking multiple databases (Gene Ontology, Protein Ontology etc). Progenetix (as of 2021) mapped all ICD-O topography codes to the UBERON terms.

## What are CNV segmentations and CNV frequencies and how to use them?
- CNV segmentations represent regions of the genome that are consistently altered in copy number within individul samples. CNV segmentations are great to analyse CNV data on the sample level, to see what genes are altered.
- CNV frequencies give the count of how often specific genomic regions are altered across many samples. CNV frequencies are valuable for identifying cancer types or subtypes and for detecting CNV alterations that are frequently observed in cancer.
## What are APIs and how to use APIs in Progenetix?
*Application Programming Interfaces:*
"set of routines, protocols and tools that specifies how software components interact, to exchange data and processing capabilities" This is a way you can access databases. \
~ Definition from BIO390:Lecture 1 \
One way Progenetix uses APIs is with **Beacon+ API**. With Beacon, which was created by the Global Alliance for Genomics & Health (GA4GH) to make genomic data discoverable via APIs. *bycon* is the open-source that then runs the APIs on the Progenetix website. Based on the Beacon v2 standard, Progenetix's API lets users search for variants, filter by cancer type etc, query by location and many more things. \
Progenetix also has **Services API**, which also is built on *bycon*, but offers more specialized outputs like plots, convert biological names (like cytobands), get data about geographic locations (cities but also gene coordinates).\
Beacon+ API is for structured genomic queries, whereas Services API is for utility and transformation tools.
## How does Progenetix visualize CNA profiles?
- CNV Histogram Plots: These plots display copy number variation (CNV) frequencies across genomic regions.
    - The x-axis represents the genomic positions on the chromosome(s).
    - The y-axis represents the CNV frequency, so the percentage of samples showing gain (yellow) or loss (blue) at each x position.
    - You can generate these plots for:
        - a specific gene of interest (to explore CNVs affecting that gene)
        -  A cancer type or subtype (to identify common alterations across a cohort)
    - In R, the function pgxFreqplot() from the *pgxRpi* package can generate equivalent plots.
- Additionally, Progenetix also makes Sample Strip Plots. These plots display individual sample CNV profiles, with each strip representing a single sample.
## What do you think should be improved in Progenetix?
- In general, creating additional CNV visualizations—such as clustering maps to explore CNV patterns across different cancer types—would be valuable and interesting.
- Including transcriptomic and methylation data could improve the interpretation of CNVs and help connect findings to epigenetic mechanisms.
- Constantly increasing the representation of samples from diverse ancestral and geographic backgrounds would enhance the datasets' inclusivity.
- It might also be beneficial to establish a relationship between NCIt and UBERON, as many NCIt cancer types include anatomical references that could be mapped to UBERON terms (e.g., breast carcinoma → mammary gland). But connecting NCIt to ICD-O and ICD-O to UBERON might be sufficient enough.
- In addition, leveraging UBERON to create a body-wide anatomical map—visually highlighting CNV gains and losses across different organs—could be an interesting way to explore cancer-related alterations visually.
  
### Source for all the answers to the questions:
Qingyao Huang, Paula Carrio-Cordo, Bo Gao, Rahel Paloots, Michael Baudis, The Progenetix oncogenomic resource in 2021, Database, Volume 2021, 2021, baab043, <https://doi.org/10.1093/database/baab043> \
Progenetix Website <https://progenetix.org/> \
BIO 390: Introduction to Bioinformatics <https://compbiozurich.org/UZH-BIO390/>


