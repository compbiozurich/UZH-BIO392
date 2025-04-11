# *A draft human pangenome reference*
### A paper by Liao, Paten et al., Published in 2023

A brief summary of why the pangenome approach and the T2T approach are interesting, in what regard they differ 
from previous approaches and what future benefits could come from these new approaches. 

A pangenome integrates sequence information from multiple genomes. So instead of looking at only one genome 
and using it as a reference, we now look at genomic information of diverse individuals to create a new, maybe more adequate 
and complete reference. This new reference genome is interesting because it has many advantages compared to older reference 
genomes like GRCh38. One of the key advantages is that it is able to represent polymorphic structural variants, because with 
the pangenome we allow for multiple versions of one genomic region to coexist. With that we can see genetic diversity across 
individuals but also across populations. When looking at a single reference genome, we fail to see these variations, which can 
lead to reference bias.


**What’s the T2T approach and what is its role in the Human Pangenome Project?**

In the Telomere-to Telomere (T2T) approach a genome is sequenced completely, meaning from one telomere to the other telomere, 
without gaps. This is possible thanks to long-read sequencing (PacBio HiFi for example). With this T2T approach we can capture 
all genetic sequences, also sequences that were hard to sequence in the past.

In older reference genomes like GRCh38 we still had unresolved regions, mostly in centromeres but also in repeat-rich areas 
in general and regions with segmental duplications, which are often close to the telomeres. This was mainly due to technical 
difficulties; on one hand we have had the short-read sequencing limitations and on the other hand we have had assemblers 
that couldn’t resolve duplications for example. The T2T approach eliminates these gaps. This is from importance for the 
pangenome project, as they are using T2T methods to assemble their genomes and therefore ensuring that they have full 
assemblies.

All in all, we can **summarize** the advantages of the T2T approach and the pangenome project as following:

  * Performance improvement in challenging and medically relevant regions, which could for example be important for disease diagnosis and precision medicine in general.
  * These approaches are better in calling small variants than older approaches.
  * More structural variants are detected, a lot of them were missed when we have short-read-based sequencing techniques.
  * Better representation of centromeric, sub-telomeric and repeat-rich regions.
  * Compared to a linear reference we now have a graph-based genome, which allows multiple genetic paths.

In **conclusion** we can say that these are very promising approaches, which could lead to more precise disease diagnosis, 
more effective drug development but could also give more insights into human evolutionary history for example. 
There are many remaining challenges, as for example the remaining base level sequencing errors. One of the next goals would be to include many more diverse individuals in the pangenome and to refine the pangenome alignment methods. These methods could then also further be of value for other species for example.
