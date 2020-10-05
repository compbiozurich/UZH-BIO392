# Variants GATK 

## 1. Introduction

Genome Analysis Toolkit (GATK) offers various **command-line tools** to anylse high-throughput sequencing data and mainly focuses on **variant discovery**. It provides scripted implementations, which can be found [here](https://gatk.broadinstitute.org/hc/en-us/articles/360035894751), and can be run on [Terra.Bio](https://app.terra.bio/#). 
**Somatic short variant discovery (SNVs + Indels)**: Two main steps: generation of a large set of candidate somatic variants -> filtration to obtain a more confident set of somatic variant calls:
1. **Call candidate variant**:  using **Mutect2** tool (Pair-HMM algorithm) to realign the reads to each haplotype based on a likelihood matrix. 
2. **Calculate contamination**: using **GetPileupSummaries** and **CalculateContamination**, to estimate the fraction of "reads due to cross-sample contamination for each tumor sample and an estimate of the allelic copy number segmentation of each tumor sample".
3. **Filter Variants**: using **FilterMutectCalls**, "to detect alignment artifacts and probabilistic models for strand and orientation bias artifacts, polymerase slippage artifacts, germline variants, and contamination" and to finally filter these sites. 
4. **Annotate Variants**: using **Funcotator**, to annotate each variant. 


![GATK Workflow Diagram](GATK_Worflow)


## 2. Questions 

* We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?
> Compared to the reference, the tumor cells present the C→T variant (location_ chr17:7.674.220), while the tumor not. This is clear since all the tumor samples aligned reads display this variant while the control (normal) samples reads do not (i.e. present a C at this location). 

* What does the coverage tell you ? 
> IGV displays the matching coverage tracks and informs us about the number of reads covering each base. In this particular case, we have a coverage of 131 reads for the C→T variant (40% C, 60% T). 

*  What are the three grouped tracks for the bamout? 
> The new "reference", i.e. haplotype caller (HC), the normal and the tumor samples. 

* What do the colors indicate?
> The four different haplotypes (HC = 151462549/ 1294269273/ 783029670/ 2025865096) from the new reference, from which two present the variant C>T. Each read is then aligned to the HC and the color shows which one specifically. Here, the red reads (from the HC = 151462549) mey mainly represent the normal tissue, while the green reads (from HC = 783029670) the tumor tissue. Two others are also displayed (blue and violet) but rarely present in our samples. 

* What differentiates the pastel versus gray reads?
> Gray reads do not present any haplotype and are therefore aligned with the reference genome (in our case, hg38), while the pastel reads do. 

* How do you feel about this somatic call?
> Really interested! Especially about all the available options, that IGV offers. Regarding the noticed variant C→T, the clear cut between our data (normal vs tumor) gives a good confidence. 


## 3. Definitons 

* **Cross-sample contamination**: can occur during samples manipulation and data processing (i.e. sample handling, DNA/RNA extraction, library preparation and amplification, sample multiplexing and inaccurate barcode sequencing) accross samples. Cross-sample contamination, meaning that we have DNA from the tumor as well as the normal samples? This is supported by the contamination calculation done in step 3.1.2 (with a contamination ~0.0191). Looking at the filtered BAM file, we don't have the mix between C and T any more but just the variants.

* **HaplotypeCaller**: "Call germline SNPs and indels via local re-assembly of haplotypes". 

* **Matched normal control**: to exclude rare germline variations, which were not noticed by the germline resource as well as individual-specific artifacts.

* **Panel of normals**: to exclude additional _noise_ in the sequencing data (not catched by the matched normal control and the population resource) e.g. mapping or datat processing artifacts. It consists of a certain number of exom samples, which were aligned with the same reference genome.

* **Germline resource**:  "to limit the analysis of sites that are commonly variant (like gnomAD)". 

* **FilterMutectCalls**: the following command "uses the annotations within the callset, and if provided, uses the contamination table in filtering", in order to only extract true positives. 

* **FUNCOTATOR**: useful to visualize the impacts of the variant at he transcriptional level (Missense, Nonesens, silent mutation, etc). Here, we used GATK4 Funcotator.  




