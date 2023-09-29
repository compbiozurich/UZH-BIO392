# The Progenetix Data Resource

## 1) What is CNV/CNA?
- **CNV** stands for copy number variation
  - the number of copies of a specific segment of DNA varies among different individuals’ genomes
  - is defined as a DNA segment that is present at a variable copy number when compared to a reference genome.
  - such regions may or may not include genes

- **CNA** stands for copy number aberration
  - deletion or amplification of large genomic regions
  - CNAs are frequent structural genome variations, (meaning a person has more or fewer copies of a gene through duplication or deletions events)
  - CNAs are present in a majority of cancer types and have a functional impact on cancer development.

## 2) How will you describe or introduce progenetix (scale, data source, cancer types and so on)?
-	Progenetix is a publicly accessible cancer genome data resource
-	The progenetix database specializes in cataloging CNVs and offers tools for visualizing and analyzing CNV data
-	Users can search for specific genes, genomic regions, or cancer types to access relevant data and studies within the Progenetix database.
-	Data source: originally focused on data from chromosomal Comparative Genomic Hybridization (CGH) studies, now incorporated data from hundreds of publications based on CGH and sequencing. Data from GEO contribute a substantial fraction of the genomic screening data in the Progenetix collection. Additional resources: ArrayExpress, cBioPortal, TCGA project and the thousand genomes project.
-	In order to maximize qualitative homogeneity of final CNA calls, progenetix applies their in-house data processing pipeline from the arrayMap project.
-	Hundreds of different cancer types
-	The data is based on individual sample data from currently 145265 samples
-	The progenetix resource contains data of 834 different cancer types (NCIt neoplasm classification)

## 3) Describe NCIt, ICOD, UBERON codes, and their relationships
-	**NCIt**: National Cancer Institute Thesaurus, dynamically developed hierarchical ontology, all cancer samples in Progenetix have been annotated with a NCIt code
-	**ICD-O**: International Classification of Diseases in Oncology, used by Progenetix for cancer sample classification, ICD-O is limited in its representation of hierarchical concepts. Provides organ- and substructure specific mapping.
-	**Uberon**: cross-species anatomical structural ontology system allowing integrative queries linking multiple databases.

## 4) What are CNV segmentations and CNV frequencies, and how to use them?
- **CNV segmentation**: Process of dividing a genome into segments or regions based on copy number variations. It involves identifying specific stretches of DNA that have different copy numbers compared to the reference genome.
- **CNV frequencies**: Prevalence of specific CNVs within a population or dataset. Used to assess whether specific CNV are common or rare among a group of individuals.

## 5) What are APIs and how to use APIs in progenetix?
- API: Application Programming Interfaces: a set of rules and protocols that allows different software applications to communicate and interact with each other. APIs are usually used to access web-based services or databases. 
- The GA4GH Beacon is the API of progenetix and is used to perform a CNA query with start and end position range with filter options for cancer type, tissue location, morphology, cell line or geographic location.

## 6) How does progenetix visualise CNA profiles?
There are different visualization options available on the Progenetix website. Users can choose to visualize selected chromosomal regions or a genome-wide CNA. The following list names a few visualization options:
- **Chromosomal view**: This visualization shows the distribution of CNAs across different chromosomes. Amplifications and deletions are usually represented using different colors.
- **Heatmap**: In this representation, each row represents a specific genomic region, and columns represent different samples or patients. The intensity of the color at each intersection the frequency of CNAs. This method is useful to identify patterns across multiple samples.
- **Scatterplot**: can be used to show the relationship between CNAs in different genomic regions (compare the CNA of a gene of interest to another gene).

## 7) What do you think should be improved in progenetix?
- collect even more data to improve statistical significance
- enhancing clinical and diagnostic annotation
- expand cross-database references and the types of genomic variant data 
- active data sharing and integration through networked services and platforms

## Sources:
- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8285936/
- https://progenetix.org/
- https://www.sciencedirect.com/topics/biochemistry-genetics-and-molecular-biology/copy-number-variation/
