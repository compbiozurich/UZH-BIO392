# General questions about the topic of the course ❗
Understand the relationships between inherited and acquired genome variants and their possible implications for understanding phenotypic human variation. What are problems encountered there, why do we think we need many more genomes, to be available for comparative analyses?
* Relationship between inherited and acquired genome variants:
* 
* Why we need more genomes for comparative analyses: to better represent human genetic diversity, 

Also, examples of data types beyond genome data relevant for understanding genomic varition should be provided. Know some disease examples for which a genomic contribution could be described.
* Disease with genomic contribution: Thalassemia, Cystic Fibrosis, Tay-Sachs disease, Sickle Cell Anemia, Huntington's Disease, etc...

* Approximate size of human genome: 6.4 billion bp
* Size of largest human chromosome: Chromosome 1 -> 248'956'422 bp (GRCh38)

## "Depth/coverage" (Example(s) for sequencing "depth/coverage" in standard analysis scenarios, and the impact this has to the different genome file formats) ❗
* Depth increases with an increasing read length and/or an increasing number of reads and decreases with an increasing length of the haploid genome.
* Breadth of coverage: percentage of target bases that have been sequenced for a given number of times
* Hybrid sequencing: to overcome problems in genome assembly and in placing highly repetitive sequence in a genome
* Depth of coverage is affected by the accuracy of genome alignment algorithms and by the uniqueness or the "mappability" of sequencing reads within a target genome.
* Depth: ChiP-seq > RNA-seq > WES > WGS

## Dis(advantages) of WES & WGS:
* Whole Exome Sequencing (WES):
  * ✔️ Cheaper (makes it feasible to increase the number of samples to be sequenced, enabling large population based comparisons), less time-consuming
  * :x: Omits regulatory regions, frequently requires PCR amplification
* Whole Genome Sequencing (WGS)
  * ✔️ More reliable sequence coverage, allows examination of SNVs, indels, SV and CNVs in coding and non-coding regions of the genome
  * :x: More time-consuming, more expensive

## Genome reference assemblies (What are "genome reference assemblies", and can you name (some of) them?)
A genome reference assembly is a digital nucleic acid sequence database assembled as a representative example of the set of genes for an idividual of a species. The newest genome reference assembly for the human reference genome is called GRCh38 (hg38) and for the mouse GRCm38 (mm10). These reference genomes are typically used as a guide on which new genomes are built, enabling them to be assembled much quicker and cheaper than the initial Human Genome Project.

## HGVS (Structuring of HGVS annotations (and possibly made up -example))
* A nomenclature standard to describe variants.
* Format of a complete variant description: "reference:description" (e.g.; NCM_004006.2:c.4375C>T).
* All variants are described in relation to the reference sequnce (this is essential)
* Substitution: c.4375C> -> C nucleotide at position c.4375 has changed to T
* Deletion: c.4375_4379del -> nucleotides from position c.4375 to 4379 have been deleted
* Duplication: c.4375_4385dup -> nucleotides from position c.4375 to c.4385 have been duplicated
* Insertion: c4375_4376insACCT -> the new sequence "ACCT" was found inserted between positions c.4375 and c.4376

## Cytogenetic banding annotation (Basic understanding of cytogenetic banding annotation, and (approximate) spatial resolution of such annotations)
Each chromosome arm is divided into regions, or cytogenetic bands. The cytogenetic bands are labeled p1,p2,p3, q1,q2,q2, etc., counting from the centromere out toward the telomeres. At higher resolutions, sub-bands can be seen within the bands. The sub-bands are also numbered from the centromere out toward the telomere. The ends of the chromosomes are labeled ptel and qtel.
* Example: 7q31.2 -> the gene is on chromosome 7, q arm, band 3, sub-band 1, sub-sub-band 2.
* Example: 7qtel: end of the long arm of chromosome 7

## "1000 genomes" (what are they, and advantages vs. problems associated with using them in genetic workflows)
* A project set out to provide a comprehensive description of common human genetic variation by applying WGS to a diverse set of individuals from multiple populations.
* Advantages: Broad representation of human genetic variation (with a much improved coverage of South Asian and African populations), use of multiple alaysis strategies, increasing the quality of filtering and mapping, allowing the capture of more diverse types of genetic variants, wide availability of samples and data resulting from the project.
* Problems: Phase 1 of the 1000 Genomes Project has probably missed variants that are private, or recurrent but rare. Low-coverage sequencing, which limited CNV detection. 

------------------------------------------------------------------------------------------------------------------------------------------------------------------

# General computing and science questions (Best software practices (OpenSource vs."black box" software, choice of operating system ...))

