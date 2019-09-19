TASK 1
Estimated storage requirements for the 1000 Genome Project
WGS & WES

WGS length 1x: 6, 000, 000, 000 b -> /4*10^6 = space in MB -> 750 MB
WES length about 1% of WGS: 60, 000, 000 -> /4*10^6 = 7.5 MB

WGS for 2504 1x: 187800 MB
WES for 2504 1x: 1878 MB

WGS for 2504 7.4x: 13897200 MB = 13.9 TB
WES for 2504 65.7x: 123384.6 MB = 123.4 GB


FASTQ: text-based format for storing both a DNA sequence and its corresponding quality scores
(File sizes raw text ~300GB per 30x sample)

SAM (Sequence Alignment/Map): a genetic format for storing large nucleotide sequence alignments
(File sizes ~500GB per 30x sample)

The SAM/BAM (Sequence Alignment/Map) file format comes in a plain text format (SAM) and a compressed binary format (BAM)
The BAM format stores aligned reads and is technology independent
(File sizes ~100GB per 30x sample)

CRAM is a new program that can compress SAM/BAM files even more, which makes it suitable for long-term storage.
Lossless compression: When converting BAM -> CRAM -> BAM, the final BAM file will look identical to the initial BAM file.
Lossy compression: You can specify how to deal with the quality scores in a multitude of different way.
                                            From 100GB BAM
BAM to CRAM lossless:         0.736              73.6GB
BAM to CRAM 8bit:             0.42               42GB
BAM to CRAM no quality score: 0.13               13GB

The Variant Call Format (VCF) specifies the format of a text file used in bioinformatics for storing gene sequence variations.
(File sizes ~125MB per 30x sample)

In bioinformatics and biochemistry, the FASTA format is a text-based format for representing either nucleotide sequences or amino acid (protein) sequences,
in which nucleotides or amino acids are represented using single-letter codes. The format also allows for sequence names and comments to precede the sequences.
The simplicity of FASTA format makes it easy to manipulate and parse sequences using text-processing tools and scripting languages like the R programming language, Python, Ruby, and Perl.
(File sizes ~920Mb for GRCh38)

BED (Browser Extensible Data) format provides a flexible way to define the data lines that are displayed in an annotation track.
BED lines have three required fields and nine additional optional fields

Cost per GB storage: 0.5 Fr
