# Tasks Survival analyses | Cancer classifications | Staging

## Familiarize yourself with the different concepts behind different disease clasification systems 
### What are there use, advantages, problems? E.g. ICD-10, ICD-O, NCIt
* ICD-O is not (truly) hierarchical
    * 2 codes per cancer (topography and morphology)
* NCIt is truly hierachical
    * 1 code per cancer
    * empowers "logical OR" queries
    * assignment of code to different groupings allows soft aggregation

#### You can use Progenetix to explore e.g. ontology mapping

## Learn to "read" Kaplan-Meier plots (preparation for explorative analyses later this week). 
The Kaplan-Meier method is a graphical representation of the survival function. It is a non-parametric estimate of the survival function that does not make any assumptions about the underlying distribution of the data. The Kaplan-Meier method is used to estimate the survival function from data that are censored, truncated, or have missing values. It shows the probability that a subject will survive up to time t. The curve is constructed by plotting the survival function against time.    
    
<img width="309" alt="Screen Shot 2022-10-04 at 15 07 05" src="https://user-images.githubusercontent.com/114056296/193827008-1acb5d1c-8f34-4191-9f56-2a6e7dc5ba15.png">


## Achieve a principal understanding of TNM codes & write some "translations"
* T1N1M0: small tumor with regional lymph node involvement and no detected distant metastases
* T2N0M0: big tumor no lymph node involvement and no metastases present
* T3N3M1: tumor of any size near the airway with distant lymph node involvement on the other side of the body and distant metastases detected
* T4N2M1: tumor of any size in the airway with distant lymph node involvement on the same side of the body and distant metastases detected
