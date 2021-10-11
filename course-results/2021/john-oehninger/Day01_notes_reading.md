# Notes on the Articles regarding Genome Sequence Variation

## Finding the Rare Pathogenic Variants in a Human Genome - James P. et al.
This article is short and a nice read. It sums up the essential information on the topic of implementation and use of data gathered from large scale sequencing. It's all about the hunt for rare (or not rare) pathogenic variants in humans.
Here are some key notes from the artice:
* DNA sequencing has become very cheap in comparison to when the technology was invented.
* Genomic information rarely results in a yes or no answer about disease state, but give rise in interpretation of probabilistic estimate of risk.
* Factors regarding the chane of an individual manifesting a genetic disease:
  * Certainty with which a variant is associated with disease
  * Likelihood that an individual with a pathogenic variant will develop disease <br>
 
  `--> Lack of knowledge  of either  factor impairs the predicitve value of genetic information, which results in false-positives  `

* To minimize false-positives,there need to be thresholds and necessary knowledge from sequencing many healthy individuals.
* But we can't only focus on the big image. Studying very specific regions of the genome will come to more usage and implimentation in the real world, especially if these are regions that are already understood well and are pathogenic. Hereditary breast and ovarian cancer are the best example for this. (Sidenote: The most published cancer type is breast cancer.
* The hype of advocacy towards broadly sequencing healthy individuals has a catch that comes with it. We like to justify it by it's cost. But there are other costs that result from this process. These are from the interpretation of these tests and form the downstream actions that ther results trigger.
* There is no systematic evidence that supports genome sequencing in healthy individuals.
* **Sequencing is great and cheap nowadays, but we won't pull a benefit from it by broadly performing it on entire genomes of healthy individuals. Future research should focus on targeted sequencing for screening healthy individuals.**





## The sequence of sequencers: The history of sequencing DNA - James M. HEather & Benjamin Chain
This article reflects on the evolution of the sequencing process, going through the generations of the methods that arose.

### 1<sup>st</sup> generation DNA sequencing:<br>
  * Initial sequencing effort were performed on single-stranded RNA bacteriophages.
  * Fred Sanger and co. developed a technique based on detection of radiolabelled partial-digestion fragments.
  * Alan Coulson and Sanger's "plus and minus" system was developed in 1975. It used DNA polymerase to synthesize from a primer, incorporating radiolabelled nucleotides, before performing a second polymerisation reaction. With this technique, the first DNA genome of a bacteriophage was sequenced.
  * There were many different approaches, and each new one getting better results.
  * Sanger sequencing became the most common technology used to sequence DNA for many many years, due to its robustness, accuracy and ease of use.
  * First generation DNA sequencing produced reads roughly less than a kilobase long. This led to shotgun sequencing, where many different fragments are sequenced and then aligned.


### 2<sup>nd</sup> generation DNA sequencing:
In the second wave of sequencing technology, many different approaches were discovered.
 * Pyrosequencing technique: Can be performed using natural nucleotides and can be observed in real time. This was the first major successful commerical NGS technology.
 * High throughput sequencing (HTS) machines were at the time: GS 20, GS FLX, Solexa
 * Firms producing these technologies: 454, Illumina, Applied Biosystems
 * Technology based on sequenc-by-ligation: DNA nanoballs
 * Ion-Torrent was the first "post-light sequencing" technology, as it functioned with high precision pH measurements.
 * Growth rate of sequencing technology has far exceeded Moore's law, unlike the microchip industry which follows this trend very well.
 * The Illumina sequencing platform has been the most successful to the point of near monopoly and is therefore the greatest contributer to the 2<sup>nd</sup> generation of DNA sequencing.


### 3<sup>rd</sup> generation DNA sequencing:
* They defined the criteria for third generation sequencing to be those capable of sequencing single molecules (SMS), negating the requirements for DNA amplification that is shared by all previous technologies.
* First SMS technology developed by Stephen Quake and commercialized by Helicos BioSciences. The main difference being that it is capapble of sequencing without amplified DNA.
* Most prominent technology (st the time the artice was written) was the single molecule real time (SMRT) platform by Pacific Biosciences.
* The most promising technology though is nanopre sequencing




## A global reference for human genetic variation
* The 1000 Genomes Projects aim was to understant and catologue common human genetic variation by sequencing whole genomes of a diverse set of individuals from many pululations spread around the world.  They sampled 2504 individuals from 26 populations.
* They characterized 88 million variants, 3.6 million short insertions/deletions and 60000 structrual variants.
* Samples were collected geograohically from Africa, East Asia, Europe, South Asia and the Americas.
* The project has contributed 80% of the 100 million variants described in the dbSNP cataloge. Especiall contributing to variation within South Asian and African populations.
* To minimize false positives they introduced a variant quality score threshold to keep this rate below 5%.
* A typical human genome differs at 4.1 - 5 million sites in comparison to the reference genome.
* A typical genome contains an estimated 2100 - 2500 structural variants.
* African ancestry populations have shown the largest number of variant sites, which is empirical evidence for the *out of Africa* model of the origins of humans.
* The majority of variants discovered are rare, which is to be expected.
* Systematic analysis of the data patterns infer information oh population history. Rare variants are typically restricted to closely related populations. 86& of variants were restricted to a single continental group.
* Analysis of shared haplotypes suggests a median common ancestor at ~296 generations ago. Within a population the shared common ancester is estimated at around ~143 generations ago.
* Population sizes of the ancestral populations have also been estimeted. They show a shared emographic history for all humans beyond ~150000 - 200000 years ago.
* The 1000 Genomes Project sampled provide a rough and broad representation of human genetic variation.
* This data will continue to contribute to analyses of human genome variation far into the future.



## Genome structural variation discovery and genotyping
This article discusses the finding that our genome is altered rather as a result of structural variation (including copy number variation (CNV) than just single point mutations (SNPs).



* With all the new sequencing methods, larger amounts of genetic data are being gathered than ever before. With more data at hand, more insights are enabled, which has lead to the discovery of smaller structural variants than seen before.

A copy number variation (CNV) is when the number of copies of a particular gene varies from one individual to the next. Following the completion of the Human Genome Project, it became apparent that the genome experiences gains and losses of genetic material. The extent to which copy number variation contributes to human disease is not yet known. It has long been recognized that some cancers are associated with elevated copy numbers of particular genes.










