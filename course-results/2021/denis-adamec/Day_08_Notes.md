#### Why is it imprtant to construct a CNV map on health individuals of various ethnicities
* If one were to construct a CNV map using only individuals from a single race, it wouldn't be possible to apply this model t o everyone, since people of the same race tend to share similar gene pools - this can lead to biases during the processing of the data.

#### What is the CNV size that the authors defined?
* The authors determined that 4.8 - 9.7% of the human genome contributes to CNVs

#### What are the primary approaches used for CNV detection? And what are the advantages and limitations for these technologies?
* microarrays & NGS Advantages: Fast, precise | Disadvantages: Expensive 

#### The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering?
* A CNVR-clustering algorithm was used to identify sets of variants in which every possible variant pair had at least 50% reciprocal overlap. The clusters were then filtered on the basis of the number of distinct subjects that carry the variant and the number of distinct studies with at least one variant ain the cluster.
This filter excluded singletons 

#### What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively?
* Stringency level 1: At least one subject & one study for each variant
* Stringency level 2: At least two subjects & one study for each variant
* Stringency level 12: At least two subjects and two studiess

#### Which percentage of the genome contributes to CNV in inclusive map and stringency map respectively?
* Inclusive Map: 9.5%
* Stringency Map: 4.8%

#### By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper?
* By Intuition, the non protein-coding genes should be more variable
* The findings: Promoters contained a lot more CNVs than the rest of the entire genome

#### The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential?
* They may be related to late-onset phenotypic consequences that do not substantially reduce fitness. I.e. Age-Related Phenotypes

#### If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV
* Multiple criteria have to be considered: Is the CNV found among the CNVRs of the CNV map & whether it overlaps with medically relevant genes. A list of medically relevant genes which involve CNVs has already been created.
