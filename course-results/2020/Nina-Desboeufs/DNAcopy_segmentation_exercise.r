### adapted from vignette source 'DNAcopy' ###

### Install package 

### if prompted with not able to access

### Data Information ###
### We selected a subset of the data set presented in Snijders et al. (2001). 
### We are calling this data set coriell. The data correspond to two array CGH studies of 
### fibroblast cell strains. In particular, we chose the studies GM05296 and GM13330. 
### There is accompanying spectral karyotype data (not included), which can serve as a gold standard. 
### The data can be found at http://www.nature.com/ng/journal/v29/n3/suppinfo/ng754_S1.html

rm(list = ls())
### Load the library
library(DNAcopy)
library(tidyverse)
library(ggplot2)

### Load data
data(coriell)

### What's the type of the object?
### Hint: class()
class(coriell) 
# df

### What's the dimension of the data frame?
### Hint: dim()
dim(coriell)
# 2271, 5

### What information does the table contain?
### Hint: head() and colnames() 
colnames(coriell)
# "Clone"         "Chromosome"    "Position"      "Coriell.05296" "Coriell.13330"
head(coriell)

### So how does the values of the chromosome column look like?
### What are the unique values in the column?
unique(coriell$Chromosome)
unique(coriell[,2])
# Chromosome number 

### How to get a quick estimate of the values/how the values distribute?
hist(coriell$Chromosome)

### What is the range of the positions? 
min(coriell$Position)
max(coriell$Position)
# min: 0 and max: 245000 or use range()
range(coriell$Position)

### Human genome has about 3 billion basepairs. Check that the "Position" value restarts from 1 for every chromosome?
plot(coriell$Position)

### Ideally we want the probes to be homogeneously distributed in each chromosome, check it for Chromosome 1
hist(coriell$Position[coriell$Chromosome==1])
# Yes more or less similar


### Columns 5 and 6 are the measured values for two samples: Coriell.05296 and Coriell.13330.
### Check the values: are there NAs?
sum(is.na(coriell$Coriell.05296)) # 159 
sum(is.na(coriell$Coriell.13330)) # 194 

### Create two separate data frames for each sample, named Coriell05296 and Coriell13330
### change the name of value column to "Value"
Coriell05296 <- select(coriell, "Clone", "Chromosome", "Position", "Coriell.05296")
Coriell05296 <- rename(Coriell05296, "Value" = "Coriell.05296")
head(Coriell05296)

Coriell13330 <- select(coriell, "Clone", "Chromosome", "Position", "Coriell.13330")
Coriell13330 <- rename(Coriell13330, "Value" = "Coriell.13330")
head(Coriell13330)

### remove NAs from both data frames
Coriell05296 <- Coriell05296[!is.na(Coriell05296[,4]),]
Coriell13330 <- Coriell13330[!is.na(Coriell13330[,4]),]

### Now what are the values?
hist(Coriell05296$Value)
hist(Coriell13330$Value) # normally distributed around 0 

### Copy number (CN) of DNA should be normally 2 (father, mother), or abnormal 0, 1 with CN loss, or 3,4,5... with CN gain
### So what is this value?
### Google the concept "log ratio" for copy number data and calculate converting CN = 1, 2, 3 to log ratio
log2(1/2)
log2(2/2)
log2(3/2)
# "Value" represents the copy number as the log2 of the ratio observed / normal copy number. 

### Plot the line directly on the histogram to see where the values lie.
abline(v=log2(1/2), col = 'red')
abline(v=log2(2/2), col = 'green')
abline(v=log2(3/2), col = 'orange')

### Do a simple plot of the values on Chromosome 1
### Hint: just use Position as x axis, log ratio value as y axis.
# Filter for chromosome 1
Chromosome1_05296 <- Coriell05296 %>%
  group_by(Chromosome) %>%
  filter(Chromosome==1)

Chromosome1_13330 <- Coriell13330 %>%
  group_by(Chromosome) %>%
  filter(Chromosome==1)

ggplot(Chromosome1_05296, aes(x = Position, y = Value)) + 
  geom_point(size = 3) + 
  ggtitle("Chromosome 1, 05296") + 
  theme_bw()

ggplot(Chromosome1_13330, aes(x = Position, y = Value)) + 
  geom_point(size = 3) + 
  ggtitle("Chromosome 1, 13330") + 
  theme_bw()

### change check_chr from above to check Chromosomes 10 and 11.
# For chrosome 10
Chromosome10_05296 <- Coriell05296 %>%
  group_by(Chromosome) %>%
  filter(Chromosome==10)

Chromosome10_13330 <- Coriell13330 %>%
  group_by(Chromosome) %>%
  filter(Chromosome==10)

ggplot(Chromosome10_05296, aes(x = Position, y = Value)) + 
  geom_point(size = 3) + 
  ggtitle("Chromosome 10, 05296") + 
  theme_bw()

