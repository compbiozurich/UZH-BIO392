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
rm(list=ls())
library(DNAcopy)

### Load data
data(coriell)

### What's the type of the object?
### Hint: class()
# df
class(coriell)

### What's the dimension of the data frame?
### Hint: dim()
dim(coriell)
### What information does the table contain?
### Hint: head() and colnames() 
head(coriell)
colnames(coriell) 

### So how do the values of the chromosome column look like?
summary(coriell)
# range:  -1.34758, 1.08274 both columns contain NA's

### What are the unique values in the column?
length(unique(coriell$Coriell.05296))
length(unique(coriell$Coriell.13330))
# most of the values are unique


### How to get a quick estimate of the values/how the values distribute?
hist(coriell$Coriell.05296)
hist(coriell$Coriell.13330)
### What is the range of the positions? compare above

### Human genome has about 3 billion basepairs. Check that the "Position" value
### restarts from 1 for every chromosome?
pos <- numeric(23)
chromo <- 1
for (i in 1:dim(coriell)[1]){
  if (coriell$Chromosome[i] != chromo){
    pos[chromo] <- coriell[i,3]
    chromo <- chromo + 1
  }
}
# they start with new numbers but not always with 0 as not every position is covered

### Ideally we want the probes to be homogeneously distributed in each 
# chromosome, check it for Chromosome 1
hist(coriell[coriell$Chromosome == 1,]$Position)

### yes this looks more or less similarly probed everywhere in Chromosome 1.

### Columns 5 and 6 are the measured values for two samples: Coriell.05296 and Coriell.13330.
### Check the values: are there NAs?
# yes see above

### Create two separate data frames for each sample, named Coriell05296 and Coriell13330
### change the name of value column to "Value"
Coriell.05296 <- data.frame(coriell[-5])
colnames(Coriell.05296)[4] <- "Value"

Coriell.13330 <- data.frame(coriell[-4])
colnames(Coriell.13330)[4] <- "Value"
### remove NAs from both data frames
na.omit(Coriell.05296)
na.omit(Coriell.13330)

### Now what are the values?

### Copy number (CN) of DNA should be normally 2 (father, mother), 
### or abnormal 0, 1 with CN loss, or 3,4,5... with CN gain
### So what is this value?
### Google the concept "log ratio" for copy number data and calculate 
### converting CN = 1, 2, 3 to log ratio
log2(1/2)
log2(2/2)
log2(3/2)

### Plot the line directly on the histogram to see where the values lie.

hist(Coriell.13330$Value, xlim = c(-1, 1))
abline(v=c(-1, 0, 1), col=c(1,2,3))

hist(Coriell.05296$Value, xlim = c(-1, 1))
abline(v=c(-1, 0, 1), col=c(1,2,3))

### Do a simple plot of the values on Chromosome 1
### Hint: just use Position as x axis, log ratio value as y axis.
check_CV <- function(chr, dat){
  chrom <- dat[dat$Chromosome == chr,]
  
  plot(chrom$Position, chrom$Value, ylim = c(-1, 1))
  abline(h=c(log(2/2), log(2), log(3), log(4)), col=c(1,2,3,4))
}
# looking  at the log(ratio between the two parental derived genes)

check_CV(1, Coriell.13330)
check_CV(1, Coriell.05296)

### change check_chr from above to check Chromosomes 10 and 11.
check_CV(10, Coriell.13330)
check_CV(10, Coriell.05296)


check_CV(11, Coriell.13330)
check_CV(11, Coriell.05296)

### What do you observe compared to Chr 1?

### It's clear by eye that there should be a region in Chr 10 with CN =3
### How to find start end positions of the region?
### It turns out to be not an easy question.
### Statisticians developed this R library DNAcopy, especially to solve this segmentatino problem.
### The method is called "circular binary segmentation", here we just learn how to implement it.

### Create a ‘copy number array’ data object from the data table Coriell05296
### Hint: Use help() to understand how to use the function CNA().
help(CNA)
Coriell.05296_CNA <- CNA(genomdat = Coriell.05296$Value,
                         chrom = Coriell.05296$Chromosome,
                         maploc = Coriell.05296$Position)
Coriell.13330_CNA <- CNA(genomdat = Coriell.13330$Value,
                         chrom = Coriell.13330$Chromosome,
                         maploc = Coriell.13330$Position)
### Smoothen the data by outlier deletion
### Hint: Use help() to understand how to use the function smooth.CNA()
?smooth.CNA()
smooth_05 <- smooth.CNA(Coriell.05296_CNA)
smooth_13 <- smooth.CNA(Coriell.13330_CNA)
### Segmentation step
### Hint: Use help() to understand how to use the function segment()
### What does different parameters imply?
?segment()
segment_05 <- segment(smooth_05)
segment_13 <- segment(smooth_13)
class(segment_05)
# a DNAcopy object

### Now the segmentation algorithm has finished with our paramter "smooth.region" 
## as 10 and "outlier.SD.scale" as 4.
### What is the segmentation output?
### Hint: type "segment.smoothed.CNA.object$" in the console and hit Tab key to 
# see what prompts.
### Hint: you can also check in the "Environment" window and open the variable 
# "segment.smoothed.CNA.object" to see its content.

### What does each column mean?
# data: our initial data we gave to the CNA function
# output: the for us now relevant segmentation
out <- segment_05$output
head(out)
# "num.mark": number of probes contained by the segment
nrow(out)
# From total of 2112 probes, segmentation reduces into 31 regions where values differ.

### do a simple scatter plot with "chrom" as x and "seg.mean" as y

plot(out$chrom, out$seg.mean)
### use table() to check how many segments each chromosome has
table(out$chrom)

### change parameters for smoothing and for segmentation and see if the number of segments change
### and check with plot() or table()
### e.g. for smoothing: "smooth.region" as 20 and "outlier.SD.scale" as 8.
### e.g. for segmentation: "undo.splits" as "sdundo", "undo.SD" as 3 and "verbose" as 1

# not done 
#### With a more stringent cutoff, number of segments decreases.

### The DNAcopy library also has some nice plotting tools to easily visualize this segmentation.
### plot probe and segment data by chromosome and positions.
### Hint: Use help() to understand how to use the function plotSample().

plot(segment_05, plot.type="w")
#### The red lines correspond to mean values in segments. 
#### Note that the points are in alternate colors to indicate different chromosomes.


### plot with separate chromosomes with same method plotSample() but different "plot.type".
plot(segment_05, plot.type="c") 

### plot with x position ordered by segment values with same method plotSample() but different "plot.type".
plot(segment_05, plot.type="p")
