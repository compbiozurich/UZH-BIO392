# Different File Formats
Here is a brief introduction of different genomic file formats and their use cases.

## SAM, BAM and CRAM [1](https://gatk.broadinstitute.org/hc/en-us/articles/360035890791-SAM-or-BAM-or-CRAM-Mapped-sequence-data-formats) [2](https://learn.gencore.bio.nyu.edu/ngs-file-formats/sambam-format/)
SAM, BAM and CRAM are all different forms of the original SAM format that was defined for holding aligned (mapped) high-throughput sequencing data.

### SAM (Sequence Alignment Map)
- tab-delimited text format (a **tab-delimited text** contains tabs that separate information with one record per line.)
- human readable
- often generated of BAM
- stores biological sequences aligned to a reference sequence (a **sequence alignment** is a way of arranging the sequences of DNA, RNA, or protein to identify regions of similarity that may be a consequence of functional, structural, or evolutionary relationships between the sequences.[3](https://en.wikipedia.org/wiki/Sequence_alignment)
- consists of a header, a row for every read in the dataset, and 11 tab-delimited fields describing that read (for details [click here](https://en.wikipedia.org/wiki/SAM_(file_format)#Format) )

### BAM  (Binary Alignment Map)
- binary
- compressed version of SAM
- not human readable, must be converted to another format (e.g. SAM) in order to make sense to humans
- contains a header section and an alignment section
  -	Header: Contains information about the entire file, such as sample name, sample length, and alignment method
  - Alignments: Contains read name, read sequence, read quality, alignment information, and custom tags.
  
### CRAM
- binary
- columnar file format
- has the same information as SAM
- more compressed than BAM, this compression is driven by the reference the sequence data is aligned to
- lossless or lossy compression (for further information [click here](https://www.uppmax.uu.se/support/user-guides/using-cram-to-compress-bam-files/) )
- suitable for long-term storage
- basic structure of a CRAM file is a series of containers, the first of which holds a compressed copy of the SAM header (for further information [click here](https://en.wikipedia.org/wiki/CRAM_(file_format)#File_format) )

## VCF (Variant Call Format) [4](https://samtools.github.io/hts-specs/VCFv4.2.pdf) [5](https://compbiozurich.org/UZH-BIO392/course-material/2020/2020-09-18-BIO392-files.pdf)
- tab-delimited text format
- stores the results of a single or multiple interpretations of genome sequencing datasets, in comparison to a reference genome (stores only variants)
- contains meta-information lines, a header line, and then data lines each containing information about a position in the genome
- allows extra information to be added to the info field
- standard format for file-based storage of human genome variants

## FASTA [6](https://en.wikipedia.org/wiki/FASTA_format) [7](https://zhanglab.ccmb.med.umich.edu/FASTA/)
- text-based format for representing either nucleotide sequences or amino acid sequences, in which nucleotides or amino acids are represented using single-letter codes
- human readable
- easy to manipulate and parse sequences using text-processing tools
- a sequence in FASTA format begins with a single-line description, followed by lines of sequence data
- the description line is distinguished from the sequence data by a greater-than (">") symbol in the first column.


## MPEG-G (Moving Picture Experts Group) [8](https://www.biorxiv.org/content/10.1101/426353v1.full.pdf)
- compressed data
- enables large scale genomic data processing, transport and sharing
- provides storage and transport capabilities for both raw genomic sequences and genomic sequences aligned to reference genomes







