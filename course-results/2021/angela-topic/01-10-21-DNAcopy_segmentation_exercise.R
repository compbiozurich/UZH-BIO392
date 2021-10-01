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
library(tidyverse)
library(dplyr)

### Load data
data(coriell)

### What's the type of the object?
### Hint: class()
class(coriell)

### What's the dimension of the data frame?
### Hint: dim()
dim(coriell)

### What information does the table contain?
### Hint: head() and colnames() 
head(coriell)
colnames(coriell)

### So how does the values of the chromosome column look like? Integers 
str(coriell)
### What are the unique values in the column?
unique(coriell$Chromosome)

### How to get a quick estimate of the values/how the values distribute?
summary(coriell)
### What is the range of the positions? 0-245000

### Human genome has about 3 billion basepairs. Check that the "Position" value restarts from 1 for every chromosome?
for (i in 1:24){
  s <- coriell$Position[coriell$Chromosome==i][1]
  print(s)
}
plot(coriell$Position)
### Ideally we want the probes to be homogeneously distributed in each chromosome, check it for Chromosome 1
hist(coriell$Position[coriell$Chromosome==1])
### yes this looks more or less similarly probed everywhere in Chromosome 1.

### Columns 5 and 6 are the measured values for two samples: Coriell.05296 and Coriell.13330.
### Check the values: are there NAs?
colSums(is.na(coriell)) # yes there are

### Create two separate data frames for each sample, named Coriell05296 and Coriell13330
Coriell05296 <- subset(coriell, select = -Coriell.13330)
head(Coriell05296)
Coriell13330 <- subset(coriell, select = -Coriell.05296)
head(Coriell13330)
### change the name of value column to "Value"
names(Coriell05296)[names(Coriell05296) == "Coriell.05296"] <- "Value"
head(Coriell05296)

names(Coriell13330)[names(Coriell13330) == "Coriell.13330"] <- "Value"
head(Coriell13330)

### remove NAs from both data frames
Coriell05296 <- na.omit(Coriell05296)
Coriell13330 <- na.omit(Coriell13330)

### Now what are the values?
hist(Coriell05296$Value)
hist(Coriell13330$Value)
#mostly around 0 +/- 0.2
### Copy number (CN) of DNA should be normally 2 (father, mother), or abnormal 0, 1 with CN loss, or 3,4,5... with CN gain
### So what is this value?

### Google the concept "log ratio" for copy number data and calculate converting CN = 1, 2, 3 to log ratio

### log2(numb of copies / number of refr. copies (normal = 2))
log2(1/2)
log2(2/2)
log2(3/2)

### Plot the line directly on the histogram to see where the values lie.
hist(Coriell05296$Value)
abline(v = log2(1/2), col = "red")
abline(v = log2(2/2), col = "blue")
abline(v = log2(3/2), col = "pink")

hist(Coriell13330$Value)
abline(v = log2(1/2), col = "red")
abline(v = log2(2/2), col = "blue")
abline(v = log2(3/2), col = "pink")
# most of them are around 2 alleles

### Do a simple plot of the values on Chromosome 1

plot(Coriell05296$Position[Coriell05296$Chromosome==1], Coriell05296$Value[Coriell05296$Chromosome==1],
     main = "Coriell05296, Chr1", ylab = "log ratio values", xlab = "Position")
plot(Coriell13330$Position[Coriell13330$Chromosome==1], Coriell13330$Value[Coriell13330$Chromosome==1],
     main = "Coriell13330, Chr1", ylab = "log ratio values", xlab = "Position")
plot_chrom <- function(df,Chr){
  plot(df$Position[df$Chromosome==Chr], df$Value[df$Chromosome==Chr],
       ylab = "log ratio values", xlab = "Position", main = paste(deparse(substitute(df)),"chr",Chr))
}
plot_chrom(Coriell05296,1)
plot_chrom(Coriell13330,1)
### Hint: just use Position as x axis, log ratio value as y axis.
plot_chrom(Coriell05296,10)# more dispersed, especially gain
plot_chrom(Coriell05296,11)# some loss of CN
plot_chrom(Coriell13330,10)# more around 0
plot_chrom(Coriell13330,11)#very spreded
### change check_chr from above to check Chromosomes 10 and 11.

### What do you observe compared to Chr 1?

### It's clear by eye that there should be a region in Chr 10 with CN =3
### How to find start end positions of the region?

### It turns out to be not an easy question.

