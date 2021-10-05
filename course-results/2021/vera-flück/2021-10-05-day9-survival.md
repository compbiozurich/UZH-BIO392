# Survival

## The Kaplan-Meier Method
The Kaplan-Meier Method is the most common method of estimating the survival function. It is a non-parametric method.
The time is divided into small intervals where the intervals are defined by unique times of failure (death in the survival case).
Based on conditional probabilities as we are interested in the probability a subject surviving the next time interval given that they have survived so far.

![image](https://user-images.githubusercontent.com/91005577/136013167-2f01ca1d-ac5b-45aa-bdc9-035ab6093924.png)

## Cancer CNVs - Diagnostics Prognosis

Single-study CNV frequencies correspond to diagnostic subsets.

## Cancer Classifications and Parameters
NCIt - ICD-O/WHO - TNM

### NCIt
Neoplasm Classifications in the NCI Thesaurus

NCIs core reference terminolohy and biomedical ontolohy are collected in the NCI Thesaurus (NCIt)
individual codes for site-specific occurences of "biological" diagnoses.
It is represented by one code per cancer.
* The ontology is truly hierarchical
* The hierarchichal sytstem empowers "logical OR" queries (can be easily searched with the single code)
* terms can have multiple occurences in diagnostic tree
* assignment of code to different groupings allows soft aggregation (e.g. a type of colorectal adenocarcinoma with all colon tumors or with all adenocarcinomas)

### ICD-O3
WHO Interation classification of Diseases for Oncology, 3rd edition (ICD-O-3)
This standard is used in cancer registries for coding the site (topography) and the hsitology (morphology) of neoplasms, usually obtained from a pathology report.
There is a code for the biology (tumor morphology) and clinical (tumor site) information
* The code is widely accepted by pathologists
* limited clinical use (there more ICD-10 or SNOMED)
* Not ontology and not (truly) hierarchichal
* Many entities difficult to remap if using only single code

### TNM
A Classification for clinical cancer stage parameters

* most widely used cancer staging system
* **T** refers to the size and extent of the main tumor
* **N** refers to the number / location of nearby lymph
* **M** refers to wether the cancer has metastasized
* it is not used for leukemias /lymphomas


# TASKS
* Familiarize yourself with the different concepts behind different disease classification systems - what are their use, advantages, problems
  * you can use Progenetix to explore e.g. otnology mapping
* Learn to "read" the Kaplan-Meier plots (preparation for explorative analysis later this week).
* Achieve a principal understanding of TNM codes and write some "translations"
