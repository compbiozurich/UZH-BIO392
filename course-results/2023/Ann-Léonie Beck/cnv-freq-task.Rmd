---
title: "cnv-Freq_task"
author: "Ann-Léonie Beck"
date: "2023-09-27"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Tumor information: Lung Squamous Cell Carcinoma

The NCIt code is C3493
Lung Squamous Cell Carcinoma is a type of non-small cell lung cancer. It affects the central part of the lung or the main airway (left or right bronchus). There exist three subtypes of Lung Squamous Cell Carcinoma, namely: Keratinizing, Non-keratinizing, basaloid.

Risk factors include: smoking, age, family history, exposure to second-hand smoke, mineral and metal particels, or asbestos. Smoking is the main risk factor associated with Lung Squamous Cell Carcinoma. 
30% of non-small cell lung cancer are reported to be Lung Squamous Cell Carcinoma.
Squamous cells are thin and flat, among other organs they coat the airways of the human body. The origin of Lung Squamous Cell Carcinoma is a transformation of the squamous cells of the airways


[Squamou cell Lung cancer](https://www.ncbi.nlm.nih.gov/books/NBK564510/)

# Access the CNV frequency data

## Load library


```{r}
library(pgxRpi)
```

## Access data

```{r}
freq <- pgxLoader(type='frequency', output = 'pgxfreq', filters = "NCIT:C3493")
```

The metadata information is

```{r}
freq$meta
```

The data looks like this

```{r}
freq$data$`NCIT:C3493`[c(1:3),]
```

# Visualization

```{r}
pgxFreqplot(freq)
```

## Chromosom specific plot 

```{r}
pgxFreqplot(freq, chrom = 7)
```


# Analysis

According to the plot, there are frequent duplication on chromosom 1q, 2p, 3q, 5p, 7p, 7q, 8q, 12p, 17q, 19q, 20p, 20q, 22q and frequent deletion on chromosome 1p, 3p, 4p, 4q, 5q, 8p, 9p, 9q, 10p, 10q, 11p, 13q, 16q, 17p, 18q, 19p, 21q with 25% as a cut-off. 

One [study](https://doi.org/10.1002/gcc.22460) detected frequent gains of 1q, 2p, 3q, 5p, 7p, 7q, 8q, 12p, 17q, 19q, 20p, 20q, 22p, 22q and frequent deletion on chromosome 3p, 4p, 4q, 5q, 8p, 9p, 10q, 11p, 13p, 13q, 17p, 21p, 21q.


There are overlaps: 1q, 2p, 3q, 5p, 7p, 7q, 8q, 12p, 17q, 19q, 20p, 20q, 22q for duplication; 3p, 4p, 4q, 5q, 8p, 9p, 10q, 11p, 13q, 17p, 21q for deletion.

Possible differences could be explained by the fact that it was hard to define a cut-off value for the study. 
