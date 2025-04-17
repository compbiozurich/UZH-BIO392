# Exercise CNVs with a progenetix file

I'd like to study Glioblastoma.
#### What is Glioblastoma?

Glioblastoma is a fast-growing and highly malignant brain tumor. It belongs to a broader group of brain tumors called gliomas, which come from the brain’s supportive glial cells.

Tumors are graded by the WHO based on how aggressive they are:

-Grade I: Benign, slow-growing, with a good prognosis
-Grade II: Low-grade but likely to recur
-Grade III: Malignant
-Grade IV: Very malignant, fast-growing, and with a poor prognosis (e.g., glioblastoma)

There are different types of Glioblastomas, like: 

-Astrocytomas: Arise from star-shaped glial cells and occur across all grades.
-Glioblastomas: A highly malignant astrocytoma (WHO grade IV).
-Oligodendrogliomas: Originate from oligodendrocytes and occur in various grades.
-Ependymomas: Develop from cells lining the brain’s ventricles.

Glioblastoma is relatively rare. In Switzerland, about 3 in 100,000 people are diagnosed every year. It is more common in men and mostly occurs between the ages of 50 and 70. The known risk factors are limited and include childhood brain radiation and very rare genetic syndromes, though most patients have no real identifiable risk.

Symptoms depend on where the tumor is located in the brain. They can include:

-Headaches, nausea, or dizziness
-Seizures, especially first-time seizures in adults
-Cognitive issues like forgetfulness or confusion
-Neurological problems such as weakness, numbness, vision or speech issues, or -coordination difficulties
-Changes in mood, personality, or behavior
-Because glioblastomas grow quickly, symptoms tend to appear suddenly and should prompt -medical evaluation.

source: [USZ] (https://www.usz.ch/en/disease/glioblastoma/)
### Lets start to code

Clear R's brain
```{r}
rm(list = ls())
```

Install packages
```{r eval = FALSE}
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.20")

BiocManager::install(c("pgxRpi", "GenomicRanges"))
```
Load Packages
```{r}
library(pgxRpi)
library(GenomicRanges)
```

My Glioblastoma data is on the [progenetic website] (https://progenetix.org/subset/?id=NCIT:C3058&datasetIds=progenetix).
The NCIt code is "NCIT:C3058". 

Access CNV frequency data from samples with Glioblastoma adn store results in variable
```{r}
freq<- pgxLoader(type="cnv_frequency",filters="NCIT:C3058")
freq
```

To access the CNV frequency data form this object
```{r}
freq[["NCIT:C3058"]]
```

To get the metadata, use 'mcols' funciton: 
```{r}
mcols(freq)
```
Visualize the frequency data
```{r, fig.width=12, fig.height=6}
pgxFreqplot(freq)
```
Output: 
![image](https://github.com/user-attachments/assets/1c3a590f-0b86-4384-be97-23fb6c4b3f7b)

Too look at individual chromosomes
```{r}
pgxFreqplot(freq, chrom = c(7, 9, 10, 13, 19 ,20, 22), layout = c(2,1))
```
Output: 
![image](https://github.com/user-attachments/assets/0e05f227-a18d-4c4e-9d3d-e9bc9e3e1c39)
![image](https://github.com/user-attachments/assets/86bd46c6-0170-4cb6-8b9f-5517df9cc9a8)
![image](https://github.com/user-attachments/assets/5a1076f3-80c0-4ee7-8bd4-a0a43f266298)
![image](https://github.com/user-attachments/assets/9cd60c20-caa9-4fc7-99cd-444ec0a2042b)
#### Analysis
According to the plot, using a threshold 25% for duplication and deletion, 
7q, 7p, 19q, 19p, 20q and 20p are frequently duplicated. 9p, 10q, 10p, 13q and 22 q are frequently deleted. However, the changes in chromosome 13, 19, 20 and 22 are only very lightly above the threshhold of 25%. 

When looking at the literature, I also found that the most common chromosomal aberrations detected were gain of chromosome 7 and loss of chromosomes 9p and 10q. So all the high level abberations I found, where also found in the literature. 

source: Hui, AY., Lo, KW., Yin, XL. et al. Detection of Multiple Gene Amplifications in Glioblastoma Multiforme Using Array-Based Comparative Genomic Hybridization. Lab Invest 81, 717–723 (2001). https://doi.org/10.1038/labinvest.3780280
