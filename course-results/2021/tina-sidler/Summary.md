## General questions about the topic of the course
Understand the relationships between inherited and acquired genomevariants and their possible implications for understandingphenotypic human variation. What are problems encountered there, why do we think we need many more genomes, to be available for comparative analyses? Also, examplesof data typesbeyond genome data relevant for understanding genomic varition shouldbeprovided. Knowsome disease examples for whicha genomic contribution could be described.

* Approximate size of human genome: 6.4 billion bp
* Size of largest human chromosome: Chromosome 1 -> 248'956'422 bp (GRCh38)
* Example(s) for sequencing "depth/coverage" in standard analysis scenarios, and the impact this has to the different genome file formats:
* Dis(advantages) of WES & WGS:
  * WES: cheaper (makes it feasible to increase the number of samples to be sequenced, enabling large population based comparisons), less time-consuming. Omits regulatory regions, frequently requires PCR amplification
  * WGS: more reliable sequence coverage, allows examination of SNVs, indels, SV and CNVs in coding and non-coding regions of the genome
* What are "genome reference assemblies", and can you name (some of) them? A genome reference assembly is a digital nucleic acid sequencedatabase assembled as a representativeexample ofthe set of genes in 
* 
* Structuring of HGVS annotations (and possibly made up -example):
* Basic understanding of cytogenetic banding annotation, and (approximate) spatial resolution of such annotations:
* "1000 genomes" - what are they, and advantages vs. problems associated with using them in genetic workflows:

## General computing and science questions
Best software practices (OpenSource vs."black box" software, choice of operating system ...)
* Reproducibility (OpenSource, versioning, standard formats, programmatic data manipulation, stable resources/repositories)
* General workflow steps from reads to variants

## Resources
Some familiarity with selected genome & molecular knowledge resources, their primary goals and example use cases is expected
* ClinGen:
* ClinVar:
* USCS genome browser
  * Files used to represent features, and load them into custom tracks (BED, bedGraph, Wiggle, BAM, pgSNP ...)
  * Importance to select the right genome edition - Why?
  
## File types in  genomics and their use
You should be able to list at least 2-3 core features (main use cases, type, core strength, core weakness).
*  FASTA
*  FASTQ
*  SAM/BAM/~~CRAM~~
*  BED
*  VCF (mpre extensive understanding of file structure expected)
*  ~~"segment files"~~

## Protein representation of variants
* Protein sizes
* Resource(s) for 3D protein structures and other protein information resources
* Types pf genome variants with respect to their impact on protein composition
* Amino acid physiochemical properties (size, charge) and effect of variation due to amino aicd properties
* Conservation state of a given AA and its relation to mutation frequency and functional importance

## Tutorials
* What is "liftover" being used for?
* Linkage disequilibrium and population genetics
  * What do you analyse with PLINK?
  * Examples for filters/parameters used in linkage analysis

## Genomic privacy
* Genome "Beacons"
  * Concept
  * "Unbreakable"?
* De-identification attacks
* Genomic privacy, research, comparable risks (opinions)

----------------------------------------------------------------
File formats sorted by costs: SAM > BAM > FASTA > VCF
