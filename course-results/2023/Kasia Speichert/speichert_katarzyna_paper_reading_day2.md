## What is CNV/CNA?
Copy number aberrations repesent the frequent structural genome variations which are responsible 
for cancer development.

## Progenetix 

The Progenetix project is a cancer genome data resource which represents individual cancer CNA profiles together with associated metada from a broad range of oncogenomic studies and data repositories. Progenetix was first established in 2001 when it focused on data from chromosomal Comparative Genomic Hybridization (CGH) studies and with the time it incorporated data from molecular cytogenetics and sequencing experiments leading to the representation of cancer genome CNA profiling data with 138 663 copy number variation (CNV) profiles. Containing data of 834 different cancer types, the Progenetix aims to analyse different cancer biologies. 

## NCIt, ICOD, and UBERON

ICOD which stands for ‘International Classification of Diseases in Oncology’ is used by Progenetix to classify the cancer sample. It codes based on the Morphology and Topography with high specificity but unlike NCIt, it is limited with hierarchical concepts. NCIt is a hierarchical ontology which is able to transfer between classification systems and resources. 

>In the recent Progenetix update, we performed a data-driven generation of ICD-O—NCIt mappings and added the derived NCIt codes to all (existing and new) samples (mapping available through GitHub repository ‘progenetix/ICDOntologies’; manuscript in preparation), to take advantage of NCIt’s hierarchical structure for data retrieval, analysis and exchange

In contrast to ICDO which provides organ- and substructure-specific mapping, UBERON is the other anatomica structural ontology system which links multiple databases and describes logic query within the same organism and between model animals and humans. 

## What are CNV segmentations and CNV frequencies, and how to use them?

The CNV segments are parts of the genome which contain number viariations. CNV freuqency is used to represent how many of the CNV segments are found in a particular tumor. 

## What are APIs and how to use APIs in progenetix?
APIs are application programming interfaces used by the user (the representation of the data). THey provide communication between different computer programs. Currently the query interface is combined with the GA4GH Beacon API. 

>The top panel of the result page shows a summary with the number of matched samples, variants, calls and the frequency of alleles containing the CNA. The ‘Phenopackets’ link returns a json document of biosamples with the phenopacket-formatted response. The ‘UCSC region’ links externally to a University of California Santa Cruz (UCSC) browser track providing an overview of the genomic elements which map to the region of the observed variants. Also, customized visualization is enabled in the linked page ‘visualization options’, e.g. for selected chromosomal regions and grouping by subsets or studies. The lower panel is organized in four sections: (i) the ‘Result’ tab shows the genome-wide CNA by the percentage of samples with yellow (+) as CN gain and blue (−) as CN loss. Below the CNA plot is a table showing the list of subsets as defined by ICD-O-3 and NCIt Ontology terms sorted by frequency of matched samples within that subset. (ii) the ‘Biosamples’ tab shows information of matched biosamples, i.e. description, classifications and external identifiers. The table can be downloaded in json or csv format. The further detail of the biosample can be accessed by clicking the biosample id. (iii) The ‘Biosamples Map’ tab shows a world map with the matched geological locations highlighted. (iv) the ‘Variants’ tab shows the variant ‘digest’ (concatenated format with chromosome, start and end position, and type of the CNA) and its corresponding biosample and callset. Likewise, the table can be downloaded in json or csv format.

One can also just initially search for the publications title, author names or geographic location of the research center.

## How does progenetix visualise CNA profiles?

The genome-wide CNA is visualised in the `Result`tab by the percentage of samples with yellow (+) as CN gain and blue (-) as CN loss. Below that there is a table which represents the list of subsets defined by ICD-O and NCIt Ontology terms sorted by frequency of matched samples within that subset. 

## What should be improved in progenetix?

The data should be further expanded but more important the data should be easily sharable across many institutions through different services and platforms and the clinical annotations should be improved. 

