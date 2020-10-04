### General questions about the topic of the course
You should be able to demonstrate an understanding of the relationships between inherited and acquired genome variants and their possible implications for understanding phenotypic human variation. What are problems encountered there, and why do we think we need many more genomes, to be available for comparative analyses? Also, examples of data types beyond genome data relevant for understanding genomic variation should be provided. You should know some disease examples for which a genomic contribution could be described.

### Some factlets:

**- approximate size of human genome**

   - 3.1 billion base pairs haploid, 22 paired chromosomes + 23rd pairs of sex chromosomes, ~1.5% of the total human genome are exons
    
**- size of largest human chromosome**

   - chromosome 1: about 249 million nucleotide base pairs, represents about 8% of the total DNA in human cells
    
**- example(s) for sequencing “depth/coverage” in standard analysis scenarios, and the impact this has to the different genome file formats**

   - Why: Even though the sequencing accuracy for each individual nucleotide is very high, the very large number of nucleotides in the genome means that if an individual genome is only sequenced once, there will be a significant number of sequencing errors. Furthermore, many positions in a genome contain rare single-nucleotide polymorphisms (SNPs). Hence to distinguish between sequencing errors and true SNPs, it is necessary to increase the sequencing accuracy even further by sequencing individual genomes a large number of times. 
   - On a genome basis, it means that, on average, each base has been sequenced a certain number of times (10X, 20X...).
   - Researchers typically determine the necessary NGS coverage level based on the method they're using, as well as other factors such as the reference genome size, gene expression levels, specific application of interest, published literature, and best practices from the scientific community.
   - The size of a BAM file depends on coverage (the average number of times each base is read) and read length.
    
   - |Sequencing method|Recommended Coverage|
     |-----------------|:------------------:|
     | WGS | 30× to 50× for human WGS|
     | WES | 100x |
     | RNA sequencing | Usually calculated in terms of numbers of millions of reads to be sampled. Detecting rarely expressed genes often requires an increase in the depth of coverage. |
     | ChIP-Seq  | 100x  |
     
**- (dis)advantages of WES & WGS (and what those acronyms stand for) [1](https://www.mlo-online.com/molecular/dna-rna/article/13017563/wes-vs-wgs-why-the-exome-isnt-the-whole-story-and-sometimes-when-its-better)**

|WES (Whole Exome Sequencing): | WGS (Whole Genome Sequencing)|  
|------------------------------|:----------------------------:|
| cheaper, tend to be run ~100x depth, faster, ignores the impact of truly insignificant variations, provides a snapshot not of the actual non-exonic sequences but of their significant effects | tend to be run ~30x depth, includes mutations outside of exons (e.g. in regulatory elements) but challenge in interpretation, more complete in its coverage and is generalizable across the whole organism|
    
    
**- What are “genome reference assemblies”, and can you name (some of) them?**
   - A reference genome (also known as a reference assembly) is a digital nucleic acid sequence database, assembled by scientists as a representative example of the set of genes in one idealized individual organism of a species.
   - The human “reference genome” sequence does not come from a single person, but is instead an idealized assembly derived from the DNA of a number of people.
   - Reference genomes describe the consensus DNA sequence (the consensus sequence is the calculated order of most frequent residues, either nucleotide or amino acid, found at each position in a sequence alignment)
   - Aside human variation, multiple assemblies have been released.
   - GRCh stands for Genome Reference Consortium
      - Human GRCh37 (hg19)
      - Human GRCh38
      - Mouse mm10
      - Mouse GRCm38
      
**- Structuring of HGVS annotations (and - possibly made up - example)**

**- Basic understanding of cytogenetic banding annotation, and (approximate) spatial resolution of such annotations**

**- “1000 genomes” - what are they, and advantages vs. problems associated with using them in genomics workflows**

### General computing & science questions

**There can be some non-technical questions on e.g. best software practices (OpenSource vs. “black box” software, choice of operating system…). Here, it may be more about justifying an opinion vs. providing a “true answer”.**


**- reproducibility (OpenSource, versioning, standard formats, programmatic data manipulation, stable resources/repositories)**

**- general workflow steps from reads to variants**

### Resources

**Some familiarity with selected genome & molecular knowledge resources, their primary goals and example use cases is expected.**

**- ClinGen**

**- ClinVar**

**- UCSC genome browser**

  - files used to represent features, and load them into custom tracks (BED, bedGraph, Wiggle, BAM, pgSNP…)
  - importance to select the right genome edition - Why?
  
### File types in genomics and their use [more](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2020/Fatmanur-Kilic/d4_FileFormats-1000Genome.md)
**You should be able to list at least 2-3 core features (main use cases, type, core strength, core weakness).**

**- FASTA**: text file, very simple format for DNA/RNA or protein sequences, this can be anything from small pieces of DNA or proteins to an entire genome

**- FASTQ**: text-based format for storing both a DNA sequence and its corresponding quality scores

**- SAM/BAM/CRAM**: 
   - **SAM**: a generic format for storing large nucleotide sequence alignments
   - **BAM**: compressed binary format of SAM

**- BED**: text file, used for genomic intervals

**- VCF (more extensive understanding of file structure expected)**: is a text file format, contains meta-information lines, a header line, and then data lines each containing information about a position in the genome. [more](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2020/Fatmanur-Kilic/d4_VariantAnnotationFormats.md#vcf-variant-call-format-6-7-8)

### Protein representation of variants

**- protein sizes**

**- resource(s) for 3D protein structures and other protein information resources**

**- types of genome variants with respect to their impact on protein composition**

**- amino acid physicochemical properties (size, charge) and effect of variation due to amino acid properties**

**- conservation state of a given AA and its relation to mutation frequency and functional importance**

### Tutorials
**- What is “liftover” being used for?**

**- Linkage disequilibrium and population genetics**

  **- What do you analyse with PLINK?**
  
  **- Examples for filters/parameters used in linkage analysis**
  
### Genomic privacy
**- genome “Beacons”**

  **- concept**
  
  **- “unbreakable”?**
  
**- de-identification attacks**

**- genomic privacy, research, comparable risks (opinions)**


