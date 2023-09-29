#!/usr/bin/env bash
set -euo pipefail

SAMPLES=("patient_1" "patient_2" "patient_3")
for SAMPLE in ${SAMPLES[@]}; 
do
    # Align the sequencing reads to the reference genome
    bwa-mem2 mem \
        ../data/reference/APC.fa \
        $(find ../data/reads/${SAMPLE}_{fw,rv}.fq.gz -type f) > \
        ../data/alignments/${SAMPLE}.sam;
done
