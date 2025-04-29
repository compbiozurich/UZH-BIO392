# BIO392 Assignment Day 3

**Reference**  
Huang Q, Carrio-Cordo P, Gao B, Paloots R, Baudis M. **The Progenetix oncogenomic resource in 2021**. *Database (Oxford).* 2021 Jul 17;2021:baab043. doi: 10.1093/database/baab043. PMID: 34272855; PMCID: PMC8285936.

## 1. What is CNV/CNA?

CNV (Copy Number Variation) and CNA (Copy Number Aberration) are structural mutations in which a specific region of genomic DNA is present in greater (amplified) or lesser (deleted) amounts than usual. CNVs can be part of the normal variation in the human genome but often have pathological significance in cancer. CNA is a term used to refer to an abnormal form of CNV found specifically in cancer cells. CNA represents extensive structural variations in the genome that have a functional impact on cancer development.

## 2. How will you describe or introduce Progenetix (scale, data source, cancer types and so on)?

Progenetix is a publicly accessible cancer genome data resource that provides sample-specific CNA profiles, associated metadata, and services related to data annotation, meta-analysis, and visualization.  
Scale: As shown in Table 1, the resource includes 1,939 studies, 138,663 samples, 788 NCIt classifications, 115,359 cancer loci, and 5,764 samples corresponding to 2,162 different cancer cell lines.  
Data sources: These include the previously separate arrayMap data collection as well as external resources such as TCGA, cBioPortal, NCBI’s GEO, and EMBL-EBI’s ArrayExpress.  
Cancer types: Classification is based on NCIt.

## 3. Describe NCIt, ICD-O, UBERON codes, and their relationships.

NCIt (National Cancer Institute Thesaurus) is a dynamically developed hierarchical ontology that supports layered data aggregation and translation between classification systems and resources. It covers areas such as cancer diagnosis, histology, biology, treatment, and genetic abnormalities. In Progenetix, NCIt is used as a standard ontology. All samples are assigned NCIt codes and integrated into 51 main nodes to enable comparison of CNV patterns, among other applications.  
ICD-O (International Classification of Diseases for Oncology) provides organ- and substructure-specific mapping rooted in traditional clinical and diagnostic aspects of a "tumor entity", describing cancer by combining morphology and topography codes.  
UBERON (Uber Anatomy Ontology) is a cross-species anatomical ontology system closely aligned with developmental processes.  
In Progenetix, existing ICD-O based data is mapped to both NCIt and UBERON.

## 4. What are CNV segmentations and CNV frequencies and how to use them?

CNV segmentation is a record of copy number changes (amplifications or deletions) for each contiguous region (segment) of the genome. In Progenetix, the most prevalent copy number is set as the baseline, and the relative copy number gains and losses per sample are derived based on the assumption that relative gene dosage imbalance has pathophysiological effects in cancer biology.  
CNV frequencies refer to the percentage of genomic regions with copy number aberrations across multiple samples. Typically, genomes are binned, and the amplification and deletion rates for each region are calculated.  
Segmentation is used for structural analysis of individual genomes, while frequency is used to compare and identify trends at the group level, such as differences between cancer types or subtypes, the identification of "hot spot" regions, and the assessment of the functional significance of aberrant regions.

## 5. What are APIs and how to use APIs in Progenetix?

An API (Application Programming Interface) is a set of rules that allows programs to interact with software and databases.  
In Progenetix, the query interface for retrieving sample-specific data is built on a forward-looking implementation of the GA4GH Beacon API. This allows users to access, search, and retrieve cancer genome data directly from their own programs.

## 6. How does Progenetix visualise CNA profiles?

Progenetix provides visual summaries showing the number of matched samples, variants, calls, and the frequency of alleles with CNAs. CNA frequencies in each chromosome region are shown using bar plots, and CNV fractions across the genome for each sample are visualized with dot plots. Information about biosamples is also included. Additionally, users can upload their own segmentation files for visualization.

## 7. What do you think should be improved in Progenetix?

Since there are 98 unmapped terms in the NCIt ontology tree structure, there are limitations in treating Progenetix as a fully classifiable dataset. Mapping accuracy, automation, and the frequency of updates should be improved.  
Geographic coordinates are often inferred from author addresses or contact information, which may differ from the actual origin of the patient or sample. Therefore, the accuracy of patient origin data should be improved.  
For some samples, ancestry groups are estimated from SNP data, but overall coverage is limited. Thus, the sample base for ASCN analysis should be expanded to allow for analysis across a wider range of racial and ethnic groups.
