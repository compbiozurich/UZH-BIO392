# Task 3

**Questions:**

**1. What is CNV/CNA: Copy number variation and copy number abberation**
- CNV: Refers to the genetic trait involving the number of copies of a particular gene present in the genome of an individual. Genetic variants, including insertions, deletions, and duplications of segments of DNA, are also collectively referred to as CNV
- CNA: present in majority of cancers,exert functional impact in cancer development, nvolve larger portions of the genome that can either be lost (deletions) or duplicated (amplifications). Tumors in different patients carry variable amounts of these deletions or amplifications, which together are known as the CNA burden

**2. How will you describe or introduce progenetix (scale, data source, cancer types and
so on)?:**

- Public accesible cancer genome data resource
- The Progenetix database provides an overview of mutation data in cancer, with focus on copy number abnormalities (CNV / CNA), for all types of human malignancies
- Data from: chromosomal comparative genomic hybridzation studies, genome profiling experiments. datasets from external resources and projects, GEO, Array express, cBioPortal, TCGA preoject
- currently 142063 samples
![This is an image](https://www.ncbi.nlm.nih.gov/pmc/articles/instance/8285936/bin/baab043f1.jpg)

**3. Describe NCIt, ICOD, UBERON codes, and their relationships**

- NCIt is a dynamically developed hierachical ontology, which empowers layered data aggregation and transfer between classification systems and resources
- Data driven generation of ICD-O-NCIt mapping
- added derived code to all samples to take advantage of NCIts hierachcal structure
- Due to the comparatively recent development and ongoing expansions, NCIt terms are rarely used
- All cancer samples in Progenetix have been annotated with an NCIt code
- UBERON is a cross species anatomical structural ontology system
- allows integrative queries linking multiple databases
- maping of all existing ICD O T codes to UBERON terms

**4. What are CNV segmentations and CNV frequencies, and how to use them?**

- CNV segmentation: In the segmentation step a statistical approach is used to merge the regions with the similar read count to estimate a CNV segment
- CNV frequency: relativ number of duplications or deletions
- Segmentation is used for clear definition of the regions and determination of frequencies for clustering 

**5. What are APIs and how to use APIs in progenetix?**

- Aplication programming interface
- which is a software intermediary that allows two applications to talk to each other
- query interface for retrieval of sample specific data is build on top of a forward looking implementation of the GA4GH Beacon API
![This is an image](https://www.ncbi.nlm.nih.gov/pmc/articles/instance/8285936/bin/baab043f3.jpg)

**6. How does progenetix visualise CNA profiles?**

- With cancer genomes grouped in the 51 NCIt nodes, we assessed their differences in the CNV landscape
- The current model treats the most prevalent copy number as the baseline and derives the relative copy number gain and loss per sample based on the assumption that the relative gene dosage imbalance exerts pathophysiological effects in cancer biology

**7. What do you think should be improved in progenetix?**
