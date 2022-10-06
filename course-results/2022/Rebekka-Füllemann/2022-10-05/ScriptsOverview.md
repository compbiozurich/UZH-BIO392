# Scripts Overview
## 01_unzip_reads.sh
  - unzips all fastq files in ../data/reads/wildtype and ../data/reads/mutated.
```
#!/bin/env/bash
set -euo pipefail

#The fastq files are compressed to save space, the following commands will unzip them
gunzip ../data/reads/wildtype/*.fq.gz
gunzip ../data/reads/mutated/*.fq.gz

```
## 02_bowtie2_index.sh
  - builds bowtie2 indices for reference sequence.   
(preparation for alignment)
```
#!/bin/env/bash
set -euo pipefail

#Before we can align the reads to the reference with bowtie2, we need to build
#bowtie2 indices for reference sequence.
bowtie2-build \
../data/reference/APC.fa \
../data/reference/APC_idx
```

## 03_alignment_bowtie2.sh	
  - performs the alignment for the mutated reads against the reference sequence
 ```
 #!/bin/env/bash
set -euo pipefail

# Perform the alignment for the wild type reads against the reference sequence
bowtie2 \
-x ../data/reference/APC_idx \
-1 ../data/reads/wildtype/APC_wt_out1.fq -2 ../data/reads/wildtype/APC_wt_out2.fq \
-S ../data/alignments/wildtype/APC_wt.sam \

# Add read group information to the generated alignment (needed by GangSTR later on)
samtools addreplacerg -r ID:sim20220921 -r PL:wgsim -r SM:wt ../data/alignments/wildtype/APC_wt.sam > tmp.sam
mv tmp.sam ../data/alignments/wildtype/APC_wt.sam

# Perform the alignment for the mutated reads against the reference sequence
bowtie2 \
-x ../data/reference/APC_idx \
-1 ../data/reads/mutated/APC_mut_out1.fq -2 ../data/reads/mutated/APC_mut_out2.fq \
-S ../data/alignments/mutated/APC_mut.sam \

# Add read group information to the generated alignment (needed by GangSTR later on)
samtools addreplacerg -r ID:sim20220921 -r PL:wgsim -r SM:wt ../data/alignments/mutated/APC_mut.sam > tmp.sam
mv tmp.sam ../data/alignments/mutated/APC_mut.sam

 ```

## 04_process_alignment.sh	
  - converts sam file to bam file
 ```
 #!/bin/env/bash
set -euo pipefail

# Using samtools view, we convert the alignments generated in the previous step to (binary) BAM format. 
# Then, with samtools sort, we sort the alignments by their starting coordinates.
# Finally, we generate indices for our alignments with samtools index
samtools view -b ../data/alignments/wildtype/APC_wt.sam | samtools sort > ../data/alignments/wildtype/APC_wt.bam
samtools index ../data/alignments/wildtype/APC_wt.bam

samtools view -b ../data/alignments/mutated/APC_mut.sam | samtools sort > ../data/alignments/mutated/APC_mut.bam
samtools index ../data/alignments/mutated/APC_mut.bam
```

## 05_run_gangstr.sh
  - runs gangstr

```
#!/bin/env/bash
set -euo pipefail

# We run the GangSTR STR genotyping tool on both our alignments (wildtype and  mutated)
# GangSTR also needs the reference genome and a tab-separated file indicating where STR loci are located
# in the reference genome.
GangSTR --bam ../data/alignments/mutated/APC_mut.bam \
--ref ../data/reference/APC.fa \
--regions ../data/repeats/APC_repeats.tsv \
--out ../results/mutated/mutated

GangSTR --bam ../data/alignments/wildtype/APC_wt.bam \
--ref ../data/reference/APC.fa \
--regions ../data/repeats/APC_repeats.tsv \
--out ../results/wildtype/wildtype

```

## fixed_bam_run_gangstr.sh
There are problematic alignments in the BAM files. This is fixed in the fixed_bam_run_gangstr.sh using samtools.

``` samtools flagstats ../data/alignments/wildtype/APC_wt.bam``` shows that for the wildtype 50.05% are propperly paired and.   
```samtools flagstats ../data/alignments/mutated/APC_mut.bam``` shows that for the mutant only 49.97% are propperly paired.

```samtools flags```reveals that the flag for propper pairing is ```0x2``` 

generate the proper paired bam files:

```
samtools view -b -f 0x2 ../data/alignments/wildtype/APC_wt.bam > ../data/alignments/wildtype/pp_APC_wt.bam
samtools view -b -f 0x2 ../data/alignments/mutated/APC_mut.bam > ../data/alignments/mutated/pp_APC_mut.bam
```

and check if they are propperly paired:

```
samtools flagstats ../data/alignments/wildtype/pp_APC_wt.bam
samtools flagstats ../data/alignments/mutated/pp_APC_mut.bam
```
now both files are 100.0% propperly paired.


the fixed_bam_run_gangstr.sh script does generate the propperly paired bam files and then runs gangstr:
```
#!/bin/env/bash
set -euo pipefail

# generate propperly paired bam files
samtools view -b -f 0x2 ../data/alignments/wildtype/APC_wt.bam > ../data/alignments/wildtype/pp_APC_wt.bam
samtools index ../data/alignments/wildtype/pp_APC_wt.bam
samtools view -b -f 0x2 ../data/alignments/mutated/APC_mut.bam > ../data/alignments/mutated/pp_APC_mut.bam
samtools index ../data/alignments/mutated/pp_APC_mut.bam

# We run the GangSTR STR genotyping tool on both our alignments (wildtype and  mutated)
# GangSTR also needs the reference genome and a tab-separated file indicating where STR loci are located
# in the reference genome.

GangSTR --bam ../data/alignments/mutated/pp_APC_mut.bam \
--ref ../data/reference/APC.fa \
--regions ../data/repeats/APC_repeats.tsv \
--out ../results/mutated/mutated

GangSTR --bam ../data/alignments/wildtype/pp_APC_wt.bam \
--ref ../data/reference/APC.fa \
--regions ../data/repeats/APC_repeats.tsv \
--out ../results/wildtype/wildtype

```
