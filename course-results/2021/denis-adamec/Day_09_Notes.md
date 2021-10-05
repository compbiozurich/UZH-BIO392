## Day 9 - Survival | Classifications

### The Kaplan-Meier Method

* Most commen method to estimate survival fraction
* Time is divided into intervals, at each interval the number of "observed" individuals in the group is measured --> Probabilistic Model to predict the future
* The probability for each time interval is calculated. If an event occurs, all the probabilities are calculated again
* Censoring markers indicate when an event occured that changed the probabilistic calculations
* 


### Cancer Classifications & Parameters

#### ICD-O 3

* Diseases have to be classified in specific formats
* Mix of biology - tumor morphology - and clinical - tumor site
* 2 codes per cancer: 8140/3   C18.7
* first code describes tumor morphology (8140/3), second code describes sigmiod colon (C18.7)
* Unfortunately no ontology & not truly hierarchical
* 


#### NCIt

* One code per cancer
* Nice hierarchical ontology
* Group queries with logical "OR" conditions are possible


#### TNM

* Most widespread cancer staging system
* T = Size & Extent of main Tumor
* N = Number/Location of nearby lymph nodes that have cancer infiltration
* M = Metastized Yes/No
* X = we don't know
* T2NXMX = only T is known
* Not used for leukemias & lymphomas
* 
