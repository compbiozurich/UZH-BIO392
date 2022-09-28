#!/bin/env/bash
set -euo pipefail

GangSTR --bam ../data/alignments/sample_1/sample_1.bam \
--ref ../data/reference/APC.fa \
--regions ../data/repeats/APC_repeats.tsv \
--out ../results/sample_1/sample_1

GangSTR --bam ../data/alignments/sample_2/sample_2.bam \
--ref ../data/reference/APC.fa \
--regions ../data/repeats/APC_repeats.tsv \
--out ../results/sample_2/sample_2
