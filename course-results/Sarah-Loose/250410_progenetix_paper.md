# [The Progenetix oncogenomic resource in 2021](https://doi.org/10.1093/database/baab043)

## What is CNA/CNV
Both are structural genome variations: a CNV (Copy number variation) is a germline event, or describes variants in the population. A CNA (opy number abberation) is more often disease-associated and has a pathogenic connotation.

## Progenetix Information
One can obtain curated individual cancer CNA profiles and the associated Metadata.
Initially, the datasources are published studies and data repositories, but the focus lies on data from chromosomal Comparitive Genomic Hybridzation (CGH, 2001).
Then data was added from publications about genome variation profiles in cancer that use molecular cytogenetics (CGH, genomic arrays) and sequencing techniques (WGS-whole genome, WES-whole exom)
Now in 2021 new sources have been added like the arrayMap data collection, the Cancer Genome Atlas, cBioPortal, NCBI´s GEO and EMBL-EBI´s ArrayExpress.

The goal is to make a database for cancer genomics for all types of cancers. So far 138 663 CNV profiles (of these are 115 357 tumor CNV profiles) and 51 distinctie national Cancer Institute Thesaurus Cancer Terms are included.
The main goal of Progenetix is to build a "publicly accessibe cancer genome data resource" and to "provide a comprehensive representation of genomic variation profiles in cancer".

One can access sample-specific CNA profiles, their metadata, data-annotation, meta-analysis, and visualization.
This is an ongoing project, as can be seen, in the past 7 years the cancer loci-specific data growth quadrupled.


## NCIt, ICOD-3 and UBERON

All 3 are ontologies.

NCIt (National Cancer Institute Thesaurus) classifies and describes Cancer types. It is constructed by text mining and expert curation for annotation of medical data.

International Classification of Disease in Ontoltogy 3rd Edition
(ICD-O-3) for cancer sample classification. Prevalent annotation method with shortcomings. Struggles to represent hierarchichal concepts

NClt, in comparison can do this but is still rarely used due to ist novelty.
Progenetix uses a mixture of ICD-O-NCIt for read mappings (like NCIt is available as well) so all cancer samples in Progenetix have been annotated in NCIt ontology.

Uberon is an anatomical ontology that allows for linking of several databases.
The represented classes reach across species and focuses on structural anatomical despriptions. This can be connected to ICD-O-T codes so that the cancer types could me mapped to anatomical regions.


## What are Cnv segmentations and CNV frequencies and how to use them?

In the process of CNV analysis segmentation is useful for a comprehensive overview of variations.
Here, they determined allele-specific copy number abberations by comparing allele data from SNP-arrays using the B-allele-frequency (BAF). This enables detection of Loss of heterozygosity (LOH) events on the chromosomes in respective regions.
Segmentation then groups regions with longer stretches of consistent LOH events that can be further evaluated for copy number loss or gain.

CNV frequency would describe then how often this variation occurs across several samples. With this, common or rare alterations could be identified.

## What is an API and how is it used in Progenetix

An API (Appplication Programming Interface) is a set of commands, functions, protocols and objects that programmers can use to create a software or to interact with external systems.[^1] 
In Progenetix  one can query for information on CNV frequencies derived from an extensive, well-annotated and standartized database . It is highly relevant in cancer genomics and enables filtering based on selected categories.
It is based on the Beacon v2 API created by the Global Alliance for Genomics and Health (GA4GH) that creates a federated framework to inquire extensive information on genomic studies.!

## How does Progenetix Visualize CNA profiles?

In the user interface, the loss and gain regions are shown next to a karyogram. In the search for a certain cna one can query for biosamples with this respective range.
Furthermore, studies are geo-tagged and shown on a geographical map and one can follow external links to view variant alignment.
One can search for ceratin cancer types  in a hierarchical tree with NCIT Ontology.


## Improvements
As mentioned in the paper, further improvements would be expanding on clinically relevant annotations, improving the workflow  across databases and a focus on the type of variant information.


[^1]: Baudis, 2024: Bio 390, [Lecture 1: What is Bioinformatics](https://raw.githubusercontent.com/compbiozurich/UZH-BIO390/main/course-material/2024-09-17___Michael_Baudis__What_is_Bioinformatics__UZH-BIO390-HS24-lecture-01.pdf) UZH
