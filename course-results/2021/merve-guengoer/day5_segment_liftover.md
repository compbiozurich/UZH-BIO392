# **Task: Read up on liftover techniques & explore resources and other applications**

# **Liftover Techniques**

Currently, there are two existing general methods which can be used to convert between coordinates from different genome assemblies:
a) the re-alignment of the original sequence data to the target assembly
b) the convertion of the coordinates of genome data between assemblies by using a mapping file

For the conversion between genome assemblies by coordinates there are 3 tools available, which are widely used:

1) liftOver (University of California, Santa Cruz)
=> breaks the segment into smaller segments and map them to different locations
different locations
* web service and command line utility
* assemblies for different organisms with the capability to convert between many of them

2) CrossMap (Zhao)
=> breaks the segment into smaller segments and map them to different locations
* able to convert files in BAM/SAM or BigWig format
* not able to convert genome coordinates between species


3) Remap (NCBI)
=> keeps the integrity of the segment and maps the span to the target assembly
* able to perform cross species mapping (Limitation: number of organisms)
* only provided as web service with submission limits (difficult to use for large scale or pipelined applications)

All 3 tools provide almost identical results in coordinate conversion. They   

