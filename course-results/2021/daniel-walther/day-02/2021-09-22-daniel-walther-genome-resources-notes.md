_Preface, useful link(s)_
* [List of biological databases](https://en.wikipedia.org/wiki/List_of_biological_databases) - good general starting point.
"(?)" at the start of the line means "uncertain of the correctness of this statement".

# Notes on Genome Resources in Bioinformatics
This file contains information on some genome resources which are online portals for exchange and storage of genome sequencing data, and maybe also a demonstration of the Markdown language. I will do this by listing properties of the resources mentioned in the lecture from this morning.
The *purpose* of this file or task is to familiarise myself with the Markdown language by summarising and comparing properties of data resources used frequently in the field of bioinformatics, thus learning about two things simultaneously (skill and knowledge).

## Noteworthy genome resources
The resources mentioned below are from today's lecture. These resources could be characterised by the kind of genomic data they provide (e.g. human, microbial, synthetic, RNA etc.) and by their purpose (e.g. archive, raw data, aggregated health metadata, publicly accessible etc.) or other properties.

### Reference _and_ genome variant resource(s)
[IGSR](https://www.internationalgenome.org/): The International Genome Sample Resource - "Supporting open human variation data".
I found on page outside of the lecture, on the course website. At first glance, it appears to cover both reference genome and genomve variant data

### _Reference_ genome resources
(?) These resources collect reference genomes, i.e. genomes to be used as reference sequences when working with genomic data in general. E.g. genomes of healthy to-be-mothers.

#### The [UCSC Genome Browser](https://genome.ucsc.edu/) (lecture)
This resource originated from the Human Genome Project (based in Santa Cruz (CA)).
* Most widely used general genome browser.
* _Many species_
* Many default tracks (?)
* Customisation with "BED" files (?)
* [Europe mirror](https://genome-euro.ucsc.edu/) and [asia mirror](https://genome-asia.ucsc.edu/)

#### The [Human Genome Resources at NCBI](https://www.ncbi.nlm.nih.gov/projects/genome/guide/human/)
* Entry point for genome reference data
* _Human genome assemblies_
* Human variant collections (dbVar, ClinVar, dbSNP) for download

#### [Ensembl](https://www.ensembl.org/index.html)
* Entry point for many genome data _services_ and collections
* Downloads ("BioMart"), REST API

### Genome _variant_ resources
(?) These resources collect variants of genomes with (potentially) interesting variability, i.e. genomes of interest in genetic experiments/research. E.g. genomes of cancer-ridden to-be-mothers.

#### Particularly useful reference resources for human genome variants
* NCBI:dbSNP
  * single nucleotide polymorphisms (SNPs) and multiple small-scale variations
  * including insertions/deletions, microsatellites, non-polymorphic variants
* NCBI:dbVAR
  * genomic structural variation
  * insertions, deletions, duplications, inversions, multinucleotide substitutions, mobile element insertions, translocations, complex chromosomal rearrangements
* NCBI:ClinVar
  * aggregates information about genomic variation and its relationship to human health
* EMBL-EBI:EVA
  * open-access database of all types of genetic variation data from all species
* Ensembl
  * portal for many things genomic

#### [ClinGen](https://clinicalgenome.org/)
* Interpreted genome variants with disease association
* see [ClinGen and ClinVar](https://www.clinicalgenome.org/about/clingen-clinvar-collaboration/) partnership
* ClinVar (an NCBI database/resource) is used as basis for curated variant <-> disease associations in ClinGen
* ClinGen - a funded project (application/funding limited)
* ClinVar - an internal NIH resource (dependent on political "goodwill")

#### Resources for cancer genomics
* [COSMIC](https://cancer.sanger.ac.uk/cosmic)
* Cancer Genome Anatomy Project [CGAP](https://en.wikipedia.org/wiki/Cancer_Genome_Anatomy_Project#See_also)
* International Cancer Genome Consortium [ICGC](https://dcc.icgc.org/)
* Precision Medicine Knowledge Base [PMKB](https://pmkb.weill.cornell.edu/)
* [arrayMap](https://arraymap.progenetix.org/progenetix-cohorts/arraymap/) by Michael Baudi's Computational Oncogenomics research group
  * Reference resource for copy number variation (CNV) data in cancer
* [progenetix](https://progenetix.org/) by Michael Baudi's Computational Oncogenomics research group
  * Cancer CNV Information Resource
  * _Curation_ of published CNV profiling data
