####  We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?

> While a mutation from C to T occurred in some of tumor cells( 60% T, 40%C) at this specific position, normal cells only show a Cytosin.



#### What does the coverage tell you?

> Coverage defines the number of read's bases, which are covering the reference genome at a specifc position.



#### What are the three grouped tracks for the bamout?

> The three grouped tracks are the normal samples, tumor samples and the haplotype caller (HC).



#### What do the colors indicate? 

> The colors indicate to which of the 4 haplotypes the read belongs to. The red colour represents reads from the normal tissue (no variation observed) while the green one represents reads from tumor cells (C->T mutation).


#### What differentiates the pastel versus gray reads?

> The pastel reads represent to which HC this read belongs to and where there was a difference compared to the reference genome The gray reads represent bases of reads from the reference genome.

#### How do you feel about this somatic call?
> This variant could be a potential variant to distinguish  breast tumor samples from normal ones, however because we don't have a big difference in the coverage between T and C ( 60%T and 40% C) and that some gray reads have T variant instead of C, it is not really possible to make any statement for this specific variant to be present in all breast tumor samples.

