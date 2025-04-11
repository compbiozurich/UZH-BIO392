# Homework: 2025.04.08

## Reference

Liao WW, Asri M, Ebler J, Doerr D, Haukness M, Hickey G, Lu S, Lucas JK, Monlong J, Abel HJ, Buonaiuto S, Chang XH, Cheng H, Chu J, Colonna V, Eizenga JM, Feng X, Fischer C, Fulton RS, Garg S, Groza C, Guarracino A, Harvey WT, Heumos S, Howe K, Jain M, Lu TY, Markello C, Martin FJ, Mitchell MW, Munson KM, Mwaniki MN, Novak AM, Olsen HE, Pesout T, Porubsky D, Prins P, Sibbesen JA, Sirén J, Tomlinson C, Villani F, Vollger MR, Antonacci-Fulton LL, Baid G, Baker CA, Belyaeva A, Billis K, Carroll A, Chang PC, Cody S, Cook DE, Cook-Deegan RM, Cornejo OE, Diekhans M, Ebert P, Fairley S, Fedrigo O, Felsenfeld AL, Formenti G, Frankish A, Gao Y, Garrison NA, Giron CG, Green RE, Haggerty L, Hoekzema K, Hourlier T, Ji HP, Kenny EE, Koenig BA, Kolesnikov A, Korbel JO, Kordosky J, Koren S, Lee H, Lewis AP, Magalhães H, Marco-Sola S, Marijon P, McCartney A, McDaniel J, Mountcastle J, Nattestad M, Nurk S, Olson ND, Popejoy AB, Puiu D, Rautiainen M, Regier AA, Rhie A, Sacco S, Sanders AD, Schneider VA, Schultz BI, Shafin K, Smith MW, Sofia HJ, Abou Tayoun AN, Thibaud-Nissen F, Tricomi FF, Wagner J, Walenz B, Wood JMD, Zimin AV, Bourque G, Chaisson MJP, Flicek P, Phillippy AM, Zook JM, Eichler EE, Haussler D, Wang T, Jarvis ED, Miga KH, Garrison E, Marschall T, Hall IM, Li H, Paten B.  
**A draft human pangenome reference.** *Nature.* 2023 May;617(7960):312–324. doi: 10.1038/s41586-023-05896-x.


## Why is the Pangenome project interesting?

The pangenome project is interesting because it aims to overcome the limitations of the current human reference genome (GRCh38), which represents a single linear mosaic haplotype. GRCh38 lacks large portions of polymorphic sequence found in the human population, particularly within structural variants (SVs), leading to an observational bias.

By constructing a pangenome using 47 phased, diploid assemblies from genetically diverse individuals, the Human Pangenome Reference Consortium (HPRC) provides a reference that captures known variants and haplotypes and reveals new alleles at structurally complex loci. This enables more accurate genomic analysis: for example, small variant discovery errors were reduced by 34% and structural variant detection increased by 104% compared with GRCh38-based workflows.


## What makes the Telomere-to-Telomere (T2T) approach different from previous reference genome constructions?

The T2T approach differs from previous reference genome constructions in that it produced the first complete sequence of a haploid human genome (T2T-CHM13), offering a contiguous representation of each autosome and chromosome X.

Unlike GRCh38, which contains 210 Mb of gap or computationally simulated sequences (6.7% of the primary scaffolds), T2T-CHM13 covers regions previously inaccessible, such as centromeres and satellite arrays. For example, it enables the discovery of 3.7 million additional single-nucleotide polymorphisms (SNPs) and improves the representation of copy number variants (CNVs) in the 1000 Genomes Project.


## Why is the T2T genome not a classical reference genome?

The T2T-CHM13 remains a single genome and cannot represent the full spectrum of human genetic diversity. The reference consists of only one haplotype and lacks alternative alleles for structural variants that are polymorphic within the population.

As a result, two-thirds of SVs have been missed in studies using short-read data aligned to the T2T genome or GRCh38. Thus, T2T-CHM13, while complete, does not function as a comprehensive population reference and still introduces reference bias in genomic analyses.


## How does the pangenome address the limitations of the T2T genome to build a true reference genome?

The pangenome addresses the limitations of T2T-CHM13 by incorporating 47 phased, diploid genome assemblies from a diverse cohort, capturing both common and rare variants across different ancestry groups.

Unlike T2T-CHM13, the pangenome enables the representation of structural variation at single-base resolution and includes 119 million base pairs of euchromatic polymorphic sequences and 1,115 gene duplications relative to GRCh38. Roughly 90 million of these additional base pairs are derived from structural variation.

By aligning all assemblies to build a unified graph representation, the pangenome removes the constraints of a single haploid reference and serves as a true population reference that better represents global genomic diversity. It also includes T2T-CHM13 as one of the assemblies.


## What is being sequenced and why work?

The pangenome project sequenced 47 fully phased, diploid genome assemblies representing genetically diverse individuals from the 1000 Genomes Project and other cohorts. Each sample was deeply sequenced using multiple technologies including PacBio HiFi, Oxford Nanopore Technologies, Bionano optical mapping, and Hi-C, with Illumina sequencing used for parental data.

The high sequence coverage (average 39.7× HiFi depth) ensures comprehensive variant discovery irrespective of allele frequency. The assemblies were constructed using the Trio-Hifiasm assembler, which leverages both long reads and parental short reads for near-complete phasing.

The rationale for this work is to construct a population-wide reference that captures the full spectrum of human genetic variation, improves variant calling, and enables unbiased genome analysis.


## What additional contribution can it offer for genomics?

The pangenome contributes significantly to genomics by enabling comprehensive analysis of structural variation, gene duplications, and variant phasing. It allows accurate transcriptome annotation.

Moreover, it permits the resolution of complex structural haplotypes—such as those at RHD–RHCE, HLA-A, CYP2D6–CYP2D7, C4, and LPA—at single-base resolution, something that was previously unachievable with short-read data.

The pangenome also serves as a benchmark for the development of new tools and resources for genome analysis, including graph-based variant calling and pangenome alignment software.


## What future benefit for genome data analysis can the T2T/pangenome approach attribute?

They enable reference-free or reference-aware variant calling with higher precision and recall. This leads to more accurate detection of both small and structural variants, especially in medically relevant and repetitive genomic regions.

As the HPRC expands to 700 haplotypes, it is projected to add at least 150 Mb of euchromatic sequence, further enhancing the comprehensiveness of the pangenome.

Together, these advances will improve diagnostic yield, uncover previously undetectable variants, and support precision medicine by providing a better understanding of individual genetic backgrounds.
