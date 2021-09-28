# segment_liftover: a Python tool to convert segments between genome assemblies

## Abstract
The process of assembling a species' reference genome may be performed in a number of iterations, with subsequent genome assemblies differing in the coordinates of mapped elements. Meaning that in different editions of the reference genome there may be differently mapped elements, which need to be compared to other mapped references.

The conversion of genome coordinates between different assemblies is required for many integrative and comparative studies. While currently a number of bioinformatics tools are available to accomplish this task, most of them are tailored towards the conversion of single genome coordinates. 

The problematic is, that when boundary positions of segments spanning larger genome regions are converted, there may be mapping incontinuity problems and it may be victim to data loss.

*segment_liftover* aims at continuits-preserving remapping of genome segments between assemblies and provides features such as spproximate locus conversion, automated batch processing and comprehensive logging to faciliatet processing of datasets containing large numbers of structural genome variation data.

## Introduction

The first human genome assembly was published in 2001. To improve the quality and accuracy, new editions were released. Current version is GRCh38, 2013. When researchers perform genomic studies, the generated data is mapped to different versions of the reference genome.

Two main methodologies are used fo the conversion between coordinates from different genome assemblies.
The **first approach** is to re-align the original sequence data to the target assembly. This method could provide the best result but is very time-consuming.
The **second approach** is to convert the coordinates of genome data between assemblies by using a mapping file. This method, although bearing a side effect of minor information loss, for most applications provides a good balance between performance and accuracy.

Three tools are now in use for the conversion between genome assemblies by coordinates:
* liftOver
* CrossMap
* Remap
