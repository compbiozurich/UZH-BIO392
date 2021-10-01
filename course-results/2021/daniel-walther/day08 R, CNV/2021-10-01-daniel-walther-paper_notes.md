_daniel walther_

_btw: legend sort of:_
&/ = and/or

# day08

Read [this paper](https://www.nature.com/articles/nrg3871) and think about the following questions:

* Why is important to construct a CNV map on health individuals of various ethnicities? (Introduction)
Different ethnicities show noticeably different phenotypes and thus could have vastly different CNV (Copy Number Variations) and still be healthy. Shortly, differing individuals can represent a healthy human genome.


* What is the CNV size that the authors defined? (Box 1 mentioned in introduction)
> The current map includes microscopic and submicroscopic variants from 50 bp to 3 Mb.

* What are the primary approaches used for CNV detection? And what are the advantages and limitations for these technologies? (CNV discoveries)
> __Microarrays__ and __next-generation sequencing (NGS)__ are now the primary approaches used for CNV detection.
To create a complete map of human CNV, no method/strategy suffices on its own. Certain approaches [which one(s)?] can not capture CNVs in a certain, more interesting with respect to CNV discovery, region [why?].
	> Currently, no single discovery strategy can capture the entire spectrum of structural variations in the genome11,16,43, and ascertainment depends largely on the platforms and algorithms used40,45.

  * array-based methods
    > The __array-based__ detection methods are suitable for studying __quantitative__ variants.
    * low resolution =>inflated total CNV content estimate
	* bad at detecting small variants (short sequences)
	* better at detecting duplications (CGH)
  * __NGS-based approaches__ are more sensitive to small differences.
    * better at detecting smaller variants
	* better at / biased towards detecting deletions
	* high sensitivity & resolution [not sure where the difference lies specifically (?)]

* The authors used [(a)] clustering method[(s)] to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering? (The CNV map)
> The aim of the CNV map is to document the variability of the human genome in healthy individuals from various populations.
  * __reason__ for cluster filtering: To capture the maximum extent of variability
  * Followingly, these __2 criteria__ were chosen/used for cluster filtering:
    * CNVR clusters were created. Every 2 overlapping CNVRs from different studies &/ methods were declared the same variant cluster, if they had at least 50% overlap (that is, with respect to start and end position of respective CNVRs, I assume).
	  > This requirement ensured that structurally distinct CNVs were not merged at this stage. 
    *> Clusters were then filtered on the basis of the number of distinct subjects that carry the variant and the number of distinct studies with at least one variant in the cluster.

* What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively? (The CNV map)
S.L. (Stringency Level) 1: at least one subject and study shows detected a certain CNVR.
S.L. 2: at least two subjects and one study for every variant.
S.L. 12: at least two subjects and two studies.

* Which percentage of the genome contributes to CNV in inclusive map and stringency map respectively? (Properties of the CNV map)
> Depending on the level of stringency of the map, 4.8 - 9.5+-.2% of the human genome contributes to CNVs.
SL1: unknown / unclear
SL2: 4.8% overall
SL12: 9.5% overall

* By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper? (Functional impact of CNV)

* The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential? (Homozygous deleted genes)

* If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV? (Clinical application of the CNV map part in Discussion)