# A genomic view of short tandem repeats
## Why is STR variation relevant to health and disease?
- Shows autosomal pattern and have impact on de novo mutations and impact in diseases
- have yet been missing in clinical surroundings because they are not detecable by the standard analyising methods

## What are some of the challenges in analysing STRs from NGS data?
- often shot reads do not span the entire repeat sequence
- they are difficult to align
- with PCR: stutter effects

# TRAL: tandem repeat annotation library
## Why should you use multiple tandem repeat detection algorithms to look for repeats in biological sequence?
- Because every alorithm has it's stengths and flaws as well as different STR regions in which they look into

## What different functionalities does TRAL provide?
- running and parsing of various detection outputs 
- clustering of redundant outputs
- statistical frameworks for filtering false positive annotations
- tandem repeat annotation
- refinement module based on circular profile hidden MArkov models

# Profiling the genome-wide landscape of tandem repeat expansions
## What sets GangSTR apart from other STR genotyping tools?
- Limitations: no unbiased genome-wide analysis od TR lenghts (e.g. require a control cohort)
- GangSTR: relies on a general statistical model incorporating multiple properties of paired-end reads into a single maximum likelihood framework capable of genotyping both normal length and expanded repeats
## What types of information does GangSTR use for STR genotyping?
- end-to-end method that takes sequence alignments and a reference set of TRs as input and outputs estimated diploid repeat lengths
- a maximum likelihood framework incorporating various sources of information from short paired-end reads into a single model that is applied separately to each TR in the genome
