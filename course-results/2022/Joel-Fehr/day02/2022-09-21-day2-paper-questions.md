# Questions The Progenetix oncogenomic resource in 2021

## What is CNV/CNA?

*CNV* stands for compy number variation and *CNA* stands for copy number aberrations. CNA's are neary ubiquitous and frequently extensive structurul genome variations. The analysis of large genomic variant collections can be very important when it comes to understanding the molecular mechanisms underlying tumorigenesis. CNA's can be found in many cancer types and they have an impact in cancer development.[^1]

## How will you describe or introduce progenetix (scale, data source, cancer types and so on)?

Work over the last years has driven Progenetix to the most comprehensive representation of cancer genome CNA profiling data. Progenetix is publicly available cancer genome data resource and it gives information about genomic variations profiles in cancer. It also provides metadata, data annotation and visualization. The Progenetix data base includes 138'663 compy number variation profiles. Progenetix focuses on data for all types of human malignancies. The data source is based on molecular cytogenetics and sequencing.[^1]

Example for aggregated CNV data in 54 samples in major salivary gland[^1]:
![Example for aggregated CNV data in 54 samples in major salivary gland](https://progenetix.org/cgi/PGX/cgi/collationPlots.cgi?datasetIds=progenetix&id=UBERON:0001829)

Progenetix Data Resources[^1]:
<img width="1188" alt="Screen Shot 2022-09-21 at 15 20 14" src="https://user-images.githubusercontent.com/63153161/191514667-49aee691-a3eb-4ae0-81e7-71a0745e079e.png">

## Describe NCIt, ICOD, UBERON codes, and their relationships.

- NCIt: NCI Thesaurus (NCIt) provides reference terminology for many NCI and other systems. It covers vocabulary for clinical care, translational and basic research, and public information and administrative activities.[^2]

- UBERON: Uberon anatomy ontology is a cross-species anatomical structural ontology system closely
aligned with developmental processes. The structure of UBERON allows integrative queries linking multiple databases and
description logic query within the same organism and between model animals and humans.[^1]

- ICD-O: This topograpgy system provides organ- and substructure-specific mapping rooted in traditional clinical
and diagnostic aspects of a ‘tumor entity’.[^1]

<img width="1175" alt="Screen Shot 2022-09-21 at 15 03 13" src="https://user-images.githubusercontent.com/63153161/191511058-854c1c4f-b7d3-4044-b346-76394dd30820.png">

The genomic CNV fraction across 51 NCIt umbrella nodes Each dot represents one sample’s CNV fraction range from 0 to 1 and the red
horizontal line indicates median CNV of the respective cancer type. Each cancer type contains between 104 and 11 804 CNV profiles.[^1]

## What are CNV segmentations and CNV frequencies, and how to use them?

CNV segmentations: -

CNV frequencies: Frequency, how often a specific CNV occurs at one locus

## What are APIs and how to use APIs in progenetix?

API's are Application programming interfaces and the are helpful when it comes to data exchange. API's are interfaces which can easily be targeted with some kind of request.

API's in Progenetix can be used in order to query a database and get results for this specific query.
Progenetix uses the GA4GH Beacon API as a query interface.

## How does progenetix visualise CNA profiles?
Genomewide percentage of samples with copy number gain or copy number loss:
- gain (yellow)
- loss (blue)
<img width="939" alt="Screen Shot 2022-09-21 at 15 33 44" src="https://user-images.githubusercontent.com/63153161/191517837-ac297080-13fe-4cfc-823c-c99e80552660.png">

Below the CNA plot is a table showing the list of subsets as defined by ICD-O-3 and NCIt Ontology terms sorted
by frequency of matched samples within that subset.[^1]

## What do you think should be improved in progenetix?

-

[^1]: https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2022/2022-09-21/2022-09-21-day-02-paper-reading.pdf
[^2]: https://ncithesaurus.nci.nih.gov/ncitbrowser/
