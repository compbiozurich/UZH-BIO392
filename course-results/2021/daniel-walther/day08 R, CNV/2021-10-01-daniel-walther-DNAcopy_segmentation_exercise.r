### adapted from vignette source 'DNAcopy' ###

### Install package 
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("DNAcopy")
### if prompted with "not able to access"

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
class(coriell)
  # data.frame

### What's the dimension of the data frame?
### Hint: dim()
dim(coriell)
  # nrows ncols
  # 2271  5

### What information does the table contain?
### Hint: head() and colnames()
head(coriell)
colnames(coriell)
  # information on: Clone, Chromosome, Position, Coriell.05296 (?), Coriell.13330 (?)

length(coriell[1,]) # df[row,] # .. shows ncols
length(coriell[,1]) # df[,col] # .. shows nrows

### So how does the values of the chromosome column look like?
head(coriell[,2])
  # numeric (integer) (chromosome number)
### What are the unique values in the column?
unique(coriell[,2])
  # numbers 1 to 23 (no x or y chromosome, or at least not declarated)

#####

### How to get a quick estimate of the values/how the values distribute?
  # wanted to see the no. of rows of each chromosome.
summary(coriell)
  # QU: What command did you use?
  # A: hist() of chosen variables

#### exploring value distribution of variables.
install.packages("ggplot2")
library(ggplot2)
  # I would like to colour the graphs transparently by chromosome to see overlaps (but I don't have a scientific question in mind. Return to this when questions are formulated.)

#####

### What is the range of the positions?
range(coriell[,3]) # equivalent to below line
range(coriell$Position)
  # postions range from 0 to 245'000

### Human genome has about 3 billion basepairs. Check that the "Position" value restarts from 1 for every chromosome?
for (i in 1:max(coriell$Chromosome)){
  print(coriell[coriell[, "Chromosome"] == i,] # sub data frame with rows of Chromosome i (and all columns)
        [1, "Position"]) # of that data frame
  print(i)
}
  # chromosome 13, 14, 21, 22 don't start at position 0. the rest do.
    # maybe some LTR (telomere) that were left out

### Ideally we want the probes to be homogeneously distributed in each chromosome, check it for Chromosome 1
  # want to know whether probes (entries (rows)) are evenly spread out over the range of every chromosome.

### yes this looks more or less similarly probed everywhere in Chromosome 1.

### Columns 5 and 6 are the measured values for two samples: Coriell.05296 and Coriell.13330.
### Check the values: are there NAs?

### Create two separate data frames for each sample, named Coriell05296 and Coriell13330
### change the name of value column to "Value"

### remove NAs from both data frames

### Now what are the values?

### Copy number (CN) of DNA should be normally 2 (father, mother), or abnormal 0, 1 with CN loss, or 3,4,5... with CN gain
### So what is this value?
### Google the concept "log ratio" for copy number data and calculate converting CN = 1, 2, 3 to log ratio

### Plot the line directly on the histogram to see where the values lie.

### Do a simple plot of the values on Chromosome 1
### Hint: just use Position as x axis, log ratio value as y axis.

### change check_chr from above to check Chromosomes 10 and 11.

### What do you observe compared to Chr 1?

### It's clear by eye that there should be a region in Chr 10 with CN =3
### How to find start end positions of the region?
### It turns out to be not an easy question.
### Statisticians developed this R library DNAcopy, especially to solve this segmentatino problem.
### The method is called "circular binary segmentation", here we just learn how to implement it.

### Create a ‘copy number array’ data object from the data table Coriell05296
### Hint: Use help() to understand how to use the function CNA().

### Smoothen the data by outlier deletion
### Hint: Use help() to understand how to use the function smooth.CNA()

### Segmentation step
### Hint: Use help() to understand how to use the function segment()
### What does different parameters imply?

### Now the segmentation algorithm has finished with our paramter "smooth.region" as 10 and "outlier.SD.scale" as 4.
### What is the segmentation output?
### Hint: type "segment.smoothed.CNA.object$" in the console and hit Tab key to see what prompts.
### Hint: you can also check in the "Environment" window and open the variable "segment.smoothed.CNA.object" to see its content.

### What does each column mean?

### do a simple scatter plot with "chrom" as x and "seg.mean" as y

### use table() to check how many segments each chromosome has

### change parameters for smoothing and for segmentation and see if the number of segments change
### and check with plot() or table()
### e.g. for smoothing: "smooth.region" as 20 and "outlier.SD.scale" as 8.
### e.g. for segmentation: "undo.splits" as "sdundo", "undo.SD" as 3 and "verbose" as 1

### The DNAcopy library also has some nice plotting tools to easily visualize this segmentation.
### plot probe and segment data by chromosome and positions.
### Hint: Use help() to understand how to use the function plotSample().

### plot with separate chromosomes with same method plotSample() but different "plot.type".

### plot with x position ordered by segment values with same method plotSample() but different "plot.type".
