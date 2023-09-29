# Estimate Storage Requirements for 1000 Genomes

## Whole-Genome Sequencing (WGS) and Whole-Exome Sequencing (WES)
In WGS the order of all nucleotides in a genome is determined it can uncover variation in any part of the human genome, including coding, noncoding and mitochondrial DNA regions. This leads to a big amount of data and time to decipher; this increases the costs and time required for analysis. In comparison WES focuses on the genomic proteincoding regions (exons), which is more cost effective and needs less time to perform the analysis of the data.


## File Types
### FASTA  
FASTA files are used for storing nucleotide or protein sequences. It is used for storing reference genomes, query sequences, and sequence databases. Furthermore in sequence alignment, sequence analysis, and sequence database searches FASTA files are used. 

### SAM / BAM / CRAM
- **SAM files** are used to store the results of sequence alignment. It contains detailed information about the alignment of sequencing reads mapped against a reference genome. They are used for tasks such as variant calling, quality control, visualization, and downstream analysis. 
- **BAM files** contain the same information as SAM files, except they are in binary file format and therefore not readable by humans. BAM files are smaller and more efficient for software to work with than SAM files, saving time and reducing costs of computation and storage. BAM files are commonly used for visualization, variant calling, and various bioinformatics analyses.
- **CRAM files** are used when storage space is a concern.  CRAM is a compressed version of BAM that reduces storage requirements. 

### Variant Call Format (VCF)
VCF files are used to store information about genetic variants identified in DNA or RNA sequencing data. SNPs, insertions, deletions and other genetic variations are stored in the file. They are used in variant calling pipelines to report the presence and characteristics of genetic variants, making them crucial for genetic research, disease association studies, and population genetics.(last week)

### Storage/Costs for 1000 Genomes
For each base (TCGA) only 2 bits of storage are needed, therefore a genome with 3 billion bases needs 6 billion bits (0.75GB) to be stored. Consequently, 1000 genomes need 1000*6’000’000’000b storage this is about 750GB.  (Slides)


### Sources
- https://sequencing.roche.com/us/en/article-listing/wes-wgs-custom.html#:~:text=Although%20whole%2Dgenome%20sequencing%20(WGS,time%20or%20resources%20are%20limited.
- https://zymoresearch.eu/blogs/blog/what-are-sam-and-bam-files

