### Clear R's Brain
rm(list=ls())

### adapted from vignette source 'DNAcopy' ###

### Install package 
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("DNAcopy")
### if prompted with not able to access

### Data Information ###
### We selected a subset of the data set presented in Snijders et al. (2001). 
### We are calling this data set coriell. The data correspond to two array CGH studies of 
### fibroblast cell strains. In particular, we chose the studies GM05296 and GM13330. 
### There is accompanying spectral karyotype data (not included), which can serve as a gold standard. 
### The data can be found at http://www.nature.com/ng/journal/v29/n3/suppinfo/ng754_S1.html

### Load the library
library(DNAcopy)

### Load data
data(coriell)

### What's the type of the object?
### Hint: class()
class(coriell) ## It's a data frame

### What's the dimension of the data frame?
### Hint: dim()
dim(coriell) ## The dimensions are 2271:5

### What information does the table contain?
### Hint: head() and colnames() 
head(coriell)
colnames(coriell) ## Looks like it has the clone name, the chromosome, the position on the chromosome,
                  ## and the values for the two studies.

### So how does the values of the chromosome column look like?
### What are the unique values in the column?
coriell$Chromosome <- as.factor(coriell$Chromosome)
unique(coriell$Chromosome) ### 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23

### How to get a quick estimate of the values/how the values distribute?
summary(coriell)

ggplot(data=coriell, mapping=aes(x=Coriell.05296)) +
  geom_histogram() +
  facet_wrap(~Chromosome) +
  theme_bw()

ggplot(data=coriell, mapping=aes(x=Coriell.13330)) +
  geom_histogram() +
  facet_wrap(~Chromosome) +
  theme_bw()  

ggplot(data=coriell, mapping=aes(x=Position)) +
  geom_histogram() +
  facet_wrap(~Chromosome) +
  theme_bw()

ggplot(data=coriell, mapping=aes(x=Position)) +
  geom_histogram() +
  facet_wrap(~Chromosome) +
  theme_bw()    

### What is the range of the positions? 
range(coriell$Position, na.rm=TRUE) ## 0 - 245000

ranges <- coriell %>%
  group_by(Chromosome) %>%
  summarize(min(Position), max(Position))

### Human genome has about 3 billion basepairs. Check that the "Position" value restarts from 1 for every chromosome?
coriell %>%
  filter(Position==0) ## It restarts from 0, and it doesn't do so for chromosome 13, 14,21 and 22

ggplot(data=coriell, mapping=aes(x=Chromosome, y=Position)) +
         geom_point() +
         theme_bw()

### Ideally we want the probes to be homogeneously distributed in each chromosome, check it for Chromosome 1
coriell %>%
  filter(Chromosome=="1") %>%
  ggplot(mapping=aes(x=Position)) +
  geom_histogram(bins=40) +
  theme_bw() ## Looks quite evenly distributed

### yes this looks more or less similarly probed everywhere in Chromosome 1.

### Columns 5 and 6 are the measured values for two samples: Coriell.05296 and Coriell.13330.
### Check the values: are there NAs?
missing1 <- which(is.na(coriell$Coriell.05296))
length(missing1) ## 159 NAs
missing2 <- which(is.na(coriell$Coriell.13330))
length(missing2) ## 194 NAs

### Create two separate data frames for each sample, named Coriell05296 and Coriell13330
Coriell05296 <- coriell %>%
  select(-Coriell.13330)

Coriell13330 <- coriell %>%
  select(-Coriell.05296)

### change the name of value column to "Value"
colnames(Coriell05296) <- c("Clone", "Chromosome", "Position", "Value")
colnames(Coriell13330) <- c("Clone", "Chromosome", "Position", "Value")

### remove NAs from both data frames
Coriell05296 <- na.omit(Coriell05296)
Coriell13330 <- na.omit(Coriell13330)

### Now what are the values?
summary(Coriell05296)
summary(Coriell13330)

### Copy number (CN) of DNA should be normally 2 (father, mother), or abnormal 0, 1 with CN loss, or 3,4,5... with CN gain
### So what is this value?
### Google the concept "log ratio" for copy number data and calculate converting CN = 1, 2, 3 to log ratio
## Either the binary log of the ratio of relative frequencies or the binary log of the relative risk
log2(1/2)
log2(2/2)
log2(3/2)
log2(4/2)
LogRatio <- function(a){log2(a/2)}

### Plot the line directly on the histogram to see where the values lie.
Coriell05296 %>%
  ggplot(mapping=aes(x=Value)) +
  geom_histogram() +
  geom_vline(aes(xintercept=LogRatio(1), colour="red")) +
  geom_vline(aes(xintercept=LogRatio(2), colour="red")) +
  geom_vline(aes(xintercept=LogRatio(3), colour="red")) +
  theme_bw()

