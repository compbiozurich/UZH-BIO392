## Exploration of different file formats

1. SAM (Sequence Alignment/Map)
>The text based SAM format consists of a header and an alignment section.
Headings begin with the '@' symbol, which distinguishes them from the alignment section.

2. BAM (Binary Alignment/Map)
>Binary equivalent of SAM, developped for fast processing. 
Aka stores the same data as SAM in a compressed binary representation.

>Key features of both SAM/BAM: 
* can store alignments from most aligners
* Supports multiple sequencing technologies
* Supports indexing for quick retrieving/viewing
* Compact size
* Reads can be grouped into logical groups
* Wildly supported by variant calling software packages
[Source] (https://www.slideshare.net/thomaskeane/wellcome-trust-advances-course-ngs-course-lecture1)

3. CRAM
>CRAM is a file format for storing sequences aligned to a reference sequence and is smaller than BAM but similar features.
It was designed to be an efficient reference-based alternative to SAM and BAM file formats to describe differences between the aligned sequence fragments and the reference sequence

4. VCF (Variant call format)
>This format has been created for large-scale genotyping and DNA-sequencing and is the standard file format for these approaches.
It has build-in logic that creates a rwo for each variant and a column for each callset with an indication of varian frequency. A problem may be, that for rare variants a new row is created, which will be mostly empty except for the one/two times the variant occured. 

5. FASTA
>A text based format with a header and some additional into (Name, Organism). It's quite simple to manipulate with eg. Python and R.

6. MPEG-G
>A binary format, which is more compressed than BAM. 
