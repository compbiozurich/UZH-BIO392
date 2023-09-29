---
title: "bio392-cnv.frq"
author: "asievi"
date: "2023-09-27"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Tumor information
Breast Carcinom: 
Breast Carcinoma is the most common Cancer in Women. It can also occur in men 
but it's far more likely in woman. Cancer airises when breast cells start to 
grow abnormally. Aberration leading to activation of oncogens and loss of tumor-suppressors
are thought to be early breast cancer driver. Cells divide more rapildy than healthy cells and do accumulate 
and form an oddly shaped tissue. Because it needs constantly more space, when its 
limited is exceeded it begins to spread (metastasize). Hormonal, lifestyle
and environmental factors may increase your risk of breast cancer.
The likelihood of breast cancer have been identified with an increase in specific 
chromosmal gen mutation. 


The NCIt codes is C9245

## Access the CNV frequency Data
### load library

``` {r}
library(pgxRpi)
```

### Access Data 

```{r}
freq <- pgxLoader( type='frequency',output = 'pgxfreq', filters = "NCIT:C9245")
```
### Metadata information is 

```{r}
freq$meta
```
### The data looks like this

```{r}
freq$data$'NCIT:C9245'[c(1:3),]
```

# Visualisation

```{r}
pgxFreqplot(freq)

```


On the Upperside of the Graph the duplication of specific Chromosoms are shown in orange. \
On the lowerside in blue the is illustrated the loss of DNA on the referred chromosom.

```{r}
pgxFreqplot(freq, chrom=1)
```
\
The impact on the Chromosom 1 seems to be important in case of breast Cancer.
The Strongest alteration 


```{r}
pgxFreqplot(freq, chrom=8)

```

```{r}
pgxFreqplot(freq, chrom=11)

```



# Analysis

According to the plot, there are frequent gains for \
on chromosom 1q, 8q, 16p, 20q amplification \
and frequent deletion on chromosom: 1p, 4pq, 6q, 8p, 9pq, 11q, 13q, 15q, 22q, Xpq \
with a treshold of 25% as cut-off. \
On the Study: \
[Genomic alterations during the in situ to invasive ductal breast carcinoma transition shaped by the immune system][https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8026652/] \
we compare the Alteration between our plot from NCIT thesaurus and the data from the study. \

From the plot: \
1q, 8q, 16p, 20q amplification \
1p, 4pq, 6q, 8p, 9pq, 11q, 13q, 15q, 22q, Xpq \

Study: \
1q, 8q, 17q, 20q amplification \
8p, 11q, 16q, 17p loss \ 

Overlapping arms between Study and our Plot: \
1q, 8q, 20q in amplification \
8p, 11q in loss. \

As a result in both data sets the chromosom 1,8,11,20 are detrimental \
in relation to breast carcinoma. \








