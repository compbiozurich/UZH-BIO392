### • What is CNV/CNA?

CNA = Copy number aberrations ; present in most cancer types and excert functional impact on development

CNV= Copy number variations

### • How will you describe or introduce progenetix (scale, data source, cancer types and so on)?

Progenetix is the largest publicly accessible cancer genome data resource containing curated biological and technical metadata on a vast range of cancer types

includes datasets from external resources like TCGA, cBioPortal, ArrayExpress, GEO

very little pre-processing is preferred in order to maximize qualitative homogeneity of the final CNA calls.

they apply their in house processing pipeline from the arrayMap prjoect

the current analysis workflow handles the processing of 13 Affymetrix SNP array platforms including 9 Genome wide arrays

variations in abundance of copy numbers have pathophysiological effects in cancer biology

the most prevalent copy number is treated as the baseline and the bigger the abberation, the bigger the effect

ASCN= Allele specific copy number variation

LOH= loss of heterozygosity

ASCN Potentiates new analysis: first, gives overview of germline variant landscape, second, allows detection of LOH events

copy number netural LOH can be commonly observed in hematological malignancies

### • Describe NCIt, ICOD, UBERON codes, and their relationships.

NCIt (National Cancer Institute Thesaurus) is a dynamically developed hierarchical ontology which empowers layered data aggregation and transfer between classification
 systems and resources
 
 recent progenetix update they performed a data-driven generation of NCIt mappings and added the derived codes to all existing samples
 to take advantage of its hierarchical structure for data retrieval, analysis and exchange
 
 ICD-O topography system provides organ- and substructure-sepcific mapping rooted in traditional clinical and diagnostics aspects of
 a tumor entity
 
 UBERON is a cross-species anatomical structural ontology systeam closely aligned with developmental succes
 
 Its relationship structure allows integrative queries linking multiple databases and description logic query within the same organism and
 between model animals and humans
 
 they updated the data so it shows geographic information
 
 ### • What are CNV segmentations and CNV frequencies, and how to use them?
 
 i m not sure this is really answered in the paper. i guess they just measure frequencies of aberrations and the more variation there is the more damaging a certain CNA is.
 
 ### • What are APIs and how to use APIs in progenetix?
 
 The completely re-designed user interface provides flexibility
 and versatility in query parameters and types and optimized
 the response delivery
 
 API is an application program interface which makes working with progenetix a lot more user friendly
 
 ### picture of API
 
 
 
 
 
 
 <img width="905" alt="Screen Shot 2022-09-21 at 14 53 21" src="https://user-images.githubusercontent.com/113686985/191508910-f11fb36e-55b7-43ff-8904-ff8edd976cfa.png">

 
 
 
 ### • How does progenetix visualise CNA profiles?
 
 in a chart that shows the genome-wide CNA by the percentage of samples with yellow (+) as CN gain and blue (−) as CN loss. 
 
 
 
 <img width="435" alt="Screen Shot 2022-09-21 at 15 16 48" src="https://user-images.githubusercontent.com/113686985/191513906-937de9fe-a7ed-4037-823c-f5325d7dc309.png">


### • What do you think should be improved in progenetix?

the paper did not mention a lot about how privacy is handled and if it is possible the retrace the data to a person.
if that were the case it would definitely need to be improved in my opinion.  \
Getting more and better quality samples always improves databases. 





 
 
 
 
 
 




