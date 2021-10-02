# daniel walther
# day08, morning: CNV analysis in R
# disclaimer: sometimes, I use '' to say 'so-called', like just now. usually, "" mean actual quotes of something.

#####
# Set up of packages and data set

# adapted from vignette source 'DNAcopy'

# Install package 
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("DNAcopy")
# if prompted with "not able to access"

# Data Information ###
# We selected a subset of the data set presented in Snijders et al. (2001). 
# We are calling this data set coriell. The data correspond to two array CGH studies of 
# fibroblast cell strains. In particular, we chose the studies GM05296 and GM13330. 
# There is accompanying spectral karyotype data (not included), which can serve as a gold standard. 
# The data can be found at https://www.nature.com/ng/journal/v29/n3/suppinfo/ng754_S1.html
  # Abstract (of given link above)
  # We have assembled arrays of approximately 2,400 BAC clones for measurement
  # of DNA copy number across the human genome. The arrays provide precise
  # measurement (s.d. of log2 ratios=0.05-0.10) in cell lines and clinical
  # material, so that we can reliably detect and quantify high-level
  # amplifications and single-copy alterations in diploid, polyploid and
  # heterogeneous backgrounds.

# Load the library
library(DNAcopy)

# Load data
data(coriell)

# What's the type of the object? Hint: class()
class(coriell)
  # data.frame

# What's the dimension of the data frame? Hint: dim()
dim(coriell)
  # nrows ncols
  # 2271  5
  # 2'271 observations of 5 variables
length(coriell[1,]) # df[row,] # .. shows ncols
length(coriell[,1]) # df[,col] # .. shows nrows

# What information does the table contain? Hint: head() and colnames()
colnames(coriell)
head(coriell)
  # information on: Clone, Chromosome, Position, Coriell.05296 (?), Coriell.13330 (?)

# So how do the values of the chromosome column look like?
head(coriell[,2])
  # numeric (integer) (chromosome number)
# What are the unique values in the column?
unique(coriell[,2])
  # numbers 1 to 23 (no x or y chromosome, or at least not declarated)

#####
# EDA (Exploratory Data Analysis) - distribution

# How to get a quick estimate of the values/how the values distribute?
  # wanted to see the no. of rows of each chromosome.
hist(coriell$Chromosome, main = 'no. of measured Sequences on chrom.s',
     xlab = 'Chromosome (1-23)', ylab = 'no. of BAC clones (=probes)', breaks = 0:23)
  # In general, the larger the chromosome, the more clones could fit on it.
  # This suggests that the clones were all similar in seq. length.
# checking the distribution of probes within chromosomes:
par(mfrow = c(3, 4)) # yields 2 plot grids
for (i_chr in 1:23) {
  hist(coriell$Position[coriell$Chromosome == i_chr], main = paste('Chromosome', i_chr),
       xlab = 'positions on Chromosome [bp]')
}

# Ideally we want the probes to be homogeneously distributed in each chromosome, check it for Chromosome 1
par(mfrow = c(1,1))
hist(coriell$Position[coriell$Chromosome==1], main = 'Chromosome 1', xlab = 'positions [bp]')
# "yes this looks more or less similarly probed everywhere

# could also check the density (distribution) of positions like this:
plot(x = coriell$Chromosome, y = coriell$Position,
     main = 'probes distribution within chromosomes', xlab = 'chromosome', ylab = 'probes')
  # Some chromosomes appear more densly probed than others, but doesn't look problematic.
  # Interesting to see a gap around the centre of every chromosome - that must be where the centromeres are.

# What is the range of the positions?
range(coriell[,3]) # equivalent to below line
range(coriell$Position)
  # positions range from 0 to 245'000 (min and max)
# see the next command for the ranges of each chromosome.

# Human genome has about 3 billion basepairs. Check that the "Position" value restarts from 1 for every chromosome?
print('Chromosome number - range of positions:')
for (i in 1:max(coriell$Chromosome)){
  print(paste(i, '-', paste(range(coriell$Position[coriell$Chromosome == i]), collapse = '-')))
}
  # chromosome 13, 14, 21, 22 don't start at position 0. the rest do.
    # maybe some LTR (telomere) that were left out

#####
# values (which?) with(out) NAs, first CNV scatterplots!

