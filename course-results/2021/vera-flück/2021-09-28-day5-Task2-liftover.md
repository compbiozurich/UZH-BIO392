# Liftover tools

Resources:  
segment_liftover: a Python tool to convert segments between genome assemblies  
https://genviz.org/module-01-intro/0001/06/02/liftoverTools/

## Intro
The process of assembling a species' reference genome may be performed in a number of iterations, with subsequent genome assemblies differing in the coordinates of mapped elements. Meaning that in different editions of the reference genome there may be differently mapped elements, which need to be compared to other mapped references. For example, you have a bed file with exon coordinates for human build GRC37 (hg19) and wish to update to GRCh38.

The conversion of genome coordinates between different assemblies is required for many integrative and comparative studies. While currently a number of bioinformatics tools are available to accomplish this task, most of them are tailored towards the conversion of single genome coordinates. 

The problematic is, that when boundary positions of segments spanning larger genome regions are converted, there may be mapping incontinuity problems and it may be victim to data loss.

*segment_liftover* aims at continuits-preserving remapping of genome segments between assemblies and provides features such as spproximate locus conversion, automated batch processing and comprehensive logging to faciliatet processing of datasets containing large numbers of structural genome variation data.

## Reference assemblies
A reference assembly is a complete (as much as possible) representation of the nucleotide sequence of a representative genome for a specific species. These assemblies provide a powerful shortcut when mapping reads as they can be mapped to the assembly, rather than each other, to piece the genome of a new individual together. Mapping to an existing reference genome is more efficient than building a new genome from scratch just by mapping reads. However, due to polymorphisms and different individuals contributing to the reference genomes, a reference genome is never a perfect reference for an individual.

## Approaches for conversions and tools

The first human genome assembly was published in 2001. To improve the quality and accuracy, new editions were released. Current version is GRCh38, 2013. When researchers perform genomic studies, the generated data is mapped to different versions of the reference genome.

Two main methodologies are used fo the conversion between coordinates from different genome assemblies.
The **first approach** is to re-align the original sequence data to the target assembly. This method could provide the best result but is very time-consuming.
The **second approach** is to convert the coordinates of genome data between assemblies by using a mapping file. This method, although bearing a side effect of minor information loss, for most applications provides a good balance between performance and accuracy.

Three tools are now in use for the conversion between genome assemblies by coordinates:
* liftOver
* CrossMap
* Remap

The *liftOver* tool from UCSC offers the most comprehensive selection of assemblies for different organisms with the capability to convert between many of them. You also need chain files, which describe conversions between a pair of genome assemblies.
*CrossMap* has the unique functionality to convert files in BAM/SAM or BigWig format. *Remap* provides for each organism a comprehensive list of major assemblies and the corresponding subversions.

### Challenges
The seemingly biggest problem is dealing with genome segments that are not continous anymore in the target assembly. One approach is to break the segment into smaller segments and map them to different locations. Another approach is to keep the integrity of the segment and map the span to the target assembly.

![image](https://user-images.githubusercontent.com/91005577/135107152-6208bb47-a438-4f79-9fb9-144e20164cd5.png)

### Solution: *segment_liftover* as a new tool

*segment_liftover* is a tool, implemented in Python, to perform an integrity-preserving conversion of genomic segments data between genome assemblies. It features two major functional additions over existing tools: First, re-conversion by locus approximation, in instances where a precise conversion of genomic positions fails; and second, the capability to handle any number of files and optional intergration into data processing pipelines with supporting features such as automatic file traveral, interruption resumption and detailed logging. 


## Summary

Translation between genome versions of sequencing data is tedious but crucial task in bioinformatics. With the functionalities of automated batching, approximate conversion and segment conversion, *segment_liftover* can dramatically reduce the complexity and workload of such data processing.
