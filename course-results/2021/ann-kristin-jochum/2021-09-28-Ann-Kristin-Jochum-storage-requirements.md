# Segment liftover: A Python tool to convert segments between genome assemblies (Gao et al.)

## Background
* Reference genomes change frequently due to error corrections and other updates
* This can result in changes of the previously defined coordinates of base pairs of interest, making comparative studies tricky
* There are bioinformatics tools to deal with this, but they mostly concern themselves with the conversion of single genome coordinates
* In this paper, a method called *segment_liftover* is presented which emphasizes the preservation of copy number variation (CNV) information which would otherwise be lost

## Introduction
* Two general methodologies for conversion between coordinates from different genome assemblies:
  * Re-align original sequence data to the target assembly (time-consuming)
  * Convert coordinates of genome data between assemblies by using a mapping file (side effect is minor information loss)
* **Tools for conversion**:
  * *liftOver* from the University of California, Santa Cruz (UCSC)
  * *CrossMap* from Zhao
  * *Remap* from NCBI
* **CNV data**: quantitative representation of a genomic range takes precedence over base-specific representation
* *segment_liftover*:
  * Performs integrity-preserving conversion of genomic segments data between genome assemblies
  * Functional addition No.1: Re-conversion by locus approximation when precise conversion doesn't work
  * Functional addition No.2: Can handle any number of files and can be integrated into data processing pipelines

## Methods
* *segment-liftover* can convert both probe files and segment files at the same time or in separate runs
* First, UCSC liftOver is used to convert the file, and if it fails then an approximate conversion ist done
* *segment_liftover* tool is implemented in Python and available for both Linux and OSX; it also requires the UCSC liftOver program and chain files