# Columns 4 and 5 are the measured values for two samples: Coriell.05296 and Coriell.13330.
# Check the values: are there NAs?
for (column in colnames(coriell)){
  print(sum(is.na(coriell[,paste(column)])))
}
  # columns 4 and 5 have NAs: 159 in Coriell.05296, 194 in Coriell.13330

# Create two separate data frames for each sample, named Coriell05296 and Coriell13330
Coriell05296 <- coriell[,c(1,2,3,4)]
Coriell13330 <- coriell[,c(1,2,3,5)]
head(Coriell05296); head(Coriell13330)
# change the name of value column to "Value"
colnames(Coriell05296)[4] <- 'value'
colnames(Coriell13330)[4] <- 'value'
head(Coriell05296); head(Coriell13330)

# remove NAs from both data frames
study1 <- Coriell05296 <- na.omit(Coriell05296)
study2 <- Coriell13330 <- na.omit(Coriell13330)
head(study1); head(study2)

# Now what are the values? (now it gets interesting!)
par(mfrow = c(2, 2))
plot(c(1:length(study1$value)), study1$value, ylab = 'CNV', xlab = 'position', main = 'study 05296')
plot(c(1:length(study2$value)), study2$value, ylab = 'CNV', xlab = 'position', main = 'study 13330')
plot(study1$Position, study1$value, ylab = 'CNV', xlab = 'position')
plot(study2$Position, study2$value, ylab = 'CNV', xlab = 'position')
  # values: the bulk of the values swarm around 0 from -.25 to .25, there are some clusters at -.5, .5, and -1.0.
  # upper plots: not bad, getting there.
  # lower plots: hm, positions of all chromosomes get superimposed on each other, bad.
  # apparently I was supposed to choose histograms here, but I disagree. The upper two scatterplots make clear clusters already visible.

#####
# CNV (copy number variation)
# segmentation problem introduction (solved by package DNAcopy by "statisticians")

# Copy number (CN) of DNA should be normally 2 (father, mother), or abnormal 0, 1 with CN loss, or 3,4,5... with CN gain
# So what is this value?
# Google the concept "log ratio" for copy number data and calculate converting CN = 1, 2, 3 to log ratio
log2(1/2) # 1 CN (copy number) out of the normal 2
log2(2/2)
log2(3/2)
  # the values we're interested in, the Copy Numbers, are log2 ratios between measured and reference copy number (2)

# Plot the line directly on the histogram to see where the values lie.
cn1 <- log2(1/2); cn2 <- log2(2/2); cn3 <- log2(3/2)
par(mfrow = c(1, 2))
hist(study1[, 4], main = 'study 05296', xlab = 'CNV')
abline(v = cn1, col = 'red')
abline(v = cn2, col = 'red')
abline(v = cn3, col = 'red')
hist(study2[, 4], main = 'study 13330', xlab = 'CNV')
abline(v = cn1, col = 'red')
abline(v = cn2, col = 'red')
abline(v = cn3, col = 'red')

# Do a simple plot of the values on Chromosome 1. Hint: just use Position as x axis, log ratio value as y axis.
plot_chrom_cnv = function(check_chr, dat){
  dat_local <- dat[dat$Chromosome == check_chr, ]
  plot(dat_local$Position, y = dat_local$value,
       main = paste(deparse(substitute(dat)),'chromosome', check_chr),
       xlab = 'position [bp]', ylab = 'CNV [log2 ratios]')
  abline(h = cn1, col = 'blue') # blue indicates copy loss
  abline(h = cn2, col = 'brown')
  abline(h = cn3, col = 'red') # red indicates copy gain
}
  # funny, I got the same solution to writing the data frame callname in the title: http://stackoverflow.com/questions/14577412/ddg#14577878
par(mfrow = c(1, 2))
plot_chrom_cnv(1, study1)
plot_chrom_cnv(1, study2)
  # study 1 shows no unexpected copy numbers ony chrom.1, but study 2 shows a duplicated (triploid) section on the right.

# change check_chr from above to check Chromosomes 10 and 11.
  # sounds like there should be a function here since 'check_chr' is not used anywhere else.
