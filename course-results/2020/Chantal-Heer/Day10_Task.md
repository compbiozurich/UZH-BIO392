# GATK tutorial  
*  We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?  
> 2_tumor_normal_m2.bam shows the comparison of the tumor and normal sample. The coloured (red) T indicates that the tumor has a mutation (Cystin replaced by Tyrosin) compared to the normal sample.
*  What are the three grouped tracks for the bamout? 
What do the colors indicate? 
What diﬀerentiates the pastel versus gray reads?
> The alignments are grouped in the folowwing groups: 1. HC (HaplotypeCaller) 2. normal sample (HCC1143_normal) and 3. tumor sample (HCC1143_tumor)  
> The colours indicate the different haloptypes. In our case, there are four different haplotypes in the pastel colours red, blue, green and violet. In the  
> The read strand in pastel red indicates positive rightward (5' -> 3') DNA strand

Now, right-click on the alignments track and

Group by sample
Color alignments by tag: HC
Sort by base
