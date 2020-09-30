# Variants GATK 

* We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?
> We have cross-sample contamination, meaning that we have DNA from the tumor as well as the normal samples. This is supported by the contamination
calculation done in step 3.1.2 (with a contamination ~0.0191). Looking at the filtered BAM file, we don't have the mix between C and T any more but just the variants. 


*  What are the three grouped tracks for the bamout? 
> 

* What do the colors indicate?
> 

* What differentiates the pastel versus gray reads?
> 

**A few definitions**: 
* **Cross-sample contamination**: can occur during samples manipulation and data processing (i.e. sample handling, DNA/RNA extraction, library preparation and amplification, sample multiplexing and inaccurate barcode sequencing) 
accross samples. 
