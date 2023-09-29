#!/usr/bin/env bash
set -euo pipefail

# Files that GangSTR needs to know about
REF="../data/reference/APC.fa"
REGIONS="../data/repeats/APC_repeats.tsv"
SAMPLES=("patient_1" "patient_2" "patient_3")

for SAMPLE in ${SAMPLES[@]};
do
    ALIGNMENT=$(find ../data/alignments/${SAMPLE}.bam -type f);

    # Run GangSTR, put output files in results/<sample_name>
    GangSTR \
        --bam "${ALIGNMENT}" \
        --ref "${REF}" \
        --regions "${REGIONS}" \
        --out ../results/${SAMPLE}/${SAMPLE};
    
    # Compress output VCF file using BGZIP
    bgzip ../results/${SAMPLE}/${SAMPLE}.vcf
done