par(mfrow = c(2, 2))
chr = 10
plot_chrom_cnv(chr, study1)
plot_chrom_cnv(chr, study2)
chr = 11
plot_chrom_cnv(chr, study1)
plot_chrom_cnv(chr, study2)
# What do you observe compared to Chr 1?
  # study 1: chrom. 10 has a 1 copy gain, chrom. 11 possibly has a 1 copy loss region.
  # study 2: chrom. 10 appears intact, chrom 11 as well
  # basically, copy numbers fluctuate suspiciously much and clustered, too.

# It's clear by eye that there should be a region in Chr 10 with CN =3
# How to find start end positions of the region? It turns out to be not an easy question. [but a good one. me gusta.]
# Statisticians developed this R library DNAcopy, especially to solve this segmentatino problem.
# The method is called "circular binary segmentation", here we just learn how to implement it.

#####
# selective application of the segmentation algorithm (The method is called "circular binary segmentation")

# Create a copy number array data object from the data table Coriell05296 (study1)
# Hint: Use help() to understand how to use the function CNA().
help(CNA)
  # Usage:
    # CNA(genomdat, chrom, maploc, data.type=c("logratio","binary"), sampleid=NULL, presorted = FALSE)
  # Arguments:
    # genomdat:   a vector or matrix of data from array-CGH, ROMA, or other copy number experiments. If it is a matrix the rows correspond to the markers and the columns to the samples.
    # chrom:      the chromosomes (or other group identifier) from which the markers came. Vector of length same as the number of rows of genomdat. If one wants the chromosomes to be ordered in the natural order, this variable should be numeric or ordered category.
    # maploc:     the locations of marker on the genome. Vector of length same as the number of rows of genomdat. This has to be numeric.
      # no default value
    # data.type:  logratio (aCGH, ROMA, etc.) or binary (LOH).
CNA.object1 <- CNA(genomdat = study1$value, chrom = study1$Chromosome,
                  maploc = study1$Position,
                  data.type="logratio",sampleid=c("c05296"))
# why not copy the documentation example with the same dataset?
CNA.object <- CNA(cbind(coriell$Coriell.05296,coriell$Coriell.13330),
                  coriell$Chromosome,coriell$Position,
                  data.type="logratio",sampleid=c("c05296","c13330"))
  # yields same warning message of superimposed (repeated) positions

# Smoothen the data by outlier deletion
# Hint: Use help() to understand how to use the function smooth.CNA()
help(smooth.CNA)
  # Usage:
    # smooth.CNA(x, smooth.region=10, outlier.SD.scale=4, smooth.SD.scale=2, trim=0.025)
  # Arguments:
    # x: Copy number array data object
smoothed.CNA.object <- smooth.CNA(CNA.object, smooth.region = 10, outlier.SD.scale = 4)

# Segmentation step
# Hint: Use help() to understand how to use the function segment()
help("segment")
  # Genome Segmentation Program.
    # Description
      # This program segments DNA copy number data into regions of estimated equal copy number using circular binary segmentation (CBS).
segment.smoothed.CNA.object <- segment(smoothed.CNA.object, )

colnames(segment.smoothed.CNA.object) # lame, that doesn't work
head(segment.smoothed.CNA.object) # semi-useful, gives some other short info., alongside the whole data frame (or whatever is contained in the CNA.object)
class(segment.smoothed.CNA.object)
summary(segment.smoothed.CNA.object) # interesting.
# What [do the] different parameters imply?
  # that there definitely are segments of 'significantly' different copy number in both study samples, and that they are all over the place (almost on every chromosome each).
  # looked at solution: idk what no.splits or verbose should mean. it will come up again if important.

# Now the segmentation algorithm has finished with our parameter "smooth.region" as 10 and "outlier.SD.scale" as 4.
# What is the segmentation output?
# Hint: type "segment.smoothed.CNA.object$" in the console and hit Tab key to see what prompts.
# Hint: you can also check in the "Environment" window and open the variable "segment.smoothed.CNA.object" to see its content.
  # Interesting, looking at head(...) output: It seems that the $variables have themselves stored whole data frames. I guess the $output variable is most interesting to me.
seg.out <- segment.smoothed.CNA.object$output

# What does each column mean?
colnames(seg.out) # aha! now it works again, I see now! (see the previous comment)
head(seg.out)
sort(seg.out$num.mark)
  # ID: sample
  # chrom: chromosome number (which crhomosome)
  # loc.start: start position in [bp] of the segment
  # los.end: end position of segment
  # num.mark: Probably the number of probes in that segment
  # seg.mean: Probably the mean log ratio value of the copy number of that segment

