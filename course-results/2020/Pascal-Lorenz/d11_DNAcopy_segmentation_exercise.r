### adapted from vignette source 'DNAcopy' ###

### Install package 
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
### data frame

### What's the dimension of the data frame?
### Hint: dim()
### 2271x5

### What information does the table contain?
### Hint: head() and colnames() 
### Clone Chromosome Position Coriell.05296 Coriell.13330

### So how does the values of the chromosome column look like?
### What are the unique values in the column?
unique(coriell[,2])
### 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23

### How to get a quick estimate of the values/how the values distribute?
hist(coriell[,2])

### What is the range of the positions? 
range(coriell[,3])
### 0 245000

### Human genome has about 3 billion basepairs. Check that the "Position" value restarts from 1 for every chromosome?
plot(coriell$Position)

### Ideally we want the probes to be homogeneously distributed in each chromosome, check it for Chromosome 1
hist(coriell$Position[coriell$Chromosome==1])
### yes this looks more or less similarly probed everywhere in Chromosome 1.

### Columns 5 and 6 are the measured values for two samples: Coriell.05296 and Coriell.13330.
### Check the values: are there NAs?
sum(is.na(coriell$Coriell.05296))
sum(is.na(coriell$Coriell.13330))
### yes

### Create two separate data frames for each sample, named Coriell05296 and Coriell13330
### change the name of value column to "Value"
Coriell05296 <- cbind(coriell[,c(1,2,3,4)])
colnames(Coriell05296)[4] <- 'Value'
Coriell13330 <- cbind(coriell[,c(1,2,3,5)])
colnames(Coriell13330)[4] <- 'Value'

### remove NAs from both data frames
Coriell05296 <- Coriell05296[!is.na(Coriell05296[,4]),]
Coriell13330 <- Coriell05296[!is.na(Coriell13330[,4]),]

### Now what are the values?
hist(Coriell05296[,4])
hist(Coriell13330[,4])
### mostly around zero

### Copy number (CN) of DNA should be normally 2 (father, mother), or abnormal 0, 1 with CN loss, or 3,4,5... with CN gain
### So what is this value?
### Google the concept "log ratio" for copy number data and calculate converting CN = 1, 2, 3 to log ratio
log2(1/2)
log2(2/2)
log2(3/2)
### negative numbers mean CN loss, positive means CN gain, and zero is  normal.

### Plot the line directly on the histogram to see where the values lie.
abline(v=log2(1/2), col = 'red')
abline(v=log2(2/2), col = 'red')
abline(v=log2(3/2), col = 'red')

### Do a simple plot of the values on Chromosome 1
### Hint: just use Position as x axis, log ratio value as y axis.
plot_chromosome <- function(check_chr, df){
  plot(df$Position[df$Chromosome==check_chr], df$Value[df$Chromosome==check_chr], 
       main = paste(deparse(substitute(df)),'Chr',check_chr),
       xlab = 'Position',
       ylab = 'LogRatio')
}
check_chr = 1
plot_chromosome(check_chr, Coriell05296)
plot_chromosome(check_chr, Coriell13330)

### change check_chr from above to check Chromosomes 10 and 11.
check_chr <- 10
plot_chromosome(check_chr, Coriell05296)
plot_chromosome(check_chr, Coriell13330)
check_chr <- 11
plot_chromosome(check_chr, Coriell05296)
plot_chromosome(check_chr, Coriell13330)

### What do you observe compared to Chr 1?
### These actually have clear CNV: 10 has a gain at the end, 11 has a loss in a small portion

### It's clear by eye that there should be a region in Chr 10 with CN =3
### How to find start end positions of the region?
### It turns out to be not an easy question.
### Statisticians developed this R library DNAcopy, especially to solve this segmentatino problem.
### The method is called "circular binary segmentation", here we just learn how to implement it.

### Create a "copy number array" data object from the data table Coriell05296
### Hint: Use help() to understand how to use the function CNA.object().
help(CNA)
CNA.object <- CNA(Coriell05296$Value,
                  Coriell05296$Chromosome,Coriell05296$Position,
                  data.type="logratio",sampleid="c05296")

### Smoothen the data by outlier deletion
### Hint: Use help() to understand how to use the function smooth.CNA()
smoothed.CNA.object <- smooth.CNA(CNA.object, smooth.region=10, outlier.SD.scale=4)

### Segmentation step
### Hint: Use help() to understand how to use the function segment()
### What does different parameters imply?
segment.smoothed.CNA.object <- segment(smoothed.CNA.object, undo.splits = 'none', verbose=1)

### Now the segmentation algorithm has finished with our paramter "smooth.region" as 10 and "outlier.SD.scale" as 4.
### What is the segmentation output?
### Hint: type "segment.smoothed.CNA.object$" in the console and hit Tab key to see what prompts.
### Hint: you can also check in the "Environment" window and open the variable "segment.smoothed.CNA.object" to see its content.
seg_out = segment.smoothed.CNA.object$output
head(seg_out)

### What does each column mean?
### most are self explanatory, but num.mark I didn't know: it's the number of original probes that are now in that segment

### do a simple scatter plot with "chrom" as x and "seg.mean" as y
plot(seg_out$chrom, seg_out$seg.mean)

### use table() to check how many segments each chromosome has
table(seg_out$chrom)

### change parameters for smoothing and for segmentation and see if the number of segments change
### and check with plot() or table()
### e.g. for smoothing: "smooth.region" as 20 and "outlier.SD.scale" as 8.
### e.g. for segmentation: "undo.splits" as "sdundo", "undo.SD" as 3 and "verbose" as 1
smoothed.CNA.object2 <- smooth.CNA(CNA.object, smooth.region=20, outlier.SD.scale=8)
segment.smoothed.CNA.object2 <- segment(smoothed.CNA.object2, verbose=1)
seg_out2 <- segment.smoothed.CNA.object2$output
nrow(seg_out2)
table(seg_out2$chrom)

smoothed.CNA.object3 <- smooth.CNA(CNA.object, smooth.region=10, outlier.SD.scale=4)
segment.smoothed.CNA.object3 <- segment(smoothed.CNA.object3, 
                                       undo.splits="sdundo", 
                                       undo.SD=3,verbose=1)
seg_out3 <- segment.smoothed.CNA.object3$output
nrow(seg_out3)
table(seg_out3$chrom)

### The DNAcopy library also has some nice plotting tools to easily visualize this segmentation.
### plot probe and segment data by chromosome and positions.
### Hint: Use help() to understand how to use the function plotSample().
plot(segment.smoothed.CNA.object, plot.type="w")

### plot with separate chromosomes with same method plotSample() but different "plot.type".
plot(segment.smoothed.CNA.object, plot.type="s")

### plot with x position ordered by segment values with same method plotSample() but different "plot.type".
plot(segment.smoothed.CNA.object, plot.type="p")
