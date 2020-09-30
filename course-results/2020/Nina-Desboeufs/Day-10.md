# Variants GATK 

* We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?
> We have cross-sample contamination, meaning that we have DNA from the tumor as well as the normal samples. This is supported by the contamination calculation done in step 3.1.2. 
ot the exercise (with a contamination ~0.0191). 

* What does the coverage tell you?
>

* What are the three grouped tracks for the bamout? What do the colors indicate? What differentiates the pastel versus gray reads?
> 

* How do you feel about this somatic call?
> 

* Examine the annotations for the TP53 mutation that we viewed earlier in IGV, at chr17:7674220
> 


**A few definitions**: 
* **Cross-sample contamination**: can occur during samples manipulation and data processing (i.e. sample handling, DNA/RNA extraction, library preparation and amplification, sample multiplexing and inaccurate barcode sequencing) 
accross samples. 
