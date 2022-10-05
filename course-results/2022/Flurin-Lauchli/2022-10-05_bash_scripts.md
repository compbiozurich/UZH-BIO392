# what does this stuff do?

- 01_unzip_reads.sh
  - unzips wildtype and mutated fasta files (fastq?


- 02_bowtie2_index.sh
  - builds bowtie indicies using APC.fa and APC_id

- 03_alignment_bowtie2.sh
  - performs alignment of wt to ref genome
  - adds read group information to the generated alignment (needed by GangSTR later on)
  - .. same for mut

- 04_process_alignment.sh 
  - uses samtools view to convert alignments to BAM
  - sort after starting coordinates & index alignments

- 05_run_gangstr.sh
  - runs gangster STR genotyping algorhithm on both mut and wt