## Reproducibility (OpenSource, versioning, standard formats, programmatic data manipulation, stable resources/repositories)
* Need to keep track of our analysis for the sake of reproducibility: bashs scripts.
* Want to avoid manual steps of data analysis using scripts plus version control systems.
* Spreadsheet editors used with seqeunces of mouse clicks are not reproducible.
* Use data standards.
* If really needed, switch to command-line tools but keeping track of the commands used.
* Using control version systems.
* Reproducibility for software
  * Software version needs to be tracked
  * Installs are run command-line, specifying versions and paths
  * Handled through: package managers (apt, yum), package + environment managers (conda), binary download, compilation from source code, (wrap everything into containers, e.g. docker/singularity)
  * Unix solves the reproducibility, scalability and openness for data (text) streams, but extra software might be needed
  * The importance of software versioning for reproducibility: keeping track of the software installed
  * Using open source software (no blackboxes!)
  * Install can be run command-line, so specific versions can be stored and included into the analysis script

## General workflow steps from reads to variants
1. Set the notebook up, get the files, start IGV (Integrative Genomics Viewer)
2. Call somatic SNV & indels with Mutect2
   * Get somatic short mutations on the tumor sample and matched nomral -> The matched normal excludes rare germline variation that is not captured by the germline resource and individual-specific artifacts
   * Make a panel of normals (PoN) -> unfiltered Mutect2 callset generated
3. Filter for confident somatic calls (want to find out, which mutations are likely real somatic muations)
   * Estimate cross-sample contamination: Summarize read support for a set of number of known variant sites and then estimate contamination
   * Filter using the annotations within the callset and (if provided) the contamination table to see if the calls are likely true positives or false positives
4. Review calls with IGV: to get a good somatic callset, we need to compare callsets from different callers, manually review passing and fitler calls and (if necessary) filter additionaly
   * Load results into IGV
   * Set up IGV
   * Navigate to the location of the genome where variants are called
5. Annotate mutations with FUncotator: another approach to filtering mutation calls by the significance of their functional impact
   * Find misssense mutations
   * Find insertions and deletions

------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Resources
Some familiarity with selected genome & molecular knowledge resources, their primary goals and example use cases is expected

## ClinGen
Can look up a gene and find the according disease to it or vice-versa. Tells us information about the genes name, location and product.
Interpreted genome variants with disease association.
Funded project (application/funding limited).
* Authoritative central resource that defines the clinical relevance of genes and variants for use in precision medicine and research
* Gene Disease Validity: Can variation in this gene cause disease?
* Dosage Sensitivity: Does loss or gain of a copy of this gene or genomic region result in disease?
* Variant Pathogenicity: Which changes in this gene cause disease?
* Clinical Actionability: Are there actions that could be taken to improve outcomes for patients with this genetic risk?
* Important in the growing data sharing movement within the clinical genetics community
* Relies on ClinVar as a source for existing data on variants, which are submitted to ClinVar from diverse sources.

## ClinVar
Can tell us for a disease which variants at which gene are relevant.
Basis for curated variant.
Internal NIH resource (dependent on political "goodwill").
* Database of genomic variants and the interpretation of their relevance to disease.
* Important in the growing data sharing movement within the clinical genetics community.
* Critical resource for ClinGen -> Primary site for deposition and retrieval of variant data and annotations from individual submitters

## USCS genome browser
Provides chain files and assemblies which are needed for segment_liftover.
Can look up a gene in different species; find its exact position, neighbouring genes, number of exons and isoform, estimate the size of the exons, 
  * Files used to represent features, and load them into custom tracks (BED, bedGraph, Wiggle, BAM, pgSNP ...)
  * Importance to select the right genome edition - Why? Because in the genes have different positions in the different genome editions.
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
# File types in  genomics and their use (You should be able to list at least 2-3 core features (main use cases, type, core strength, core weakness))
-> Look at file formats cheat-sheet by Max.
*  FASTA
*  FASTQ
*  SAM/BAM/~~CRAM~~
*  BED
*  VCF (mpre extensive understanding of file structure expected)
*  ~~"segment files"~~

------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Protein representation of variants ❓
* Protein sizes
* Resource(s) for 3D protein structures and other protein information resources
* Types pf genome variants with respect to their impact on protein composition
* Amino acid physiochemical properties (size, charge) and effect of variation due to amino aicd properties
* Conservation state of a given AA and its relation to mutation frequency and functional importance

------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Tutorials

## Liftover (What is "liftover" being used for?)
Liftover is the conversion between genome assemblies by coordinate. This is needed since several editions of genomes haven been released over the years.
* Different genome editions lead to shifting positions of defined elements such as genes.
* Local regions are frequently stable between editions.
* Shifts from change in regional lengths are defined in "chain files".
* Chain files serve as guides for positional remapping using lifover methods.

## Linkage disequilibrium and population genetics ❓
* What do you analyse with PLINK: genotype/phenotype data: basic statistics, linkage disequilibrium (LD) calculations, identity by descent (IBD) and identity by state (IBS) matrix calculation, population stratification (like Principal component analysis), association analysis (like genome-wide association study), tests for epistasis
  * Examples for filters/parameters used in linkage analysis

------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Genomic privacy ❓
* Genome "Beacons"
  * Concept
  * "Unbreakable"?
* De-identification attacks
* Genomic privacy, research, comparable risks (opinions)

------------------------------------------------------------------------------------------------------------------------------------------------------------------
File formats sorted by costs: SAM > BAM > FASTA > VCF
