# Learning goals

## General questions about the topic of the course
- to demonstrate an understanding of the relationships between inherited and acquired genome variants and their possible implications for understanding phenotypic human variation. What are problems encountered there, and why do we think we need many more genomes, to be available for comparative analyses?
  - able to make comparison, overall statements...
  - Comparative genomics is a field of biological research in which the genomic features of different organisms are compared. The genomic features may include the DNA sequence, genes, and so on. In this branch of genomics, whole or large parts of genomes resulting from genome projects are compared to study basic biological similarities and differences as well as evolutionary relationships between organisms
-	examples of data types beyond genome data relevant for understanding genomic variation should be provided. You should know some disease examples for which a genomic contribution could be described
  - disease examples are fragile X syndrome or Huntington

## Some facts
-	approximate size of human genome is ~3.1 billion base pairs (about ~5 million variants)
-	size of largest human chromosome is appr. 249 million DNA bp (chr1)
-	example(s) for sequencing “depth/coverage” in standard analysis scenarios, and the impact this has to the different genome file formats
  - sequencing depth is defined as the ratio of the total number of bases obtained by sequencing to the size of the genome or the average number of times each base is measured in the genome -> due to the amount of data the best fitting format has to be used
-	(dis)advantages of WES & WGS (and what those acronyms stand for)
  - WGS: Whole genome sequencing -> all DNA, ca 3.1 billion bp
  - WES: Whole exome sequencing -> protein-coding DNA, ca 31 million bp
    - WGS is an attempt to sequence the entire genome (95% to 98% of the genome can be sequenced) and WES focuses on the protein coding sequences (about 2% of the genome)
    - The decision which sequencing should be used depends what is wanted to be known about the organism
    - Both are for detection of pathogenic genetic variations such as single nucleotide polymorphisms (SNPs) and insertions and/or deletions (Indels)
-	What are “genome reference assemblies”, and can you name (some of) them?
  - Reference genomes: describe the consensus DNA sequence -> multiple assemblies of genomes
      - NCBI (National Center for Biotechnology Information)
        - Entry point for genome reference data
        - Human genome assemblies and human variant collections for download
      - USCS (University California Santa Cruz)
        - Originated from the human genome project
        - Most widely used general genome browser, many default tracks and species, with BED files
      - EMBL-EBI: European bioinformatic institute
      - Ensembl
        - Entry point for many genome data services and collections
-	Structuring of HGVS annotations (and - possibly made up - example)
  - HGVS = Human Genome Variation Societies
      - Allows the annotation of sequence variants with relation to a genomic or protein reference
      - example: g.241T>C (genomic reference sequence -> T to C substitution)
- Basic understanding of cytogenetic banding annotation, and (approximate) spatial resolution of such annotations
  - Conventional analysis: 100 genes/band, 9 x 106 base pairs/band and 9Mb band width are observed at the 350 band level
  - Short arm: p, long arm: q
  - Example: 46,XX,del(5p)
-	“1000 genomes” - what are they, and advantages vs. problems associated with using them in genomics workflows
    - Launched: 2008, finished: 2015
    - Goal: establish most detailed catalogue of human genetic variation
    - WGS of pops and also targeted exome sequencing


## General computing & science questions
-	There can be some non-technical questions on e.g. best software practices (OpenSource vs. “black box” software, choice of operating system…). Here, it may be more about justifying an opinion vs. providing a “true answer”.
  - reproducibility (OpenSource, versioning, standard formats, programmatic data manipulation, stable resources/repositories)
  - general workflow steps from reads to variants: sequecing sample -> FASTA/FASTQ -> align to reference -> SAM/BAM -> variant call -> VCF/BED…

## Resources
Some familiarity with selected genome & molecular knowledge resources, their primary goals and example use cases is expected.
- ClinGen and ClinVar -> find relationships between genetic diseases and genes/variants -> creates a relational list of disease, gene and variant
  -	ClinGen
     - Disease associations
  - ClinVar
     - NCBI database resource
     - Basis for curated variant
     - Aggregates information about genomic variation and its relationships to human health
-	UCSC genome browser
   - Hosted by the university of California, Santa Cruz
    - A graphical visualization tool for genomic data
    - Broad collection of species and annotation along with a large suite of tools
-	files used to represent features, and load them into custom tracks (BED, bedGraph, Wiggle, BAM, pgSNP…)
-	importance to select the right genome edition - Why?

## File types in genomics and their use
You should be able to list at least 2-3 core features (main use cases, type, core strength, core weakness).
-	FASTA
  - Unaligned sequence
  - text-based format for representing either nucleotide sequences or peptide sequences, in which base pairs or amino acids are represented using single-letter codes
  - A sequence in FASTA format begins with a single-line description, followed by lines of sequence data. The description line is distinguished from the sequence data by a greater-than (">") symbol in the first column. It is recommended that all lines of text be shorter than 80 characters in length.
-	FASTQ (= FASTA with qualities)
  - Unaligned sequence
-	SAM/BAM
  - Sequence alignment map
  - Tab-delimited text format, used for storage of read alignment formation
  - SAM: human readable, BAM: binary format of SAM
  - SAM format:
      - head section (optional and starts with at sign)
      - alignment section
        - often done after FASTQ -> sequence get aligned
-	BED (=Browser extensible data)
  - Genomic ranges
  - Simple tab-delimited file, contains section/regions of the genome
  - Used to restrict analysis to target regions
  - Often next step after generating SAM files, because they are smaller and easier to handle
-	VCF (more extensive understanding of file structure expected)
  - Variant call format
  - Simple tab-delimited file, built-in logic, but not that easy to read/handle
  - Contains a list of variants
  - Represent variants in a single sample or multiple samples
  - Depth and variant allele freq (VAF) can be shown
  - Worklfow: Sequencer – alignment – deduplication/recalibration – variant calling - vcf


## Tutorials
-	What is “liftover” being used for?
  - converts data between different genome versions and continuous segments
  - performs approximate conversion when direct conversion fails
  -	accept both segment (i.e. start => end) and probe (i.e., single position) data
  - best strategy is to re-align the original data to the target genome version
-	Linkage disequilibrium and population genetics
  - Population genetics: study of genetic variation within the pop -> change of allele frequency, genotype freq over time
  - What do you analyse with PLINK?
      - Genotype/phenotype analysis tool
      -	whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner with genotype/phenotype
      - what can I do with plink?
        - manage genomic data with file format conversion
        - filter by quality,genomic location, list of snps…
        - perform basis statistics and calulcate population genetics metrics
      - how to use plink
        - always consult the LOG file
        - plink has no memory
      - standard plink files are .ped and .map
        - ped contains info about family, phenotype and genotype
        - map contains info about marker and location
- Examples for filters/parameters used in linkage analysis
  - LD (linkage disequilibrium) used as markers

## Genomic privacy
-	genome “Beacons”
    - concept: balanced approach for accessing genome variant data from internationally distributed resources
    - “unbreakable”?
-	de-identification attacks
    - can be linked to a person due to the known variants
