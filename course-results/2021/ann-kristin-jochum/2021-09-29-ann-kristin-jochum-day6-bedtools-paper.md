# *BEDTools: a flexible suite of utilities for comparing genomic features* by Quinlan and Hall (2010)

## Notes

### Introduction
* Determining whether genomic features overlap or are associated with one another is fundamental for genomics research
* Mostly in Browser Extensible Data (BED) or General Feature Format (GFF)
* Until then: UCSC Genome Browser's "Table Browser" or Galaxy interface were used
  => not appropriate for large and/r *ad hoc* datasets
* Need for faster and more flexible tools

### Features and Methods
* Even "simple" questions like "Which of my novel genetic variants overlap with exons" mean a lot of work and time if you have a lot of variants, even more so if the questions are more complicated
* This is where BEDTools comes in, which works within a UNIX environment without the need for installing the UCSC or Galaxy browsers
* BEDTools uses hierarchical indexing scheme to assign genomic features to discrete bins along the length of a chromosome, which results in a faster analysis since only co-localized bins are compared
* Written in C++ and supports BAM format through BAMTools libraries
* Many operations supported by BEDTools, with good control over how results are reported
* New format called BEDPE which facilitates comparisons of discontinuous features
* *intersectBed* and *pairToBed* compute overlaps between sequence alignments in BAM format
* Many more useful functions
* **Advantages**:
  * Can read from and write to standard output => combination with each other or with existing UNIX utilities possible
  * Most tools can distinguish between DNA strands => orientation can be considered
  * Local or public instances not necessary
  * Greater speed and functionality than other tools
