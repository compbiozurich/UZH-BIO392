# Task 2: Survival analyses, cancer classifications, staging

#### 1. Familiarize yourself with the different concepts behind different disease classification systems - what are there use, advantages, problems? E.g. ICD-10, ICD-O, NCIt (you can use Progenetix to explore e.g. ontology mapping)
* ICD-10:
  * Pros: Hierarchical. More clinical use than ICD-O.
  * Cons: Not specialisied for oncology (wider use, includes also other diseases).
* ICD-O: Used in cancer registries for coding the site (topography) and the histology (morphology) of neoplasms, usually obtained from a pathology report -> 2 codes per cancer. Mix of "biology" (i.e. tumor morphology) and "clinical" (i.e. tumor site).
  * Pros: Widely accepeted by pathologists. Many entities are easier to remap if using two codes.
  * Cons: Limited clinial use (better use ICD-10). No ontology & no real hierarchy).
* NCIt: Only 1 code per cancer (individual codes for site-specific occurrences of "biological" diagnoses). NCI's core referece terminology and biomedical ontology are collected in the NCI Thesaurus (NCIt).
  * Pros: Truly hierarchical ontology -> empowers "logical OR" queries. Soft aggregation possible due to assignment of code to different groupings (e.g. a type of colorectal adenocarcinoma with all colon tumors or with all adenocarcinomas)
  * Cons: Terms can have multiple occurrences in diagnostic tree. Many entities are difficult to remap if using only single code.


#### 2. Learn to "read" Kaplan-Meier plots (preparation for explorative analyses later this week).
* Estimating survival function.
* Non-parametric method.
* Divides time into small intervals where the intervals aer defined by the unique times of failure (death).
* We want to know the probability of a subject surviving the next time interval given that they have survived so far (based on conditional probabilities).
* Late entry can also be dealt with.
* Censored: Individual is not part of the study anymore but for reasons other than failure (death), for example withdrawing from the study.
* Example:
  * We have N=50: probability for a subject surviving = (1-1/50).
  * After some time, an individual dies. New probablity for a subject surviving = (1-1/49).
  * After some time, another individual dies. But in the mean time, also one individual was censored. New probability for a subject surviving = (1-1/47).
  * The probability of a subject surviving sinks with N.


#### 3. Achieve a principal understanding of TNM codes & write some "translations" (T1N1M0: small tumor with regional lymph node involvement and no detected distant metastases)
T: size and extent of the main tumor
* T1: tumor < 3cm
* T2: tumor > 3cm
* T3: tumor can be any size, but near the airway or has spread to local areas such as the chest wall or diaphragm
* T4: tumor can be any size, but is located in the airway, or has invaded local structures such as the heart or the esophagus

N: number / location of nearby lymph nodes that have cancer infiltration
* N0: no lymph nodes are affected
* N1: tumor has spread to nearby nodes on the same side of the body
* N2: tumor has spread to nodes further away but on the same side of the body
* N3: cancer cells are present in lymph nodes on the other side of the chest from the tumor, or in nodes near the collarbone or neck muscles

M: whether the cancer has metastasized
* M0: no metastases are present
* M1: tumor has spread (metastasized) to other regions of the body or the other lung

Examples:
* T3N2M1: small tumor in the chest with infected nodes further away (but on the same side if the body) and detected metastases.
* T2N3M1: big tumor with infected nodes in the collarbone and detected metastases.
