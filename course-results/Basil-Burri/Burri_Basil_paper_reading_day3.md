# Assignment by Basil Burri

**Note:** Questions were answered based on the information from the [Progenetix paper](https://doi.org/10.1093/database/baab043) and lecture about [Classifications](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2025-04-17___Michael-Baudis__Classifications%2C-Data-Sharing___BIO392-FS25.pdf). 


## 1. What is CNV/CNA?
   - Copy Number Variation (CNV) or Copy Number Aberration (CNA) are structural genomic variations where segments of DNA are duplicated or deleted, resulting in altered copy numbers. CNAs are common in most cancer types, impacting cancer progression by causing gene dosage imbalances.

## 2. How will you describe or introduce Progenetix (scale, data source, cancer types and so on)?
   - [Progenetix](https://progenetix.org) is a publicly accessible oncogenomic database providing comprehensive cancer genome CNA profiles and metadata. It contained in 2021 138'663 CNV profiles (from 115'357 tumor samples) from sources like GEO, ArrayExpress, cBioPortal, TCGA, and publication-based data. It covers 788 NCIt cancer types, with 51 prominent nodes (umbrella nodes). Progenetix incorporates data from sequencing (WES and WGS) and molecular cytogenetics such as Comparative Genomic Hybridization (CGH). [Overview of CGH Array Workflow](https://ars.els-cdn.com/content/image/1-s2.0-S1578219016303328-gr7.jpg)

## 3. Describe NCIt, ICDO, UBERON codes, and their relationships

### NCIt (National Cancer Institute Thesaurus):

- **Description:** Site-specific hierarchical ontology for cancer classification, that allows layered data aggregation (e.g. multiple different cancer types of the intestine) and transfer of classification systems and resources. NCIt terms are not frequently used in primary sample annotations. Additionally, the number of increasingly specific NCIt terms outruns their incorporation into the hierarchical tree. This trend led to the situation that 98 terms are not represented in the tree hierarchy. Terms can also have multiple occurences in diagnostic trees.
  
- **NCIt code:** Individual codes for site-specific occurences of neoplasms. **1 code per cancer.**
- **Example:** NCIT:C7541 (Retinoblastoma)


### ICD-O (International Classification of Diseases for Oncology)

- **Description:** Provides specific morphology (histology of cancer) and topography (site of cancer) codes for cancer diagnostics but lacks hierarchical structure and is not easily transformed to modern ontologies. The ICD-O topography provides organ- and substructure-specific mapping rooted in traditional clinical aspects of tumors obtained from pathology reports. ICD-O is used by pathologists but not so much in clinics (more ICD-10 or SNOMED). ICD-O lacks an ontology and is also not truly hierarchical. Additionally, ICD-O entities are difficult to remap if only single codes were used.
  
- **ICD-O code:** Combines the biology (tumor morphology) and clinics (tumor site) of a tumor. **2 codes per cancer.**
- **Example:** 9510/3 C69.2 (Retinoblastoma of the Retina)


### UBERON (Uber-Anatomy Ontology):
- **Description:** Cross-species anatomical structural ontology system aligned with developmental processes and function (e.g. excretory system). The relationship structure of UBERON facilitates integrative queries across databases, queries within the same organism (linking related organs) and queries between model animals and humans. The comparative anatomy ontology of UBERON connects structures based on "part-of" (e.g. fingers as part of forelimbs) and "develops-from" (e.g. bones derived from mesoderm). 
- **UBERON code:** Each term is assigned a unique UBERON code that links to a description of the structure and the location of the structure in a hierarchical tree of anatomical entities. **1 code per term.**
- **Example:** UBERON:0002113 (Kidney)

**Relationship:** Progenetix maps ICD-O to NCIt for hierarchical representation and ICD-O topography to UBERON for anatomical annotation. 

## 4. What are CNV segmentations and CNV frequencies, and how to use them?

### CNV Segmentations
- **Definition:** Dividing genomic data after read depth normalization into regions with consistent copy number states (gains or losses).
- **Usage:** Segmentation identifies CNA regions for analysis.
- CNV detection in sequencing data starts after read depth normalization with CNV segmentation, where the genome is divided into non-overlapping regions under the assumption that each region shares the same copy number (CN). Segmentation aims to identify the boundaries of segments where CNVs occur. These boundaries are called breakpoints. [Reference](https://academic.oup.com/bib/article/25/2/bbae022/7604887)
- Two common segmentation algorithms are Circular Binary Segmentation (CBS) and Shifting Level Models (SLM). [Reference](https://support-docs.illumina.com/SW/DRAGEN_v38/Content/SW/DRAGEN/CNVSegmentation_fDG_swHS.htm)

### CNV Frequencies
- **Definition:** The percentage of samples showing a CNV for a genomic region over the total number of samples in a cohort. [Reference](https://www.bioconductor.org/packages/release/bioc/vignettes/pgxRpi/inst/doc/Introduction_3_access_cnv_frequency.html)
- **Usage:** CNV frequencies can be used to compare CNA patterns across cancer types to identify subtypes or to investigate the molecular mechanisms.
- CNV frequencies reflect the copy number alteration prevalence across cancer types. The global frequency median of genomes with a copy number alteration (CNV fraction) is 0.121 among different cancer types. CNV frequency data can get retrieved from the Progenetix database.
- By using e.g. ``pgxLoader(type="cnv_frequency", output ="pgxfreq", filters=c("NCIT:C3058"))`` in R one can retrieve the CNV frequency for Glioblastoma over the total number of samples in the Progenetix database. [Documentation from Hangjia Zhao](https://www.bioconductor.org/packages/release/bioc/vignettes/pgxRpi/inst/doc/Introduction_3_access_cnv_frequency.html)

## 5. What are APIs and how to use APIs in Progenetix?
   - **Definition:** An API (Application Programming Interface) is a structured set of protocols, endpoints, and data formats that enables communication between software applications. APIs facilitate request-response, connecting client-side programs to servers or external services for data retrieval, functionality integration, or system interoperability. [Source](https://www.talend.com/resources/what-is-an-api/)

   - **APIs in Progenetix:** Progenetix uses the GA4GH Beacon API (with features from version v2) for querying CNA data. Users can access sample-specific CNA profiles via API endpoints. Queries can filter for cancer type, genomic region or geography. The API response is in Phenopackets json format. [GA4GH Beacon project](https://genomebeacons.org/)

## 6. How does Progenetix visualize CNA profiles?

### Progenetix visualizes CNA profiles through a web interface with:
- **Genome-wide CNA plots:** Display percentage of samples with gains (yellow) or losses (blue) per region.
- **NCIt-based summaries:** Stacked bar plots and hierarchical trees for 51 cancer nodes.
- **Biosample tables:** List matched samples with classifications and identifiers.
- **Geographic maps:** Highlight sample origins.
- **Other options:** Visualization by chromosomal regions, subsets, or studies, with links to UCSC browser tracks.

- **pgxLoader:** CNV data can also get accessed by ``pgxLoader`` in R from the Progenetix database via the Beacon v2 API. CNV frequency plots by genome can be displayed using ``pgxFreqplot``. E.g. display genome wide the CNVs found in Glioblastoma samples by using ``pgxFreqplot(freq_pgxfreq, filters="NCIT:C3058")``. CNV frequency plot by chromosomes can be displayed using ``pgxFreqplot`` and specifying the chromosomes. E.g. display the CNVs found in Glioblastoma samples on chromosome 7 and 9 by using ``pgxFreqplot(freq_pgxfreq, filters='NCIT:C3058',chrom=c(7,9), layout = c(2,1))``.

## 7. What do you think should be improved in Progenetix?
- For me, it is difficult to say what could be improved in Progenetix, as everything worked nicely for the tasks I used it for. However, I could see added value if Progenetix included additional genomic variant types (e.g. point mutations) to create a centralized database for disease-associated genomic variations. Additionally, I think that biological sex annotation could help investigate whether there is a gender bias for certain variants. The API access via ``pgxRpi`` in R is very convenient for analysis. However, a dedicated cell line data access tool could be helpful for downloading multiple files. I’m unsure if such a tool already exists or whether there is a download limit set by Progenetix. I particularly like the [Use Cases of Progenetix](https://docs.progenetix.org/use-cases/) page, which explains how to use Progenetix. When I searched on YouTube for Progenetix tutorials, I couldn’t find any. A tutorial video might increase the number of users, as many people today look on YouTube for brief explanations.
