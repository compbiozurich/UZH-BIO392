title: "BIO392-cnv-freq"
author: "Sophia"
date: "28.09.2022"
output:
  pdf_document: default
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Step 1: Install package
##already installed


```{r}
#devtools::install_github('progenetix/pgxRpi')
library(pgxRpi)

```

## Step2: Search retinal blastoma (NCIT:C7541)
freq <- pgxLoader(type='frequency', output='pgxseg',filters='NCIT:C7541',
                  codematches=T) #only want this specific cancer so use codematches=T

## Step3: Access the CNV frequency data from samples with 
### The retreived data is an object contaning two slots `meta` and `data`.



  ```{r}
freq$meta
```


```{r}
names(freq$data)

head(freq$data$`NCIT:C7541`)
```
dim(freq$data$`NCIT:C7541`) #dimensions





Dimension of this matrix

```{r}
```

## Step4: Visualize data

### By genome

```{r,fig.width=12,fig.height=6}

pgxFreqplot(freq)
```

### By chromosome

```{r,fig.width=12, fig.height=6}

```

## Step5: Analyse the data

#According the plot, we can see frequenct gains on chromosome 1q, 6p
#and frequenct losses on chromosome 16q


