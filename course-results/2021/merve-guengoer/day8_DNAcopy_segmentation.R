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
head(coriell)

### What's the type of the object? -> data.frame
### Hint: class()
class(coriell)

### What's the dimension of the data frame? -> 5 variables, 2271 data points 
### Hint: dim()
dim(coriell)

### What information does the table contain? -> "Clone","Chromosome","Position","Coriell.05296","Coriell.13330"
### Hint: head() and colnames() 
head(coriell)
colnames(coriell)

### So how does the values of the chromosome column look like? -> integer
### What are the unique values in the column? -> 1-23
unique(coriell$Chromosome)

### How to get a quick estimate of the values/how the values distribute?
hist(coriell$Chromosome, breaks= 0:23)

### What is the range of the positions? -> 0 - 245000
range(coriell$Position)

### Human genome has about 3 billion basepairs. Check that the "Position" value restarts from 1 for every chromosome?
plot(coriell$Position)

### Ideally we want the probes to be homogeneously distributed in each chromosome, check it for Chromosome 1
hist(coriell$Position[coriell$Chromosome==1])

### yes this looks more or less similarly probed everywhere in Chromosome 1.

### Columns 5 and 6 are the measured values for two samples: Coriell.05296 and Coriell.13330.
### Check the values: are there NAs? -> yes, in both
sum(is.na(coriell$Coriell.05296))
sum(is.na(coriell$Coriell.13330))

### Create two separate data frames for each sample, named Coriell05296 and Coriell13330
coriell05296 <- cbind(coriell[,c(1,2,3,4)])
coriell13330 <- cbind(coriell[,c(1,2,3,5)])

### change the name of value column to "Value"
colnames(coriell05296)[4] <- 'value'
colnames(coriell13330)[4] <- 'value'

head(coriell05296)
head(coriell13330)

### remove NAs from both data frames
coriell05296 <- na.omit(coriell05296)
coriell13330 <- na.omit(coriell13330)

### Now what are the values? -> Most values are centered around 0 and mostly within +/-0.2
hist(coriell05296$value)
hist(coriell13330$value)

### Copy number (CN) of DNA should be normally 2 (father, mother), or abnormal 0, 1 with CN loss, or 3,4,5... with CN gain
### So what is this value?
### Google the concept "log ratio" for copy number data and calculate converting CN = 1, 2, 3 to log ratio
log2(1/2)
log2(2/2)
log2(3/2)
#### => It's the base 2 log of the ratio between the sample copy number and reference copy number (2)


### Plot the line directly on the histogram to see where the values lie.
abline(v=log2(1/2), col = 'red')
abline(v=log2(2/2), col = 'red')
abline(v=log2(3/2), col = 'red')
#### => There's noise around the peak area but we see clearly, for most parts, values are at 0 (CN =2)


### Do a simple plot of the values on Chromosome 1
### Hint: just use Position as x axis, log ratio value as y axis.

x=coriell05296$Position[coriell05296$Chromosome==1]
y=coriell05296$value[coriell05296$Chromosome==1]
plot(x,y, xlab='Position', ylab='LogRatio')


x=coriell13330$Position[coriell13330$Chromosome==1]
y=coriell13330$value[coriell13330$Chromosome==1]
plot(x,y, xlab='Position', ylab='LogRatio')



### change check_chr from above to check Chromosomes 10 and 11.
x=coriell05296$Position[coriell05296$Chromosome==10]
y=coriell05296$value[coriell05296$Chromosome==10]
plot(x,y, xlab='Position', ylab='LogRatio')

### What do you observe compared to Chr 1?

### It's clear by eye that there should be a region in Chr 10 with CN =3
### How to find start end positions of the region?
### It turns out to be not an easy question.
### Statisticians developed this R library DNAcopy, especially to solve this segmentatino problem.
### The method is called "circular binary segmentation", here we just learn how to implement it.

### Create a âcopy number arrayâ data object from the data table Coriell05296
### Hint: Use help() to understand how to use the function CNA().
help(CNA)

CNA_object <- CNA(coriell05296$value,
                  coriell05296$Chromosome,coriell05296$Position,
                  data.type="logratio",sampleid="c05296")
CNA_object

### Smoothen the data by outlier deletion
### Hint: Use help() to understand how to use the function smooth.CNA()
help(smooth.CNA)
smoothed.CNA_object <- smooth.CNA(CNA_object, smooth.region=10, outlier.SD.scale=4)


### Segmentation step
### Hint: Use help() to understand how to use the function segment()
### What does different parameters imply?
help(segment)
segmented.CNA_obejct <- segment(smoothed.CNA_object, undo.splits = 'none', verbose=1)

### Now the segmentation algorithm has finished with our paramter "smooth.region" as 10 and "outlier.SD.scale" as 4.
### What is the segmentation output?
### Hint: type "segment.smoothed.CNA.object$" in the console and hit Tab key to see what prompts.
### Hint: you can also check in the "Environment" window and open the variable "segment.smoothed.CNA.object" to see its content.
seg_out = segmented.CNA_obejct$output
head(seg_out)


### What does each column mean?
nrow(seg_out)
#### => "num.mark" is number of probes contained by the segment
#### => From total of 2112 probes, segmentation reduces into 31 regions where values differ.


### do a simple scatter plot with "chrom" as x and "seg.mean" as y
plot(seg_out$chrom, seg_out$seg.mean)

### use table() to check how many segments each chromosome has
table(seg_out$chrom)

### change parameters for smoothing and for segmentation and see if the number of segments change
### and check with plot() or table()
### e.g. for smoothing: "smooth.region" as 20 and "outlier.SD.scale" as 8.
### e.g. for segmentation: "undo.splits" as "sdundo", "undo.SD" as 3 and "verbose" as 1
smoothed.CNA_object <- smooth.CNA(CNA_object, smooth.region=20, outlier.SD.scale=8)
segment.CNA_object <- segment(smoothed.CNA_object, verbose=1)
seg_out <- segment.CNA_object$output
nrow(seg_out)
table(seg_out$chrom)


smoothed.CNA_object <- smooth.CNA(CNA_object, smooth.region=10, outlier.SD.scale=4)
segment.CNA_object <- segment(smoothed.CNA_object, 
                                       undo.splits="sdundo", 
                                       undo.SD=3,verbose=1)
seg_out <- segment.CNA_object$output
nrow(seg_out)
table(seg_out$chrom)

### The DNAcopy library also has some nice plotting tools to easily visualize this segmentation.
### plot probe and segment data by chromosome and positions.
### Hint: Use help() to understand how to use the function plotSample().
plot(segment.CNA_object, plot.type="w")

### plot with separate chromosomes with same method plotSample() but different "plot.type".
plot(segment.CNA_object, plot.type="c") 

### plot with x position ordered by segment values with same method plotSample() but different "plot.type".
plot(segment.CNA_object, plot.type="p")