### Do a simple plot of the values on Chromosome 1
### Hint: just use Position as x axis, log ratio value as y axis.
Coriell05296 %>%
  filter(Chromosome=="1") %>%
  ggplot(mapping=aes(x=Position,y=Value)) +
  geom_point() +
  theme_bw()

Coriell13330 %>%
  filter(Chromosome=="1") %>%
  ggplot(mapping=aes(x=Position,y=Value)) +
  geom_point() +
  theme_bw()

### change check_chr from above to check Chromosomes 10 and 11.
Coriell05296 %>%
  filter(Chromosome=="10") %>%
  ggplot(mapping=aes(x=Position,y=Value)) +
  geom_point() +
  theme_bw()

Coriell13330 %>%
  filter(Chromosome=="10") %>%
  ggplot(mapping=aes(x=Position,y=Value)) +
  geom_point() +
  theme_bw()

Coriell05296 %>%
  filter(Chromosome=="11") %>%
  ggplot(mapping=aes(x=Position,y=Value)) +
  geom_point() +
  theme_bw()

Coriell13330 %>%
  filter(Chromosome=="11") %>%
  ggplot(mapping=aes(x=Position,y=Value)) +
  geom_point() +
  theme_bw()

### What do you observe compared to Chr 1?
## Sample 1: chr1 normal, chr10 with additional copy in the middle, chr11 with deletion around 40'000
## Sample 2: chr1 with additional copy after 150'000, chr10 normal,chr11 normal (?, looks slightly shattered)

### It's clear by eye that there should be a region in Chr 10 with CN =3
### How to find start end positions of the region?
### It turns out to be not an easy question.
### Statisticians developed this R library DNAcopy, especially to solve this segmentation problem.
### The method is called "circular binary segmentation", here we just learn how to implement it.

### Create a copy number array data object from the data table Coriell05296
### Hint: Use help() to understand how to use the function CNA().
CNA.df <- CNA(genomdat=Coriell05296$Value, chrom=Coriell05296$Chromosome, maploc=Coriell05296$Position,
              data.type="logratio",presorted=TRUE)

### Smoothen the data by outlier deletion
### Hint: Use help() to understand how to use the function smooth.CNA()
smoothed.CNA.df <- smooth.CNA(CNA.df)

### Segmentation step
### Hint: Use help() to understand how to use the function segment()
segment.CNA.df <- segment(smoothed.CNA.df)

### What do different parameters imply?
## See ?segment()

### Now the segmentation algorithm has finished with our parameter "smooth.region" as 10 and "outlier.SD.scale" as 4.
### What is the segmentation output?
### Hint: type "segment.smoothed.CNA.object$" in the console and hit Tab key to see what prompts.
### Hint: you can also check in the "Environment" window and open the variable "segment.smoothed.CNA.object" to see its content.
## 4 objects: data, output, segRows and call

### What does each column mean?
## data = the original CNA object which was the input for segment()
## output = a data frame with six columns; each row with a segment for which sample id, the chromosome number,
##          the map position of the start of the segment, the map position of the end of the segment, the number
##          of markers in the segment, and the average value in the segment are given
## segRows = a data frame with the start and end of each segment in the data matrix
## call = he call that produced the output object

### do a simple scatter plot with "chrom" as x and "seg.mean" as y
segment.CNA.df$output %>%
  ggplot(mapping=aes(x=chrom, y=seg.mean)) +
  geom_point() +
  theme_bw()

### use table() to check how many segments each chromosome has
segment.number <- segment.CNA.df$output %>%
  group_by(chrom) %>%
  summarize(n())

### change parameters for smoothing and for segmentation and see if the number of segments change
### and check with plot() or table()
### e.g. for smoothing: "smooth.region" as 20 and "outlier.SD.scale" as 8.
### e.g. for segmentation: "undo.splits" as "sdundo", "undo.SD" as 3 and "verbose" as 1
smoothed2.CNA.df <- smooth.CNA(CNA.df, smooth.region=20, outlier.SD.scale=8)
segment2.CNA.df <- segment(smoothed2.CNA.df, undo.splits="sdundo", undo.SD=3, verbose=1)

segment2.CNA.df$output %>%
  ggplot(mapping=aes(x=chrom, y=seg.mean)) +
  geom_point() +
  theme_bw()

segment2.number <- segment2.CNA.df$output %>%
  group_by(chrom) %>%
  summarize(n())

### The DNAcopy library also has some nice plotting tools to easily visualize this segmentation.
### plot probe and segment data by chromosome and positions.
### Hint: Use help() to understand how to use the function plotSample().
plotSample(segment.CNA.df)
plot(segment.CNA.df, plot.type="w")

### plot with separate chromosomes with same method plotSample() but different "plot.type".
plot(segment.CNA.df, plot.type="c")

### plot with x position ordered by segment values with same method plotSample() but different "plot.type".
plot(segment.CNA.df, plot.type="p")
