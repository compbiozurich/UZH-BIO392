# Sequence analysis and file formats in bioinformatics

## Task 1

`01_unzip_reads.sh`
* tasks performed: The `.fastq` input files are compressed to save space, the script will unzip them
* used tools: `gunzip`
* used file formats: `.fastq`

`02_bowtie2_index.sh`
* tasks performed: Before we can align the reads to the reference with bowtie2, we need to build
#bowtie2 indices for reference sequence.
* used tools: `bowtie2-build`
* used file formats: `.fa`

`03_alignment_bowtie2.sh`
* tasks performed:
  * Perform the alignment for the wild type reads against the reference sequence 
  * Add wt read group information to the generated alignment (needed by GangSTR later on)
  * Perform the alignment for the mutated reads against the reference sequence
  * Add mutated read group information to the generated alignment (needed by GangSTR later on)
* used tools: `bowtie2`
* used file formats: `.fastq`, `.sam`

`04_process_alignment.sh`
* tasks performed:
  * Using samtools view, we convert the alignments generated in the previous step to (binary) BAM format. 
  * Then, with samtools sort, we sort the alignments by their starting coordinates
  * Finally, we generate indices for our alignments with samtools index 
* used tools: `samtools`
* used file formats: `.bam`, `.sam`

`05_run_gangstr.sh`
* tasks performed:
  * We run the GangSTR STR genotyping tool on both our alignments (wildtype and  mutated)
* used tools: `GangSTR`, 
* used file formats: `.bam`, `.fa`, `.tsv`

## Task 2
See `.ipynb` file.
