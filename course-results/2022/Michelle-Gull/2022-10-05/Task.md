# Sequence analysis and file formats in bioinformatics
## Task 1
* In the ‘scripts’ directory, you will find 5 numbered bash scripts:   
<img width="723" alt="Screen Shot 2022-10-05 at 09 20 56" src="https://user-images.githubusercontent.com/114056296/194003220-657e530e-85e4-49f6-b945-bbbdcd24e85b.png">
    
* For each of the scricpts, write a brief overview of what tasks the script performs and which tools and file formats are used, then run it ('bash <script_name')   
    * 01_unzip_reads.sh: The fastq files are compressed to save space, the following commands will unzip them
    * 02_bowtie2_index.sh: Before we can align the reads to the reference with bowtie2, we need to build bowtie2 indices for reference sequence.
    * 03_alignment_bowtie2.sh: Add read group information to the generated alignment (needed by GangSTR later on)
    * 04_process_alignment.sh: Using samtools view, we convert the alignments generated in the previous step to (binary) BAM format. Then, with samtools sort, we sort the alignments by their starting coordinates. Finally, we generate indices for our alignments with samtools index
    * 05_run_gangstr.sh: We run the GangSTR STR genotyping tool on both our alignments (wildtype and  mutated). GangSTR also needs the reference genome and a tab-separated file indicating where STR loci are located in the reference genome.


