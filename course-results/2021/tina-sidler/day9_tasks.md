# Task 2: Survival analyses, cancer classifications, staging

#### 1. Familiarize yourself with the different concepts behind different disease classification systems - what are there use, advantages, problems? E.g. ICD-10, ICD-O, NCIt (you can use Progenetix to explore e.g. ontology mapping)
* ICD-10: Hierarchical. More clinical use than ICD-0. Not specialisied for oncology (wider use, includes also other diseases.
* ICD-0: Used in cancer registries for coding the site (topography) and the histology (morphology) of neoplasms, usually obtained from a pathology report -> 2 codes per cancer. Mix of "biology" (i.e. tumor morphology) and "clinical" (i.e. tumor site). Widely accepted pathologists. Limited clinial use (better use ICD-10). No ontology & no real hierarchy). Many entities are difficult to remap if using only single code.
* NCIt: Only 1 code per cancer (individual codes for site-specific occurrences of "biological" diagnoses. NCI's core referece terminology and biomedical ontology are collected in the NCI Thesaurus (NCIt). Truly hierarchical ontology -> empowers "logical OR" queries. Terms can have multiple occurrences in diagnostic tree. Soft aggregation possible due to assignment of code to different groupings (e.g. a type of colorectal adenocarcinoma with all colon tumors or with all adenocarcinomas)


#### 2. Learn to "read" Kaplan-Meier plots (preparation for explorative analyses later this week).
* Estimating survival function.
* Non-parametric method.
* Divides time into small intervals where the intervals aer defined by the unique times of failure (death).
* We want to know the probability of a subject surviving the next time interval given that they have survived so far (based on conditional probabilities).
* Late entry can also be dealt with.
* Censored: Individual is not part of the study anymore but for reasons other than failure (death), for example withdrawing from the study.
  * Example: we have N=50: probability for a subject surviving = (1-1/50).
  * After some time, an individual dies. New probablity for a subject surviving = (1-1/49).
  * After some time, another individual dies. But in the mean time, also one individual was censored. New probability for a subject surviving = (1-1/47).
  * The probability of a subject surviving sinks with N.


#### 3. Achieve a principal understanding of TNM codes & write some "translations" (T1N1M0: small tumor with regional lymph node involvement and no detected distant metastases)
T: size and extent of the main tumor
