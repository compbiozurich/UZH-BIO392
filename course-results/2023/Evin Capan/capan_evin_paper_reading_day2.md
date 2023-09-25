# **Day 2 - Progenetix Paper**
 
## **What is CNV/CNA?**

**Copy Number Variation (CNV):** CNVs are variations in the number of copies of genomic segments that are present in heritable DNA (germline cells).

**Copy Number Aberration (CNA):** CNAs are alterations in the number of copies of genomic segments that occur in non-heritable DNA (somatic cells). They are acquired during lifetime and are present in most types of cancer, where they exert functional impact in cancer development.
Because of this, the comparative and meta-analysis of large genomic variant collections can be of great importance to disentangle the molecular mechanisms underlying tumorigenesis and to identify and characterise molecular subtypes.

<sub>(Ha G, Shah S. Distinguishing somatic and germline copy number events in cancer patient DNA hybridized to whole-genome SNP genotyping arrays. Methods Mol Biol. 2013;973:355-72. doi: 10.1007/978-1-62703-281-0_22. PMID: 23412801)</sub>

## **How will you describe or introduce progenetix (scale, data source, cancer types and so on)?**

Progenetix ([progenetix.org](https://progenetix.org/)) is a publicly accessible cancer genome data resource. It aims to provide a comprehensive representation of genomic variation profiles in cancer, through providing sample-specific CNA profiles and associated metadata as well as services related to data annotation, meta-analysis and visualization.

After its establishment in 2001, the resource began progressively incorporating data from hundreds of publications reporting on genome profiling experiments based on different molecular-cytogenetics- and sequencing-based technologies, resulting in the most comprehensive representation of cancer genome CNA profiling data with 138 663 (including 115 357 tumor) copy number variation (CNV) profiles.

Large quantities of data content have been continuously added from various sources: from the previously separate arrayMap data collection, from external resources and projects such as The Cancer Genome Atlas (TCGA) or cBioPortal, as well as NCBI’s Gene Expression Omnibus (GEO) and EMBL-EBI’s ArrayExpress.

To maximize the qualitative homogeneity of the final CNA calls, Progenetix uses source files with the least amount of pre-processing and applies their in-house data processing pipeline.

There is a substantial amount of data to different cancer loci: from hematopoietic and reticuloendothelial systems to lymph nodes, breast, cerebellum, brain, cerebrum, liver, stomach, skin, etc.

## **Describe NCIt, ICOD, UBERON codes, and their relationships.**

**NCIt (National Cancer Institute Thesaurus):** NCIt is a dynamically developed hierarchical ontology, which empowers layered data aggregation and transfer between classification systems and resources.

**ICD-O (International Classification of Diseases in Oncology):** The ICD-O has been used by Progenetix since its establishment for cancer sample classification. By combining its Morphology and Topography coding systems, diagnostic entities can be depicted with high (organ- and substructure-) specificity. The ICD-O is limited in its representation of hierarchal concepts.

**UBERON (Uber-anatomy ontology):** UBERON is a cross-species anatomical structural ontology system closely aligned with developmental processes. Its relationship structure allows integrative queries linking multiple databases withing the same organism and between model animals and humans.

Recently, Progenetix performed a data-driven generation of ICD-O—NCIt mappings and added the derived NCIt codes to all samples, taking advantage of NCIt’s hierarchical structure for data retrieval, analysis and exchange. Progenetix also mapped all existing ICD-O T codes to 'UBERON' terms.

## **What are CNV segmentations and CNV frequencies, and how to use them?**

**CNV segmentation** is the division of the genome into segments based on variations in the number of copies of specific DNA sequences within those segments. CNV segmentation can be used to help analyze genetic variations (small gene changes or large chromosomal alterations), helping to understand the genetic basis of diseases.

**CNV frequencies** refer to the proportion of individuals in a population with a specific CNV at a particular genomic location. CNV frequencies are used to determing how common or rare a CNV is within a group of individuals or a specific population.

## **What are APIs and how to use APIs in Progenetix?**

**APIs (Application Programming Interfaces)** are sets of rules that enable communication and interaction among different software applications. They make it easier for developers to use certain features or access data from Progenetix (or another platform) without needing to understand the inner workings of its system.

Progenetix' query interface is built on top of the GA4GH Beacon API. To perform a CNA query, users have the option to enter the start and end position range with filter options for cancer type, tissue location, morphology, cell line or geographic location. Users can also access samples from the NCIt hierarchical tree or other classification systems to select a subset of cancer types for summary statistics and visualization. They can even upload their own data to visualize genome-wide CNA.


## **How does progenetix visualise CNA profiles?**

Progenetix shows the genome-wide CNA by the percentage of samples with yellow (+) as CN gain and blue (−) as CN loss. Below the CNA plot is a table showing the list of subsets as defined by ICD-O-3 and NCIt Ontology terms sorted by frequency of matched samples within that subset. There is a 'Biosamples' tab, which shows information of matched biosamples. Additionally, the 'Biosamples Map' tab shows a world map with the matched geological locations highlighted. And the 'Variants' tab shows the variant 'digest' (concatenated format with chromosome, start and end position, and type of the CNA) and its corresponding biosample and callset.
![Alt text]([http://full/path/to/img.jpg](https://oup.silverchair-cdn.com/oup/backfile/Content_public/Journal/database/2021/10.1093_database_baab043/1/baab043f3.jpeg?Expires=1698707251&Signature=ruloArU0tiOAZsGS40If6-6b07W9M-u8vL7Ko5Vm9mte3GnoHvPt2fGyiePDoovQXtriHxxN2tUwx2d2EroJvddOUZY6eMqzD5loXUnHqDp5x530ZfChJKEXWwEEClalrHuEPfSrm8-gtonUq8kamoJy8LSyhrKk62kBg2FSVWyZZiGGBdaSqFrg9jQpUr9xLwZLXeSZ7eHjHa9ABbHoTtkWUYMW5H2sY4nsRg2EY8Ek~a-Pba-4pbKeIeRx5qJzldFvSLhIPKFd2gqfV-0JWCJ2tA8mm8F5zHdXMPvycQj3vkQ9VwJsWV27LHV~Mx7ufAK8R-dio14OMv7giBfPvQ__&Key-Pair-Id=APKAIE5G5CRDK6RD3PGA)https://oup.silverchair-cdn.com/oup/backfile/Content_public/Journal/database/2021/10.1093_database_baab043/1/baab043f3.jpeg?Expires=1698707251&Signature=ruloArU0tiOAZsGS40If6-6b07W9M-u8vL7Ko5Vm9mte3GnoHvPt2fGyiePDoovQXtriHxxN2tUwx2d2EroJvddOUZY6eMqzD5loXUnHqDp5x530ZfChJKEXWwEEClalrHuEPfSrm8-gtonUq8kamoJy8LSyhrKk62kBg2FSVWyZZiGGBdaSqFrg9jQpUr9xLwZLXeSZ7eHjHa9ABbHoTtkWUYMW5H2sY4nsRg2EY8Ek~a-Pba-4pbKeIeRx5qJzldFvSLhIPKFd2gqfV-0JWCJ2tA8mm8F5zHdXMPvycQj3vkQ9VwJsWV27LHV~Mx7ufAK8R-dio14OMv7giBfPvQ__&Key-Pair-Id=APKAIE5G5CRDK6RD3PGA "CNA by percentage")


## **What do you think should be improved in progenetix?**

Answer 7
