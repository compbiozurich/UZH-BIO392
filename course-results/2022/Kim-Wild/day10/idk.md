notes

**01_unzip_reads.sh:** unzip compressed fastq files \
gunzip ../data/reads/wildtype/*.fq.gz \
gunzip ../data/reads/mutated/*.fq.gz


**02_bowtie2_index.sh:** build bowtie indicies for refrence sequence \
../data/reference/APC.fa \
../data/reference/APC_idx


**03_alignment_bowtie2.sh:** \
alignment for the wild type reads against the reference sequence: \
-x ../data/reference/APC_idx \
-1 ../data/reads/wildtype/APC_wt_out1.fq -2 ../data/reads/wildtype/APC_wt_out2.fq \
-S ../data/alignments/wildtype/APC_wt.sam 

add read group information to the generated alignment: \ 
samtools addreplacerg -r ID:sim20220921 -r PL:wgsim -r SM:wt ../data/alignments/wildtype/APC_wt.sam > tmp.sam
mv tmp.sam ../data/alignments/wildtype/APC_wt.sam

alignment for the mutated reads against the reference sequence: \
-x ../data/reference/APC_idx \
-1 ../data/reads/mutated/APC_mut_out1.fq -2 ../data/reads/mutated/APC_mut_out2.fq \
-S ../data/alignments/mutated/APC_mut.sam 


**04_process_alignment.sh:** \
samtools view: convert the alignments generated in the previous step to (binary) BAM format \ 
samtools sort: sort the alignments by their starting coordinates \
generate indices for our alignments with samtools index

samtools view -b ../data/alignments/wildtype/APC_wt.sam | samtools sort > ../data/alignments/wildtype/APC_wt.bam
samtools index ../data/alignments/wildtype/APC_wt.bam

samtools view -b ../data/alignments/mutated/APC_mut.sam | samtools sort > ../data/alignments/mutated/APC_mut.bam
samtools index ../data/alignments/mutated/APC_mut.bam


**05_run_gangstr.sh:** \
run the GangSTR STR genotyping tool on both our alignments \
needs the reference genome and a tab-separated file indicating where STR loci are located in the refrence genome \ 

GangSTR --bam ../data/alignments/mutated/APC_mut.bam \
--ref ../data/reference/APC.fa \
--regions ../data/repeats/APC_repeats.tsv \
--out ../results/mutated/mutated

GangSTR --bam ../data/alignments/wildtype/APC_wt.bam \
--ref ../data/reference/APC.fa \
--regions ../data/repeats/APC_repeats.tsv \
--out ../results/wildtype/wildtype
