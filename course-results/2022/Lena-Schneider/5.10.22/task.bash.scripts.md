# task: bash sript overview

- 01_unzip_reads.sh: The fastq files are compressed to save space, the following commands will unzip them
- 02_bowtie2_index.sh: Before we can align the reads to the reference with bowtie2, we need to build
  bowtie2 indices for reference sequence.
- 03_alignment_bowtie2.sh: Add read group information to the generated alignment (needed by GangSTR later on). 
  Add read group information to the generated alignment (needed by GangSTR later on)
- 04_process_alignment.sh: # Using samtools view, we convert the alignments generated in the previous step to (binary) BAM format. 
  Then, with samtools sort, we sort the alignments by their starting coordinates.
  Finally, we generate indices for our alignments with samtools index
  samtools view -b ../data/alignments/wildtype/APC_wt.sam | samtools sort > ../data/alignments/wildtype/APC_wt.bam
  samtools index ../data/alignments/wildtype/APC_wt.bam
- 05_run_gangstr.sh: We run the GangSTR STR genotyping tool on both our alignments (wildtype and  mutated)
  GangSTR also needs the reference genome and a tab-separated file indicating where STR loci are located
  in the reference genome.


