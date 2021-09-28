# Notes Day 05

## Notes about the segment_lifover: a Python tool to convert segments between genome assemblies

Several editions of the human genome haven been released over the years to perfect the quality of the genome assembly. Different genomic studies haven generated data that is mapped to different versions of the reference genome. But when using data from multiple resources, all the data needs to be converted to one genomic coordinate system.
There are 2 ways to convert data from different genome assemblies
  1. Re-align the original sequence data to the target assembly. This is very time-consuming but could provide the best result if the original sequence data is available and does not consist of direct sequences.
  2. Convert the coordinates of genome data between assemblies by using a mapping file.

There exist different tools for conversion between genome assemblies by coordinates which are all quite efficient and provide almost identical results. But tools like these are generally limited due to the limitation to single input files.
*Segment_liftover* is a tool to perform integrity-preserving conversion of genomic segments data between genome assemblies. It distinguishes itself to previous tools by 2 major additional functions
  1. Re-conversion by locus approximation (in instances where a precise conversion of genomic positions fails)
  2. The capability to handle any number of files an optional intergration into data processing pipelines with supporting features such as autmatic file traversal, interruption resumption and detailed logging.

### Methods of the segment_liftover:
#### 1. Implementation:
Both probe files and segment files can be converted at the same time or in separate runs. It starts from a structured directory or a list of files. then traverses and converts all files meeting the specified name pattern, and finally outputs to a designated directory.
For a segment conversion to be successful, it needs to meet different criteria. If some of the criteria are not met (depending on the criteria) *segment_lifover* will either make an approximate conversion, will report the data as unconvertible or the conversion will be reported as rejected.
≠ 
$\alpha$
#### 2. Operation
*Segment_liftover* is implemented in Python and it is available for Linux and OSX. Its approximate conversion is being done with the *UCSC liftOver*. Chain files between common human assemblies are included in the program package.
