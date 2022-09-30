## Analysing short tandem repeats in genomic sequences - Theory Notes

* short-tandem repeats (STRs): repetitions of 1-6 nt DNA motifs
* STRs are some of the **fastest mutating** loci in the genome
* functional consequences of mutations in STRs: affect gene regualation, induce frameshift mutations, affect alternative splicing
* ‼️ STRs are challenging to genotype: need special tools to genotype them $\Rightarrow$ **GangSTR**
* classic use case: paternity testing

### GangSTR
* used for *repeat genotyping*: determine how long repeats are in a given sequencing sample
* input:
  1) reference genome (`.fasta`)
  2) alignment (`.bam`)
  3) locations of STRs in reference genome (*we need to generate this file ourselves*)
* output:
  1) STR genotype (`.vcf`)

### TRAL (Tandem Repeat Annotation Library)
* used for *repeat detection*: determining where repeats are located and how long they are in the reference sequence
* it's a Python library


## Task 1 (STR background reading)

**Why is STR variation relevant to health and disease?**
* Short tandem repeats (STRs) are some of the fastest mutating loci in the genome.
* STRs play a widespread role in regulating gene expression and other molecular phenotypes: [...] they likely make significant contributions to
Mendelian diseases, complex traits, and cancer

**What are some of the challenges in analysing STRs from NGS data?**
(1) short reads often do not span entire repeats, effectively reducing the number of informative reads. 
(2) STR variations present as large insertions or deletions that may be difficult to align to a reference genome, and thus introduce significant mapping bias toward shorter alleles. 
(3) PCR amplification during library preparation often introduces “stutter” noise in the number of repeats at STRs.

(answers are taken from the paper https://doi.org/10.1016/j.gde.2017.01.012)


## Task 2 (Introduction to TRAL)
**Why should you use multiple tandem repeat detection algorithms to look for repeats in biological sequence?**
Currently available TRDs (tandem repeat detectors) do not provide exhaustive detections, and combining TRs from several TRDs is essential for
reliable TR annotation (Schaper et al., 2012).

**What different functionalities does TRAL provide?**
1. Annotate with sequence profile models
2. Annotate with de novo tandem repeat detectors
3. Identify and filter overlapping annotations
4. Test and filter for statistical significance
5. Retrieve tandem repeat characteristics
