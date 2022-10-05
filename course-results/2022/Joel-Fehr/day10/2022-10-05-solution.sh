#!/bin/env/bash
set -euo pipefail

# Using samtools view, we convert the alignments generated in the previous step to (binary) BAM format. 
# Then, with samtools sort, we sort the alignments by their starting coordinates.
# Finally, we generate indices for our alignments with samtools index
samtools view -b -f 0x2 ../data/alignments/wildtype/APC_wt.sam | samtools sort > ../data/alignments/wildtype/APC_wt_proper.bam
samtools index ../data/alignments/wildtype/APC_wt_proper.bam

samtools view -b -f 0x2 ../data/alignments/mutated//APC_mut.sam | samtools sort > ../data/alignments/mutated/APC_mut_proper.bam
samtools index ../data/alignments/mutated/APC_mut_proper.bam
