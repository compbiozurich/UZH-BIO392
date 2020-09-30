# Questions to GATK


## We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam? What does the coverage tell you? <br>
On the locus 7'674'220 the base in the reference genome shows a C. In the 2_tumor_normal_m2.bam BAM file are the tumor and normal variants combined, where all the transitions of 60% from C to T come form the tumor.bam file (red ones). Further in this 2_tumor_normal_m2.bam are bases that exhibit the same base as the reference genome marked in blue and make up to 40%.


## What are the three grouped tracks for the bamout? What do the colors indicate? What differentiates the pastel versus gray reads? <br>
The three grouped tracks for the bamout are normal.bam, tumor.bam and 2_tumor_normal_m2.bam. The colors indicate the alignments which are taged with HC. I searched in the internet and only found the information, that the gray reads are unmapped mates or from unknown reads.


4. How do you feel about this somatic call? <br>
