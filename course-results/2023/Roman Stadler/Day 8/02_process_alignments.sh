#!/usr/bin/env bash
set -euo pipefail

SAMPLES=("patient_1" "patient_2" "patient_3")
for SAMPLE in ${SAMPLES[@]}; 
do
    ALIGNMENT=$(find ../data/alignments/${SAMPLE}.sam -type f);
    
    # Read group information is added to the alignments. 
    # Not strictly correct but we need to add something or GangSTR will complain later.
    samtools addreplacerg \
        -r ID:sim20230830_${SAMPLE} -r SM:${SAMPLE} -r PL:wgsim -r PU:NA -r LB:NA  "${ALIGNMENT}" | \
    # The alignments are coordinate sorted
    samtools sort | \
    # The alignments are compressed
    samtools view \
        --bam > \
        ../data/alignments/${SAMPLE}.bam;
    
    # The alignments are indexed to allow for random data access
    samtools index \
        ../data/alignments/${SAMPLE}.bam;
done
