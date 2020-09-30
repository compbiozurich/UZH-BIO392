# Variants GATK 

* We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?
> Compared to the reference, the tumor present the C→T variant, while the tumor not. So, we have cross-sample contamination, meaning that we have DNA from the tumor as well as the normal samples. This is supported by the contamination
calculation done in step 3.1.2 (with a contamination ~0.0191). Looking at the filtered BAM file, we don't have the mix between C and T any more but just the variants. 

* What does the coverage tell you ? 
> IGV displays the matching coverage tracks and informs us about the number of reads covering each base. 

*  What are the three grouped tracks for the bamout? 
> The normal and the tumor samples and the haplotype caller (HC). 

* What do the colors indicate?
> The four different haplotypes (HC = 151462549/ 1294269273/ 783029670/ 2025865096). Two of them present the variant C>T. 

* What differentiates the pastel versus gray reads?
> Gray reads do not present hyplotypes, while the pastel reads do. 

**A few definitions**: 
* **Cross-sample contamination**: can occur during samples manipulation and data processing (i.e. sample handling, DNA/RNA extraction, library preparation and amplification, sample multiplexing and inaccurate barcode sequencing) 
accross samples. 

* **HaplotypeCaller**: "Call germline SNPs and indels via local re-assembly of haplotypes" 
