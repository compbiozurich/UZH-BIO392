# The Progenetix oncogenomic resource in 2021
**[Paper reading](https://pubmed.ncbi.nlm.nih.gov/34272855/) – Questions day 3**

**1.	What is CNV/CNA?**

CNVs are Copy Number Variations and CNAs are Copy Number Aberrations. These are genomic structural variations, 
meaning we have duplicated or deleted sections in a genome. Copy number aberrations are found in most cancer types 
and they can have an impact on cancer development. CNAs are often quite extensive in cancer genomes. While CNVs can be 
found in healthy individuals as well, CNAs are often associated with cancer genomes. 

**2.	How will you describe or introduce progenetix (scale, data source, cancer types and so on)?**

Progenetix is an open resource for oncogenomic profiles. It provides an overview of genomic variation in cancer and mainly 
focuses on copy number abnormalities. Over 150’000 cancer CNV profiles can be found on Progenetix and more than 
900 diagnostic cancer types. It includes data from hundreds of publications regarding genome profiling. Data from molecular 
cytogenetics (genomic arrays, CGH) as well as sequencing data (WGS or WES) is incorporated. The data that is incorporated 
comes from different external resources like The Cancer Genome Atlas, cBioPortal, NCBI’s Gene Expression Omnibus or EMBL-EBI.

**3.	Describe NCIt, ICD-O, UBERON codes, and their relationships.**

NCIt: NCIt stands for National Cancer Institute Thesaurus. It is an ontology and therefore provides standardized terminology 
for diseases, drugs and other. Each cancer type for example gets a unique code, that looks something like this; NCIT:C43584. 
These codes are hierarchically organized and they are used in Progenetix to have a consistent classification.

ICD-O: This is the International Classification of Disease in Oncology and is used to classify cancer samples. There are 
two codes per cancer, one that describes the cancer type (adenocarcinoma for example) and the other code is for the 
location (colon for example). The challenge is that here we have no ontology and no hierarchical structure.

UBERON: UBERON is a cross-species ontology system, that provides terminology for anatomical structures. This is important 
when we compare data from different sources or species. For example when we want to compare the anatomy of model animals 
and humans.

ICD-O codes are often the first way cancer types are labelled in older datasets.
NCIt adds more detail and structure to this labelling and UBERON helps link the tissue origins from both ICD-O and NCIt, 
making it easier to compare data across species and studies.

**4.	What are CNV segmentations and CNV frequencies, and how to use them?**

I think CNV segmentation means that you see in which region or segment you find copy number variation. For example on 
which chromosome arm. Then you can describe for each segment whether the copy number is normal, higher or lower than 
in a reference genome. When the copy number is the same as in the reference genome, then the CNV frequency would be zero. 
When we have higher copy numbers than in the reference genome, we have duplications in this region and the frequency would 
be higher than zero. When we have lower copy numbers than in the reference genome, we have deletions in this region and 
therefore a frequency lower than zero. The frequency is calculated when you divide the copy number in - for example - a 
cancer genome by the copy number in a “healthy” reference genome. “Frequently duplicated” normally means a CNV frequency 
of above 25% and “frequently deleted” means a CNV frequency of less than -25%. 

This can be used to see which CNVs might be associated with a specific cancer type. And it might help to classify different 
cancer subtypes, which might be susceptible to different treatment options, so this is important in precision medicine.

**5.	What are APIs and how to use APIs in progenetix?**

APIs are Application Programming Interfaces. They let you programmatically access data from genomic databases for example, 
via tools, scripts or pipelines. You say what data you need or want to access and the API enables the data retrieval for 
later data analysis. Progenetix provides this API, so that people can access the data from Progenetix. They for example 
want to have information about copy number variants in breast cancer and the API that Progenetix provides enables the person 
to get this data. 

**6.	How does progenetix visualise CNA profiles?**

They visualise it in a CNV histogram, which shows the CNV frequency for each segment of the genome. The frequency is 
calculated when you divide the copy number in a cancer genome by the copy number in a “healthy” reference genome. 
Negative frequencies are associated with deletions and positive frequencies with gains. All chromosomes are on the 
x-axis and the frequency is on the y-axis. We then see for each chromosome arm (p,q) if there are duplications 
(yellow/orange color) or deletions (blue color) and how frequent they are. For each CNA profile you see how many 
samples were included to calculate the CNV frequencies and create the profile.

**7.	What do you think should be improved in progenetix?**

Progenetix doesn’t provide information about the functional consequences of CNVs. It only tells which CNVs are 
associated with which cancer type. It would be nice to also include some information about the functional consequences 
of CNVs and the associated gene expression. 

They also only focus on CNVs, so only structural variants. They could also include SNP/SNV data for example to create 
cancer profiles, that are based on single base mutations.

Lastly, they could provide API based workflows, that would make the data exploration easier for non-programmers or people that work in diagnostics with little programming experience.
