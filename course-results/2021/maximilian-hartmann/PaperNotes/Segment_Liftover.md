# [Segment_liftover: a Python tool to convert segments between genome assemblies [Gao et al.  2018]](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5998006/)
##### Notes

### Introduction
When performing genome analysis from mutliple sources, it is imperative to convert all data to the same genomic coordinate system.
There are two approaches used for conversion between coordinates different genome assemblies: 
1. Realign the original sequence data ot the target assembly. Good results, but time consuming + requires original sequence data)
2. Convert the coordinates of the genome data between assemblies by using a mapping file. Minor informaiton loss but good balance between performance and accuracy

Tools for conversion between genome assemblies by coordinates:
* _liftOver_ (University of California) ==> _UCSC liftOver_
  * Most comprehensive selection of assemblies for different organisms
* _Crossmapp_ from Zhao
  * convert files in BAM/SAM or BigWig. Pretty similar to _UCSC liftOver_ but not for between species
* _Remap_ from NCBI
  * For each organism a list of major assemlbies and sub-versions. Cross species mapping, with limited number of organisms

Challenges: Dealing with genome segments that are not continuous anymore in the target assembly.
_CrossMap_ & _liftOver_ break the segment into smaller segments and map them to different location. 
_Remap_ keeps the integrity and maps the span to the target assembly.

Also, limitation of them: Only single input files. ==> hard to do comperative studies with thousands of files

##### *_segment_liftover_* 
A tool to perform an integrity-preserving conversion of genome assemblies with two additonal functions:
* Re-conversion by locus approximation (when a precise conversion fails)
* Capability to handle any number of files and optional integration into data processing piplines

### Methods
#### Implementation
_segment_liftOver_ can convert both probe files and segment files at the same time or in seperate runs.
To convert a probe file, _segment_liftover_ will:
1. use _UCSC liftOver_ to convert the file
  * convert _start_ and _end_ position of segments
3. apply an approximate conversion on prabs that the _UCSC liftOver_ failed to convert

The following criteria must be met to convert:

position(new_start) ≠ position(new_end) ≠ chromosome(new_start) ≠ chromosome(new_end)

1/β < (length(old_segment))/(length(new_segment)) < β

β ==> threshold of the length ratio and the default value is set to 2.

if those criteria fails _segment_liftover_ will apply an approxiamte conversion or rejected depending on which criteria is not met.

this figure illustrates the workflow of the tool _segment_liftover_
![alt text](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5998006/bin/f1000research-7-16527-g0001.jpg)

#### Examples
##### Converting arrayMap data from hg19 to hg38
99.99% of Probes and >99% of segemnst could be directly converted from hg19 to hg38
