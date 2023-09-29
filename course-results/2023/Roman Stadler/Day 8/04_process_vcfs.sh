#!/usr/bin/env bash
set -euo pipefail

SAMPLES=("patient_1" "patient_2" "patient_3")

for SAMPLE in ${SAMPLES[@]};
do
    VCF=$(find ../results/${SAMPLE}/${SAMPLE}.vcf.gz -type f);

    # Index compressed VCF files using bcftools
    bcftools index ${VCF};
done

# Combine the VCF files of each sample into one VCF file
bcftools merge \
    $(find ../results -name "*.vcf.gz") > \
    ../results/merged_results.vcf

# Generate a tabular summary file with the information that we will need later
bcftools query \
    -H \
    -f '%CHROM\t%POS\t%REF\t%ALT[\t%GT]\n' \
    ../results/merged_results.vcf > \
    ../results/merged_results_summary.tsv