#####
# investigate CNV data more thoroughly

# do a simple scatter plot with "chrom" as x and "seg.mean" as y
par (mfrow = c(1,1))
plot(x = seg.out$chrom, y = seg.out$seg.mean, main = 'ouput data of segmented datasets (both samples superimposed)')
  # amend of previous statement: most segments do not seem to be of noticeably different copy number (as could be seen from the seg.mean values as well - so seg.mean values appear to be what I wrote they are)

# use table() to check how many segments each chromosome has
table(seg.out$chrom)

# change parameters for smoothing and for segmentation and see if the number of segments change
# and check with plot() or table()
# e.g. for smoothing: "smooth.region" as 20 and "outlier.SD.scale" as 8.
# e.g. for segmentation: "undo.splits" as "sdundo", "undo.SD" as 3 and "verbose" as 1
smoothed.CNA.object_changed <- smooth.CNA(CNA.object,
                                  smooth.region = 20, outlier.SD.scale = 8)
segment.smoothed.CNA.object_changed <- segment(smoothed.CNA.object_changed,
                                       undo.splits = "sdundo", undo.SD = 3, verbose = 1)
seg.out_changed <- segment.smoothed.CNA.object_changed$output

par(mfrow = c(1, 2))
plot(x = seg.out$chrom, y = seg.out$seg.mean, main = 'ouput data of segmented datasets (both samples superimposed)')
plot(x = seg.out_changed$chrom, y = seg.out_changed$seg.mean, main = 'ouput data of segmented datasets (both samples superimposed)')
table(seg.out_changed$chrom)

  # The number of segments did change, indeed, as expected.
  # The parameters (smooth.region, outlier.SD.scale, etc.) are more stringent in the second run,
  # meaning that it takes more variation for probes to be declared as outliers

#####
# FINALE - Communication of results (Please make some nice pictures, will you?)

CNA.object1 <- CNA(genomdat = study1$value, chrom = study1$Chromosome,
                   maploc = study1$Position,
                   data.type="logratio",sampleid=c("c05296"))
CNA.object2 <- CNA(genomdat = study2$value, chrom = study2$Chromosome,
                   maploc = study2$Position,
                   data.type="logratio",sampleid=c("c13330"))

smoothed.CNA.object1 <- smooth.CNA(CNA.object1)
smoothed.CNA.object2 <- smooth.CNA(CNA.object2)

segment.smoothed.CNA.object1 <- segment(smoothed.CNA.object1)
segment.smoothed.CNA.object2 <- segment(smoothed.CNA.object2)

seg.out1 <- segment.smoothed.CNA.object1$output
seg.out2 <- segment.smoothed.CNA.object2$output

# The DNAcopy library also has some nice plotting tools to easily visualize this segmentation.
# plot probe and segment data by chromosome and positions.
# Hint: Use help() to understand how to use the function plotSample().

par(mfrow = c(1,2))

plotSample(segment.smoothed.CNA.object1)
plotSample(segment.smoothed.CNA.object2)
  # beautiful! all the information! (used default values for stringency parameters)

par(mfrow = c(1,1))
# plot with separate chromosomes with same method plotSample() but different "plot.type".
plot(segment.smoothed.CNA.object1, plot.type = 'w')
plot(segment.smoothed.CNA.object2, plot.type = 'w')
  # plot.type w is same as default 'plotSample()' function.

plot(segment.smoothed.CNA.object1, plot.type = 'c')
plot(segment.smoothed.CNA.object2, plot.type = 'c')
  # plot.type c plots every given chromosome separately (can not use par(mfrow..) on this)

# plot with x position ordered by segment values with same method plotSample() but different "plot.type".
  # not really using 'plotSample()', quite frankly. Yeeah, the smart(conscientious) (enough) students will figure it out... whatever
plot(segment.smoothed.CNA.object1, plot.type = 'p')
plot(segment.smoothed.CNA.object2, plot.type = 'p')
  # not sure what this plotting type is useful for in CNV analysis.. aha, maybe one could make the hypothesis that most aggressive tumours have the most duplications in certain chromosomes, or something. Maybe could establish some sort of pattern, but I'll keep the good stuff to myself ;j #freehongkong
