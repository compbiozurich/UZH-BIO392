# The Progenetix Oncogenomic Resource 

## 1.  What is CNV/CNA?
- **CNV** stands for copy number variants
    - They originate from changes in copy number in germline cells.
    - It is the number of copies of a particular gene that varies from one individual to other individuals.
- **CNA** stands for copy number abberations
    - They are somatic changes to chromosome structure that result in gain or loss in copies of sections of DNA.
    - So structural genome variations in copy number that have arisen in somatic tissue and are nearly ubiquitous in cancer.

- Both can arise from deletions, insertions, or duplications resulting in chromosomal aberrations and aneuploidy.
- They help researchers disentangle molecular mechanisms of tumorigenesis and identify & characterise molecular subtypes of cancer.

## 2.  How will you describe or introduce progenetix (scale, data source, cancer types and so on)?
- [Progenetix](https://progenetix.org/) is a publicly accessible cancer genome data resource with a focus on individual genome-wide CNA profiles.
- It provides:
    - an overview of mutation data in cancer, through providing sample-specific CNA profiles and associated metadata,
    - services related to data annotation, meta-analysis and visualisation.

- It incorporates data from CGH (Comparative Genomic Hybridisation), that was focused on molecular cytogenetics, with WGS/WES, that were more focused on whole-genome/whole-exome sequencing. \
Recently it introduced also data from the Gene Expression Omnibus (GEO), which was used to the majority for deposition of data.\
Other resources include ArrayExpress, cBioPortal and TCGA.
- The data is based on individual sample data from currently 138'663 samples taken from published oncogenomic studies and data repositories.
    - This includes 5764 samples corresponding to 2162 different cancer cell lines, representing 259 different cancer types.
- In total the progenetix resource contains data of 834 different cancer types (NCIt neoplasm classification), mapped to a variety of biological and technical categories.
- The scale for the cancer-types are rather big (such as lung cancer, gastrointestinal cancer types, brain cancer, breast cancer, etc.).

## 3.  Describe NCIt, ICOD, UBERON codes, and their relationships
- **NCIt** = National Cancer Institute Thesaurus
    - NCIt is a dynamically developed hierarchical ontology.
    - It makes layered data aggregation and transfer between classification systems and resources possible.
- **ICD-O** = International Classification of Diseases in Oncology 
    - Used for cancer sample classification and provides organ- and substructure-specific mapping.
    - It is limited to hierarchical concepts and is hard to apply to modern ontologies.
    - The combination of the ICD-O Morphology and Topography coding systems depicts diagnostic entities with high specificity.
- Progenetix performed *"ICD-O—NCIt"* mappings that allow us, by adding the derived NCIt codes, to take advantage of NCIt’s hierarchical structure for data retrieval, analysis and exchange.

- **UBERON** = cross-species anatomical structural ontology system
    - It is closely aligned with developmental processes. 
    - It allows integrative queries linking multiple databases. 
- All existing ICD-O T codes have been mapped to UBERON terms.

## 4. What are CNV segmentations and CNV frequencies, and how can they be used?
- *CNV segmentations* represent the part of the genome which shows variation in number and it can be used to identify CNVs associated with certain cell types. 
- *CNV frequencies* represent the occurrence of certain copy number variations within a population or data set.\
Divide the genome into 1Mb-size bins and then count the occurrences of gain/loss events for all bins in the selected samples.
- An individual can use CNV segmentations with filter options for cancer type, tissue location, morphology, cell line or geographic location.
    
## 5. What are APIs and how are you to use APIs in progenetix?
- **API** = Application Programming Interfaces
    - They are a set of rules, protocols and tools for building software applications, which allows different software systems to communicate with each other.
    - It enables data exchange, allows integration between software systems and provides a standardised way for applications to request and share information.
- It can be described as the "language" one has to use to communicate with progenetix. 

## 6. How does progenetix visualise CNA profiles?
- CNA profiles are visualized as a genomwide plot displaying the percentage of samples with copy number gain in yellow and samples with copy number loss in blue. It will include all samples fitting your specific search.
    - E.g. selected chromosomal regions and grouping by subsets or studies. 
- Additionally, you obtain:
    - Cancer type classifications sorted by frequency on the matched biosamples present in the subset.
    - A list of matched biosamples with description, statistics and reference.
    - Matched variants with reference to biosamples. 

## 7. What do you think should be improved in progenetix?
- Increase the amount of data with constant updates from new studies.
- Connect data from all over the world and prioritise the validity of the data.
   
## References
[Paper: The Progenetix oncogenomic resource in 2021](https://academic.oup.com/database/article/doi/10.1093/database/baab043/6323245)


