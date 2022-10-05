# Task 01
## Bash scripts

### 01_unzip_reads.sh

The ```fastq``` files are compressed to ```.gz``` files and this script is to uncrompress them.

---

### 02_bowtie2_index.sh

Before we can align the reads to the reference with bowtie2 we need to build bowtie2 indices for reference sequence. This is done with the command ```bowtie2-build```.

---

### 03_alignment_bowtie2.sh

First this script performs the alignment for the wild type reads against the reference sequence. Then it adds read group information to the generated alignment, this is later needed by ```GangSTR```
Then it performs the aligment for the mutated reads against the reference sequence. And in the last step, read group information are generated again.

---

### 04_process_alignment.sh

In the first step the previously generated alignments are converted to binary ```BAM``` format. Then the alignments are sorted by theri starting coordinates.
In the last step, indices are generated for the alignments. This script uses the tools of ```samtools```.

---

### 05_run_gangstr.sh

In this scrip the ```GangSTR``` genotyping tool is run on both of the alignments. A reference genome is needed and a tab-seprating file which indicates the STR loci.
