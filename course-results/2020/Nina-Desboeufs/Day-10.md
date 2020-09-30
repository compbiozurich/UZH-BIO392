# Variants GATK 

* We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?
> Compared to the reference, the tumor cells present the C→T variant, while the tumor not. This is clear since 100% of the tumor samples reads display this variant 
while the control (normal) samples reads do not (i.e. present a C at this location). \

Cross-sample contamination, meaning that we have DNA from the tumor as well as the normal samples? This is supported by the contamination calculation done in step 3.1.2 (with a contamination ~0.0191). Looking at the filtered BAM file, we don't have the mix between C and T any more but just the variants.

* What does the coverage tell you ? 
> IGV displays the matching coverage tracks and informs us about the number of reads covering each base. 

*  What are the three grouped tracks for the bamout? 
> The new "reference", i.e. haplotype caller (HC), the normal and the tumor samples. 

* What do the colors indicate?
> The four different haplotypes (HC = 151462549/ 1294269273/ 783029670/ 2025865096) from the new reference, from which two present the variant C>T. Each read is then aligned to the HC and the color shows which one specifically. Here, the red reads (from the HC = 151462549) mey mainly represent the normal tissue, while the green reads (from HC = 783029670) the tumor tissue. Two others are also displayed (blue and violet) but rarely present in our samples. 

* What differentiates the pastel versus gray reads?
> Gray reads do not present any haplotype and are therefore aligned with the reference genome (in our case, hg38), while the pastel reads do. 

* How do you feel about this somatic call?
> Really interested! Especially about all the available options, that IGV offers. Regarding the noticed variant C→T, the clear cut between our data (normal vs tumor) gives a good confidence. 

**A few definitions**: 
* **Cross-sample contamination**: can occur during samples manipulation and data processing (i.e. sample handling, DNA/RNA extraction, library preparation and amplification, sample multiplexing and inaccurate barcode sequencing) 
accross samples. 

* **HaplotypeCaller**: "Call germline SNPs and indels via local re-assembly of haplotypes". 
