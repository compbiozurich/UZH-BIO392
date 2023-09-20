## Paper Reading Day 2

### What is CNV/CNA?
CNA stands for 'Copy Number Aberations'. These are nearly ubiquitous and often extensive structural genome variations (CNVs). They are present in the majoirty of cancer types and are crucial in cancer development. The analysis of these CNAs seems to be of great importance at the moment of understanding the molecular mechanisms of tumorigenisis. 

### How will you descrive or introduce progenetix (scale, data source, cancer types and so on)?
Progenetix is a resource for cancer genome data that provides sample-specific CNA profiles for 138 663 samples, most of these being cancer samples, and tools for annotation, analysis and visualization. Among the cancer types with the most data stored in this database are cancers of the hematopoietic and reticuloendothelial systems, breast cancers, lung cancers and brain cancers.

From the beginning of the database, more and more updates from various sources like TCGA or cBioPortal have lead to the extension of Progenetix. Most data in this resource is from array-based experiments

### Describe NCIt, ICOD, UBERON codes and their relationships.
ICOD stands for 'International Classification of Diseases in Oncology' and was how Progenetics first started classificating their cancer samples. This system, however, lacks representativity when it comes to hierarchical concepts. 

NCIt is a hierarchical ontology, providing organ-specific mapping and allowing layered data aggregation and transfer between classifciation systems and resources. Due to its recent development, these are currently rarely used, however. The newest Progenetix update has started to generate ICOD - NCIt mappings. 

Meanwhile, UBERON is a cross-species strucutral ontology system. This resource allows for queries across multiple databases and organisms in a more efficient way than ICOD does. 

### What are CNV segmentations and CNV frequencies, and how to use them?
CNV frequencies are the frequency of regional copy number gains and losses when comparing all samples of a cancer type. These can be used to analyze which mutations and alterations of the genome might be crucial in tumorogenisis.

CNV segmentations are the segments where these CNV are present. Analyzing these segments, where they take place and what they code for can help us understand how a specific type of cancer is caused and even lead to the development of a cure.

### What are APIs and how to use APIs in progenetix?
Application programming interfaces (APIs) serve as an intermediary between different programms. In Progenetix the interface has a variety of options to search and filter the databases, like start and end position of CNAs, cancertype and location. The panel shows a summary of number of matches and variants and CNA frequencies. The results of the query can be returned in a document. The panel also provides CNA percentage of samples sorted by CN gain and loss, a list of subsets as defined by ICOD and NCIt oncoloy codes and a world map with the geographical information of the samples. Further details can be downloaded or data can be uploaded to the database. 

### How does progenetix visualise CNA profiles?
There are various posibilities for the user to visualize the data available in the database in a personalized way. One of these is the genomic region of the observed variant and its position in the chromosome. 

### What do you think should be improved in progenetix?
As stated in the conclusion of the article, the continuous expansion of the database is crucial for its usage in the quickly evolving field that is biology. Methods to easily add data and quickly control the correctness of said data should be implemented. Large amounts of samples are necessary for trustworthy results. 

#### Sources:
https://progenetix.org
https://academic.oup.com/database/article/doi/10.1093/database/baab043/6323245
