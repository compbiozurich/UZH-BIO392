# segment_liftover: A Python tool to convert segments between genome assemblies

## Introduction
With the continuous decrease in genome sequencing costs, more genomes are being sequenced every day than ever before. 
In this growing pile of genomes we often find better or more "normal" genomes that would be better to use as a reference 
genome compared to the one being used as the standard at the time. Also errors are found that need to be corrected. 
The main problem at hand here is that if someone has done all their work with the most recent reference genome and in the middle of
their research a new reference genome is released, one needs to be able to remap one's work into coordinates of the new genome.
In this article, researchers have tackeled a major problem that occurs during these coordinate conversions, where copy number variation (CNV)
data can get lost. They have programmed in python a tool called "segment_liftover" to optimally convert coordinates without loosing CNV data.

## How it's done
There are two general methods used to convert between coordinates from different genome assemblies:
 * **Re-align**: The original sequence data is re-aligned to the target assembly. This approach deliveres very accurate results, but is very time consuming.
 * **Coordinate Conversion**: To convert the coordinates of genome data between assemblies by using a mapping file. This approach is much faster than re-aligning, but 
 some data does get lost. It is the most common method used, as the ratio is not bad between performance and accuracy

## Conversion Tools:
  * ***liftOver*** from the University of California, Santa Cruz (UCSC), aka. *UCSC loftOver*. It can be used as a web service or command line utility.
  * ***CrossMap*** from Zhao. It is unique, as it can convert files in BAM/SAM or BigWig format. (Similar results as from *liftOver*.
  * ***Remap*** from NCBI. Provides comprehensive list of major assemblies and the corresponding sub-versions for many organisms.


**CNV data**: quantitative representation of a genomic range takes precedence over base-specific representation

*segment_liftover* is the new tool that has been developed by the reserachers who wrote this paper. As mentioned above, it can convert genome coordinates
without loosing CNV data. CNV - Copy Number Variation - data is when the number of copies of a particular gene varies from one individual to the next.
In their approach they have tackled two main problems.
  * Re-conversion by locus approximation, in instances where aprecise conversion of genomic positions fails.
  * Capability to handle any number of files and optional integration into data processing pipelines without supporting features sucha s automatic file transversal, interruption resumption and detailed logging.

### Summary *segment_liftover*
  * Performs integrity-preserving conversion of genomic segments data between genome assemblies.
  * Re-conversion by locus approximation when precise conversion doesn't work. (First functional addition)
  * Can handle any number of files and can be integrated into data processing pipelines. (Second functional addition)

## Methods
* *segment-liftover* can convert both probe files and segment files at the same time or in separate runs.
* To begin, it uses UCSC liftOver to convert the file, and if it fails, an approximate conversion is done. The start and end segments are converted according to specific criteria.
* *segment_liftover* tool is implemented in Python. It is available for Linux and OSX. The *UCSC liftOver* program and chain files are needed as well.
