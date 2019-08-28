####### adapted from vignette source 'DNAcopy' #######

### Install package 
### if prompted with not able to access
source("https://bioconductor.org/biocLite.R")
biocLite("DNAcopy") 

####### Data Description #######
### We selected a subset of the data set presented in Snijders et al. (2001). 
### We are calling this data set coriell. The data correspond to two array CGH studies of 
### fibroblast cell strains. In particular, we chose the studies GM05296 and GM13330. 
### After selecting only the mapped data from chromosomes 1-22 and X, there are 2271 data points. 
### There is accompanying spectral karyotype data (not included), which can serve as a gold standard. 
### The data can be found at http://www.nature.com/ng/journal/v29/n3/suppinfo/ng754_S1.html


### Load the library
library(DNAcopy)

### Load data
data(coriell)

### Observe your data. 
### These are positional copy number values for samples Coriell.05296 and Coriell.13330.
View(coriell)

### Create a ‘copy number array’ data object from the data column 'Coriell.05296'
CNA.object <- CNA(cbind(coriell$Coriell.05296),
                  coriell$Chromosome,coriell$Position,
                  data.type="logratio",sampleid="c05296")


### Smoothen the data by outlier deletion
smoothed.CNA.object <- smooth.CNA(CNA.object, smooth.region=10, outlier.SD.scale=4)


### Segmentation step
segment.smoothed.CNA.object <- segment(smoothed.CNA.object, verbose=1)


### plot probe and segment data by chromosome and positions.
### The red lines correspond to mean values in segments. 
### Note that the points are in alternate colors to indicate different chromosomes.
plotSample(segment.smoothed.CNA.object, plot.type="w")


### plot with separate chromosomes
plot(segment.smoothed.CNA.object, plot.type="s") 

### plot with x position ordered by segment values
plot(segment.smoothed.CNA.object, plot.type="p")


### Now to get rid of unnecessary change-points, an undo method can be implemented, e.g. by standard deviation.
### Below all splits that are not at least three SDs apart are removed.
sdundo.CNA.object <- segment(smoothed.CNA.object, 
                             undo.splits="sdundo", 
                             undo.SD=3,verbose=1)


plot(sdundo.CNA.object,plot.type="s")

### compare this plot with the earlier plot and find the difference.

