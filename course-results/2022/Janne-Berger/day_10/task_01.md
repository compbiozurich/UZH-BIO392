# Scripts
## Script 1
- fastq files are compressed to save space, the given command unzips them
- gunzip
- fastq files
## Script 2
- builds indicies for reference sequence
- bowtie2-built
- fasta
## Script 3
- Perform the alignment for the wild type reads against the reference sequence
- Add read group information to the generated alignment (needed by GangSTR later on)
- Perform the alignment for the mutated reads against the reference sequence
- Add read group information to the generated alignment (needed by GangSTR later on)
- samtools
- sam files and fastq files
## Script 4
- Using samtools view, we convert the alignments generated in the previous step to (binary) BAM format
- Then, with samtools sort, we sort the alignments by their starting coordinates
- Finally, we generate indices for our alignments with samtools index
- samtools
- bam files and sam files
## Script 5
- We run the GangSTR STR genotyping tool on both our alignments (wildtype and  mutated)
- GangSTR also needs the reference genome and a tab-separated file indicating where STR loci are located in the reference genome
- 
- bam files an fasta files and tsv files
