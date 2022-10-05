samtools view -b -f PROPER_PAIR ../data/alignments/wildtype/APC_wt.sam | samtools sort > ../data/alignments/wildtype/APC_wt_proper.bam
samtools index ../data/alignments/wildtype/APC_wt_proper.bam

samtools view -b -f PROPER_PAIR ../data/alignments/mutated//APC_mut.sam | samtools sort > ../data/alignments/mutated/APC_mut_proper.bam
samtools index ../data/alignments/mutated/APC_mut_proper.bam
