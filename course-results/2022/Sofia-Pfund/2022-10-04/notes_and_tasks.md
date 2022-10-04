* for CGH you don't need samples from living cells: great advantage compared to M-FISH or SKY (check notes-on-notes.md file)!
* FISH has much higher resolution than other techniques
* cCGH 

# Notes on Survival Analysis
## Kaplan-Meier Curve
* method to estimate the survival function
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
*
