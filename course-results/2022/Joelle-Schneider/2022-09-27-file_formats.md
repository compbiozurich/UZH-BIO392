## WGS
Sequencing nearly all of the 3 billion nucleotides of the DNA, including all regions such as protein-coding, non-coding and telomeric regions.

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
- A text-based format representing either nucleotide or protein sequences
- Each distinct sequence begins with a line containing a header followed by additional description and in the following lines the sequence data.

## FASTQ
- A Fasta file with quality scores for each base calling in the sequence

# Estimated storage and costs for 1000 genomes

## Whole Genome Sequence 
- Between 80 and 140 GB for a BAM file containing reads of a whole genome. The size is dependent on the coverage / No. of effective reads.
- Therefore, 1000 genome samples take up about 150 TB, even 300 TB including Backups.

[reference: storage of WGS](https://www.strand-ngs.com/support/ngs-data-storage-requirements)

## Costs
- As an example for genomes in a clinical context, there exist different storage posssibilities with different vendors (also cloud storage). Storage is paid per month or year. 
- Estimated costs for storing a single genome (120 GB) in archival tiers is about 14$ over ten years, so for 1000 genomes about 14'000$. Storing data in non-archival tiers can cost up to 20-fold more than the archival tier.

[reference: storage cost](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7276491/)