ggplot(Chromosome10_13330, aes(x = Position, y = Value)) + 
  geom_point(size = 3) + 
  ggtitle("Chromosome 10, 13330") + 
  theme_bw()

# For chromosome 11
Chromosome11_05296 <- Coriell05296 %>%
  group_by(Chromosome) %>%
  filter(Chromosome==11)

Chromosome11_13330 <- Coriell13330 %>%
  group_by(Chromosome) %>%
  filter(Chromosome==11)

ggplot(Chromosome11_05296, aes(x = Position, y = Value)) + 
  geom_point(size = 3) + 
  ggtitle("Chromosome 11, 05296") + 
  theme_bw()

ggplot(Chromosome11_13330, aes(x = Position, y = Value)) + 
  geom_point(size = 3) + 
  ggtitle("Chromosome 11, 13330") + 
  theme_bw()

### What do you observe compared to Chr 1?
# For Chrosome 10 (05296), we clearly observe a variant (3 CN). 

### It's clear by eye that there should be a region in Chr 10 with CN =3
### How to find start end positions of the region?
### It turns out to be not an easy question.
### Statisticians developed this R library DNAcopy, especially to solve this segmentatino problem.
### The method is called "circular binary segmentation", here we just learn how to implement it.

### Create a ‘copy number array’ data object from the data table Coriell05296
### Hint: Use help() to understand how to use the function CNA().
CNA.object <-  CNA(Coriell05296$Value,
            Coriell05296$Chromosome,
            Coriell05296$Position,
            data.type="logratio",sampleid="c05296")


### Smoothen the data by outlier deletion
### Hint: Use help() to understand how to use the function smooth.CNA()
smoothed.CNA.object <- smooth.CNA(CNA.object)

### Segmentation step
### Hint: Use help() to understand how to use the function segment()
### What does different parameters imply?
segment.smoothed.CNA.object <- segment(smoothed.CNA.object, verbose=1)
# verbose = 1 for print the current sample, = 2 , the chr, 3 the segment. 
segment.smoothed.CNA.object

### Now the segmentation algorithm has finished with our paramter "smooth.region" as 10 and "outlier.SD.scale" as 4.
### What is the segmentation output?
### Hint: type "segment.smoothed.CNA.object$" in the console and hit Tab key to see what prompts.
### Hint: you can also check in the "Environment" window and open the variable "segment.smoothed.CNA.object" to see its content.
seg_out <- segment.smoothed.CNA.object$output
head(seg_out)

### What does each column mean?
# ID = sample ID, Chrom = chromosome, loc.start = start (position) of the segment, 
# loc.end = end of the segment, num.mark = the number of markers in the segment, 
# seg.mean = the average value in the segment 

### do a simple scatter plot with "chrom" as x and "seg.mean" as y
ggplot(seg_out, aes(x = chrom, y = seg.mean)) + 
  geom_point(size = 2) + 
  theme_bw()

### use table() to check how many segments each chromosome has
table(seg_out$chrom)

nrow(seg_out)
# From total of 2112 probes, segmentation reduces into 31 regions where values differ.

### change parameters for smoothing and for segmentation and see if the number of segments change
### and check with plot() or table()
### e.g. for smoothing: "smooth.region" as 20 and "outlier.SD.scale" as 8.
### e.g. for segmentation: "undo.splits" as "sdundo", "undo.SD" as 3 and "verbose" as 1
smoothed.CNA.object1 <- smooth.CNA(CNA.object, smooth.region=20, outlier.SD.scale=8)
segment.smoothed.CNA.object1 <- segment(smoothed.CNA.object, 
                                       undo.splits="sdundo",  # tolerate more noise 
                                       undo.SD=3,verbose=1)
seg_out1 <- seg_out <- segment.smoothed.CNA.object1$output
table(seg_out1$chrom)
nrow(seg_out1)
# 27 segments and different table 


### The DNAcopy library also has some nice plotting tools to easily visualize this segmentation.
### plot probe and segment data by chromosome and positions.
### Hint: Use help() to understand how to use the function plotSample().
plotSample(segment.smoothed.CNA.object)
# or (because we just have one sample)
plot(segment.smoothed.CNA.object, plot.type="w")

### plot with separate chromosomes with same method plotSample() but different "plot.type".
plotSample(segment.smoothed.CNA.object, chromlist = c(1,10,11))  # (just with the third first chr)
# or (because we just have one sample)
plot(segment.smoothed.CNA.object, plot.type="c")

### plot with x position ordered by segment values with same method plotSample() but different "plot.type".
# plotSample(segment.smoothed.CNA.object, xmaploc = TRUE) 
# or (because we just have one sample)
plot(segment.smoothed.CNA.object, plot.type="p")
# See if noises has been detected 