### Statisticians developed this R library DNAcopy, especially to solve this segmentatino problem.
### The method is called "circular binary segmentation", here we just learn how to implement it.

### Create a ‘copy number array’ data object from the data table Coriell05296
### Hint: Use help() to understand how to use the function CNA().
Coriell05296_ob <-CNA(Coriell05296$Value,Coriell05296$Chromosome,Coriell05296$Position,data.type = "logratio", sampleid = "c05296")
head(Coriell05296_ob)
Coriell13330_ob <-CNA(Coriell13330$Value,Coriell13330$Chromosome,Coriell13330$Position,data.type = "logratio", sampleid = "c13330")
head(Coriell13330_ob)

### Smoothen the data by outlier deletion
### Hint: Use help() to understand how to use the function smooth.CNA()
smoothed.Coriell05296_ob <- smooth.CNA(Coriell05296_ob, smooth.region=10, outlier.SD.scale=4)
smoothed.Coriell13330_ob <- smooth.CNA(Coriell13330_ob, smooth.region=10, outlier.SD.scale=4)

### Segmentation step
### Hint: Use help() to understand how to use the function segment()
segment.smoothed.Coriell05296_ob <- segment(smoothed.Coriell05296_ob)
segment.smoothed.Coriell13330_ob <- segment(smoothed.Coriell13330_ob)
### What does different parameters imply?

### Now the segmentation algorithm has finished with our paramter "smooth.region" as 10 and "outlier.SD.scale" as 4.
### What is the segmentation output?
seg_out_Coriell05296 <- segment.smoothed.Coriell05296_ob$output
head(seg_out_Coriell05296)
seg_out_Coriell13330 <- segment.smoothed.Coriell13330_ob$output
head(seg_out_Coriell13330)
### Hint: type "segment.smoothed.CNA.object$" in the console and hit Tab key to see what prompts.
### Hint: you can also check in the "Environment" window and open the variable "segment.smoothed.CNA.object" to see its content.

### What does each column mean?
# ID, chrom, loc.start/end --> start end of location; num.mark, how many values; seg.mean--> the mean

### do a simple scatter plot with "chrom" as x and "seg.mean" as y
plot(seg_out_Coriell05296$chrom,seg_out_Coriell05296$seg.mean)
plot(seg_out_Coriell13330$chrom,seg_out_Coriell13330$seg.mean)

### use table() to check how many segments each chromosome has
table(seg_out_Coriell05296$chrom)
table(seg_out_Coriell13330$chrom)

### change parameters for smoothing and for segmentation and see if the number of segments change
### and check with plot() or table()
### e.g. for smoothing: "smooth.region" as 20 and "outlier.SD.scale" as 8.
### e.g. for segmentation: "undo.splits" as "sdundo", "undo.SD" as 3 and "verbose" as 1
#smoothed.Coriell05296_ob <- smooth.CNA(Coriell05296_ob, smooth.region=20, outlier.SD.scale=8)
#smoothed.Coriell13330_ob <- smooth.CNA(Coriell13330_ob, smooth.region=20, outlier.SD.scale=8)

#segment.smoothed.Coriell05296_ob <- segment(smoothed.Coriell05296_ob)
#segment.smoothed.Coriell13330_ob <- segment(smoothed.Coriell13330_ob)

#seg_out_Coriell05296 <- segment.smoothed.Coriell05296_ob$output
#head(seg_out_Coriell05296)
#seg_out_Coriell13330 <- segment.smoothed.Coriell13330_ob$output
#head(seg_out_Coriell13330)

#table(seg_out_Coriell05296$chrom)
#table(seg_out_Coriell13330$chrom)
# ###yes some of the segments do change

### The DNAcopy library also has some nice plotting tools to easily visualize this segmentation.
### plot probe and segment data by chromosome and positions.
### Hint: Use help() to understand how to use the function plotSample().
plotSample(segment.smoothed.Coriell05296_ob)
plotSample(segment.smoothed.Coriell13330_ob)
### plot with separate chromosomes with same method plotSample() but different "plot.type".
plot(segment.smoothed.Coriell05296_ob, plot.type= "c")
plot(segment.smoothed.Coriell13330_ob, plot.type= "c")
### plot with x position ordered by segment values with same method plotSample() but different "plot.type".
plot(segment.smoothed.Coriell05296_ob, plot.type= "p")
plot(segment.smoothed.Coriell13330_ob, plot.type= "p")
