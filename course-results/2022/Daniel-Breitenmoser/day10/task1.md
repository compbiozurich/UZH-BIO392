# Task1


01_unzip_reads.sh: fastq files are compressed to save space. this script decompresses the files

02_bowtie2_index.sh: we need to build bowtie2 indices for reference sequence so that we can align reads to the reference with bowtie2


03_alignment_bowtie2.sh: Perform the alignment for the wild type reads against the reference sequence
bowtie2, add read group information to the generated alignment, Perform the alignment for the mutated reads against the reference sequence
bowtie2, Add read group information to the generated alignment.


04_process_alignment.sh: Using samtools view, we convert the alignments generated in the previous step to (binary) BAM format. 
Then, with samtools sort, we sort the alignments by their starting coordinates.
Finally, we generate indices for our alignments with samtools index


05_run_gangstr.sh: We run the GangSTR STR genotyping tool on both our alignments (wildtype and  mutated)
GangSTR also needs the reference genome and a tab-separated file indicating where STR loci are located
in the reference genome.
