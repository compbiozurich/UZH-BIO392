## **Task: Read up on liftover techniques & explore resources and other applications**

The release of new editions of the human genome over years and therefore the generation of different genome assemblies require tools for the conversion of genome coordinates between different assemblies for many integrative and comparative studies. In this task, some of these tools are listed and their pros and contras are shown. 


## **Liftover Techniques**

Currently, there are two existing general methods which can be used to convert between coordinates from different genome assemblies:

a) the re-alignment of the original sequence data to the target assembly

b) the convertion of the coordinates of genome data between assemblies by using a mapping file

For the conversion between genome assemblies by coordinates there are 3 tools available, which are widely used:

### liftOver (University of California, Santa Cruz)

*breaks the segment into smaller segments and map them to different locations*

* web service and command line utility
* assemblies for different organisms with the capability to convert between many of them

### CrossMap (Zhao)

*breaks the segment into smaller segments and map them to different locations*

* able to convert files in BAM/SAM or BigWig format
* not able to convert genome coordinates between species

### Remap (NCBI)

*keeps the integrity of the segment and maps the span to the target assembly*

* able to perform cross species mapping (Limitation: number of organisms)
* only provided as web service with submission limits (difficult to use for large scale or pipelined applications)

### segment_liftover (Gao et al.)

*integrity-preserving conversion of genomic segments data between genome assemblies*

* re-conversion by locus approximation possible (if precise conversion of genomic positions fails)
* tool is implemented in python
* can convert both probe files and segment files at the same time or in separate runs


>*All tools provide almost identical results in coordinate conversion. The big advantage of Remap and segment_liftover is, that these tools do not break down the segment into smaller segments to map them to different locations as the other tools. They keep the integrity of the segment, which is important in research such as analysis of copy number variation (CNV) data, where the quantitative representation of a genomic region is more important than the base-specific accuracy. The segment breakdown performed with tools as liftOver and CrossMap can lead to data loss in the analysis of copy number variations.*



![grafik](https://user-images.githubusercontent.com/82868302/135148294-aea1e25f-05ab-40ce-ae9e-da7e9e61b21b.png)

