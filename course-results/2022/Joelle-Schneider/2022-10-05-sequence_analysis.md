# Sequence Analysis

## Overview of scripts

### 01_unzip_reads.sh
* unzipping the fastq files 

### 02_bowtie2_index.sh
* building indices for bowtie2 for the reference sequence

### 03_alignment_bowtie2.sh
1. alignment of the wild type reads to the reference sequence
2. Adding read group information to the generated alignment
3. Alignment of mutated reads to the reference sequence
4. Adding read group information to the generated aligment of the mutated reads


### 04_process_alignment.sh
* Now using samtools, converting alignments (SAM format) to the binary format (BAM format)
* Sorting the alignments
* Indexing with samtools index

### 05_run_gangstr.sh
* Running genotyping tool GangSTR on both alignments (WT and mutated)
