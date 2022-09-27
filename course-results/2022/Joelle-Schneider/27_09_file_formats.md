## WGS
Sequencing nearly aöl of the 3 billion nucleotides of the DNA, including all regions such as protein-coding, non-coding telomeric regions.

## WES
Sequencing the nucleotides of exonic / protein-coding regions of an individual's genome

# File Formats
## SAM
- Sequence Alignment Map
- SAM files are text files containing alignments of sequences against a reference sequence
- SAM files can take in raw sequence data from a FASTQ  with a reference genome as a FASTA file and then generate the SAM file containing the reads as well as their genomic locations.

## BAM
- Binary Alignment Map
- The binary file type corresponding to the SAM file, containing the same information but is not anymore human readable.
- Most bioinformatics tools can accept and work with the BAM format.
- Advantages: smaller filesize, software can handle BAM files more efficient, reducing computation costs and storage.

## VCF
- Variant Call Format
- Standard file format for storing variation data
- VCF is used in many large projects, softwares as well as an input for visualization og genomic data.
- Advantages: Unambiguous, scalable, flexible, extra information can be added, millions of variants storable in one VCF file

## FASTA
-











