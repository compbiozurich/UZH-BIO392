# Survival analyses, Cancer classifications, Staging

## The Kaplan-Meier Method
* Most common method  to estimate survival fraction
* Time is divided into intervals, at each interval the number of "observed" individuals in the group is measured --> Probabilistic Model to predict the future
* The probability for each time interval is calculated. If an event occurs, all the probabilities are calculated again
* Censoring markers indicate when an event occured that changed the probabilistic calculations

## Cancer Classifications & Parameters

ICD-10:
* Pros: Hierarchical. More clinical use than ICD-O.
* Cons: Not specialisied for oncology (wider use, includes also other diseases).

ICD-O: 
Used in cancer registries for coding the site (topography) and the histology (morphology) of neoplasms, usually obtained from a pathology report -> 2 codes per cancer. Mix of "biology" (i.e. tumor morphology) and "clinical" (i.e. tumor site).
* Pros: Widely accepeted by pathologists. Many entities are easier to remap if using two codes.
* Cons: Limited clinial use (better use ICD-10). No ontology & no real hierarchy).

NCIt: 
Only 1 code per cancer (individual codes for site-specific occurrences of "biological" diagnoses). NCI's core referece terminology and biomedical ontology are collected in the NCI Thesaurus (NCIt).
* Pros: Truly hierarchical ontology -> empowers "logical OR" queries. Soft aggregation possible due to assignment of code to different groupings (e.g. a type of colorectal adenocarcinoma with all colon tumors or with all adenocarcinomas)
* Cons: Terms can have multiple occurrences in diagnostic tree. Many entities are difficult to remap if using only single code.
