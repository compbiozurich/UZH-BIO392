# Scripts Overview
* 01_unzip_reads.sh
  - unzips all fastq files in ../data/reads/wildtype and ../data/reads/mutated

* 02_bowtie2_index.sh
  - builds bowtie2 indices for reference sequence.   
(preparation for alignment)

* 03_alignment_bowtie2.sh	
  - performs the alignment for the mutated reads against the reference sequence

* 04_process_alignment.sh	
  - converts sam file to bam file

* 05_run_gangstr.sh
  - runs gangstr
