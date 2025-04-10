## Day II - Telomere-to-Telomere (T2T) Genome Project
#### Sandrin Hunkeler  (MSc. in Informatics)


---

### 1. Why It's Interesting

#### Genome Reference Consortium (GRC)
Since its initial release in 2000, the Genome Reference Consortium (GRC) has not achieved a complete model of the human genome. Its assembly, based on sequenced bacterial artificial chromosomes (BACs), is incomplete for repetitive sequences. The GRCh38 reference assembly contains approximately 151 Mbp of missing sequences over the genome, especially in pericentromeric and subtelomeric regions, heterochromatin, segmental duplications, ampliconic gene arrays, and ribosomal DNA (rDNA) arrays. All of which are highly relevant for fundamental cellular processes.


#### Contribution

The newly introduced T2T-CHM13 reference assembly completes the final 8% of the human genome, including all centromeric regions and the entire short arms of the five acrocentric chromosomes. It was created using the complementary strengths of PacBio's HiFi and Oxford's Nanopore ultra-long reads. The T2T-CHM13 assembly is the first complete human genome sequence without any gaps resulting in a telomere-to-telomere across all 22 autosomes and chromosome X. It contains 3,054,815,472 bp of nuclear DNA and a 16,569 bp mitochondrial genome. In comparison to GRCh38, it discovered 238 Mbp of additional sequence, 182 Mbp of which does not align with GRCh38 over ≥1 Mbp intervals.

The assembly resolves the full structure of all centromeric satellite arrays, recent segmental duplications, 219 full-length rDNA units, and the entire short arms of acrocentric chromosomes, which were previously represented as >150 Mbp of placeholder or synthetic sequence in GRCh38. In addition, it includes 1,956 new gene predictions (99 assumed to be protein coding). Compared to the 8% of unresolved genome regions of GRCh38, T2T-CHM13 only consists of 0.3% potentially missing due to errors.

---

### 2. What Makes the T2T Approach Different


#### PacBio and Oxford Nanopore
PacBio’s long, multi-kilobase single reads were helpful at resolving large gaps in the GRCh38 assembly. Oxford Nanopore's ultra-long reads, exceeding 100 kbp, enabled the first complete assembly of a human centromere (ChrY) and an entire chromosome (ChrX). However, the relatively high error rates (>5%) of both technologies made it difficult to assemble long repeat arrays. PacBio’s latest circular consensus sequencing, known as "HiFi", was introduced as a game changer providing reads up to 20 kbp in length with an error rate of 0.1%.

#### CHM13hTERT
GRCh38 was created from multiple individuals which resulted in a mosaic of haplotypes rather than a single consistent diploid genome. In contrast, T2T assemble the CHM13hTERT cell line which was later analyzed to be, with the exception of a few thousand variants and a megabase-scale deletion, nearly homozygous. Most CHM genomes originate from the loss of the maternal DNA and duplication of the paternal parts and are homozygous with a 46,XX karyotype. 

#### Graph Walk
The HiFi reads were converted into a bidirected string graph, where nodes are assembled sequences with a very low error rate and edges are overlaps between them. The nodes themselves were compressed and corrected for simple sequence repeats. In contrast to previous assembly algorithms, the graph walk for T2T was based only on exact overlaps instead of involving stochastic or heuristic models. Assembly of rRNA, which occur in multiples of 45 kbp repeats within short arms of acrocentric chromosomes, was achieved using Bruijn graph algorithm before being corrected by HiFi reads. 


---

### 3. Future Benefits of T2T for Genome Analysis

The T2T-CHM13 assembly is a significantly more complete, representative, and accurate reference than GRCh38. Especially for variation that lies within the most repetitive regions of the genome. Disease research focusing on *Copy Number Variations* (CNVs) gains new insights from the resolved 151 Mbp artificial regions of GRC38. Furthermore, aligning long-read sequences will be easier with the new quality gold standard. This provides the *Human Pangenome Reference Consortium* (HPRC) with a new toolset to create a diverse collection of reference genomes, overcoming the limitations of a single model. Its achievements also are a pathway for precisely sequencing the ChrY using HiFi technique and automate the assembly of diploid genomes.


---

### References

[1]
https://pubmed.ncbi.nlm.nih.gov/35357919/  
@article{article,  
author = {Nurk, Sergey and Koren, Sergey and Rhie, Arang and Rautiainen, Mikko and Bzikadze, Andrey and Mikheenko, Alla and Vollger, Mitchell and Altemose, Nicolas and Uralsky, Lev and Gershman, Ariel and Aganezov, Sergey and Hoyt, Savannah and Diekhans, Mark and Logsdon, Glennis and Alonge, Michael and Antonarakis, Stylianos and Borchers, Matthew and Bouffard, Gerry and Brooks, Shelise and Phillippy, Adam},  
year = {2022},  
month = {04},  
pages = {44-53},  
title = {The complete sequence of a human genome},  
volume = {376},  
journal = {Science (New York, N.Y.)},  
doi = {10.1126/science.abj6987}  
}

[2] 
https://www.researchgate.net/publication/370656164_A_draft_human_pangenome_reference  
@article{article,  
author = {Liao, Wen-Wei and Asri, Mobin and Ebler, Jana and Doerr, Daniel and Haukness, Marina and Hickey, Glenn and Lu, Shuangjia and Lucas, Julian and Monlong, Jean and Abel, Haley and Buonaiuto, Silvia and Chang, Xian and Cheng, Haoyu and Chu, Justin and Colonna, Vincenza and Eizenga, Jordan and Feng, Xiaowen and Fischer, Christian and Paten, Benedict},  
year = {2023},  
month = {05},  
pages = {312-324},  
title = {A draft human pangenome reference},  
volume = {617},  
journal = {Nature},  
doi = {10.1038/s41586-023-05896-x}  
}
