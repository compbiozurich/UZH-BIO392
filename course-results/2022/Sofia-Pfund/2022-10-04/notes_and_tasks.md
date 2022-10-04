* for CGH you don't need samples from living cells: great advantage compared to M-FISH or SKY (check notes-on-notes.md file)!
* FISH has much higher resolution than other techniques
* cCGH 

# Notes on Survival Analysis
## Kaplan-Meier Curve
* method to estimate the survival function
  >To generate a Kaplan–Meier estimator, at least two pieces of data are required for each patient (or each subject): the status at   last observation (event occurrence or right-censored), and the time to event (or time to censoring). If the survival functions between two or more groups are to be compared, then a third piece of data is required: the group assignment of each subject. (from Wikipedia) 
* likelihood of a person to be alive at a given time point 
* two types of events: 
  * death or 
  * censoring event (last time you had data from a specific individual) $\Rightarrow$ indicated with censoring markers (little ticks on the curve)
* towards the end of the curve, the statistics *gets worse* because there are less individuals from which data can be derived from

## Cancer CNVs, Diagnostics and Prognosis
* use Kaplan-Meier curve to compare two groups of individuals
* area between two curves indicates how significant the difference between two groups is

## Cancer Classification and Parameters
**Wanted**: efficiently **label** the disease

Note: CNV patterns are related to the tissue they come from (CNV patterns are **not** random).

### NCIt
* 1 code per cancer
* *example*: `NCIT:C7541`
* advantage:
  * hierarchical system  
### ICD-O 3
* used to encode the *histology* and the *site* of a cancer sample
* *example*: `8140/3` (adenocarcinoma) + `C18.7` (colon)
* downsides:
  * no ontology
  * not a hierarchical system (which is useful for querying...)
### ICD-0 10
* has additional categories compared to ICD-O 3
### ‼️ TNM
* used for *cancer staging* classification
  * T = **t**umor size
  * N = lymph **n**odes 
  * M = **m**etastases
* *example*: `T1N1M0`$\Rightarrow$ small tumor with regional lymph node involvement and no detected distant metastases
* check **slide 14** of the presentation 2022-10-04

# Notes on Progenetix & Beacon
* what is **Beacon**?
  > Beacon is an **API** (sometimes extended with a user interface) that allows for data discovery of genomic and phenoclinic data.
Originally, the Beacon protocol (versions 0 and 1) allowed researchers to get information about the presence/absence of a given, specific, genomic mutation in a set of data, from patients of a given disease or from the population in general.
* use Beacon to check whether a specific variant you are interested in, has been already observed before: Beacon API gives you a **YES or NO answer** to the queried variant
* what is **GA4GH**?
  > The Global Alliance for Genomics and Health (GA4GH) is a policy-framing and technical standards-setting **organization**, seeking to enable responsible genomic data sharing within a human rights framework.
 
$\Rightarrow$ enabling responsible genomic data sharing for the benefit of human health

* **federated** data analysis: you don't have all the data in the same place
* Progenetix supports PUT and GET variant queries from Beacon API + more filters and meta parameters
* Progenetix:
  * implemented over a **document database (mongoDB)** (NOT SQL!)  
