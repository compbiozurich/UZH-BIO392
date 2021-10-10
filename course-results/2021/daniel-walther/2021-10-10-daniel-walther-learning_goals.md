_daniel walther_

_source: [Core learning goals](https://github.com/compbiozurich/UZH-BIO392/blob/master/pages/_doc/learning-goals.md )_

# BIO392 core learning goals & short answers

This page lists the "core learning goals" in preparation for the exam at the end of the course. These may not cover 100% of possible questions, but rather be considered representative.

### General questions about the topic of the course

You should be able to demonstrate an understanding of the relationships between inherited and acquired genome variants and their possible implications for understanding phenotypic human variation. What are problems encountered there, and why do we think we need many more genomes to be available for comparative analyses? Also, examples of data types beyond genome data relevant for understanding genomic variation should be provided.  
You should know some disease examples for which a genomic contribution could be described.

=> _Sickle cell anemia (strong genomic contribution), breast cancer (BRCA1,2...), colorectal cancer (also some genomic contr. known?), Bluterkrankheit (brit. royals), ADHD?, etc._

##### Some factlets:

- approximate size of human genome 
- size of largest human chromosome
- example(s) for sequencing "depth/coverage" in standard analysis scenarios, and the impact this has on the different genome file formats
  => _sequencing depth: e.g. great depth where sequence is duplicated, small depth where copy was deleted._
  => _sequencing coverage: the sequenced portion of a genome. e.g. the seq.ing coverage is better/greater in WGS (whole Genome sequencing) than in WES (whole Exome sequencing)._
- (dis)advantages of WES & WGS (and what those acronyms stand for)
  => _WGS: Whole Genome Sequencing_
    => _(dis)advantages_
  => _WES: Whole Exome Sequencing_
- What are "genome reference assemblies", and can you name (some of) them?
- Structuring of HGVS annotations (and - possibly made up - example)
  => _[HGVS nomenclature](https://varnomen.hgvs.org/) (Human Genome Variation Society). [HGVS simple](https://varnomen.hgvs.org/bg-material/simple/) language to describe changes in D/RNA, proteins ('variants') - the HGVS nomenclature standard._
  => _The format of a complete variant description is __"reference:description"___
  => _visit the 2nd link for a better understanding (well readable)._
- Basic understanding of cytogenetic banding annotation, and (approximate) spatial resolution of such annotations
  => _[Cytogenetic Banding Nomenclature](https://www.ncbi.nlm.nih.gov/Class/MLACourse/Modules/Genomes/map_cytogenetic_bands.html )_
  => _intuition for (approx.) spatial resolution not available atm._
- "1000 genomes" - what are they, and advantages vs. problems associated with using them in genomics workflows
  => _see the paper on 1000 genomes (one of the human genome reference assemblies) - attempt to create a reference genome for humans, taking variation due to ethnicity (variation between populations) into account._

### General computing & science questions

There can be some non-technical questions on e.g. best software practices (OpenSource vs. "black box" software, choice of operating system...). Here, it may be more about justifying an opinion vs. providing a "true answer".

- reproducibility (OpenSource, versioning, standard formats, programmatic data manipulation, stable resources/repositories)
- general workflow steps from reads to variants
  => _see SNV calling workflow. was susch no? isch glaub au allgemein gmeint (aber scho au zumene teil spezifisch uf de Rahel Paloots teil)_

### Resources

Some familiarity with selected genome & molecular knowledge resources, their primary goals and example use cases is expected.

- ClinGen
  => _resource for clinically relevant gene/genome annotation data? What's the diffference between ClinGen and ClinVar?_
- ClinVar
  => _resource for genomic variant annotation with clinical relevance/relation_
- UCSC genome browser
	- files used to represent features, and load them into custom tracks  (BED, bedGraph, Wiggle, BAM, pgSNP...)
	- importance to select the right genome edition - Why?
	  => _because the sequences' positions usually change somewhat between assemblies._

### File types in genomics and their use

You should be able to list at least 2-3 core features (main use cases, type, core strength, core weakness).

- FASTA
- FASTQ
  => _FASTQ = FASTA with quality measure for each base_
- SAM/BAM/~~CRAM~~
  => _...short alignment method? / binary alignment method?_
- BED
  => _Browser Extensible Data?_
  => _(+) reduces memory needed for storing genomic data (by referencing positions instead of containing the sequence itself)_
- VCF (more extensive understanding of file structure expected)
  => _Variant Call Format: for making the calling(?) of variants easier, faster, cheaper, more efficient \~_
- ~~"segment files"~~

### Protein representation of variants

_I think I missed another part of the course... Luckily I did 'Protein Biophysics' and can simulate protein binding behaviour._

- protein sizes
  => _generally measured in kiloDaltons (kD)_
- resource(s) for 3D protein structures and other protein information resources
  => _Protein Data Bank (PDB) with associated file format .pdb_
- types of genome variants with respect to their impact on protein composition
- amino acid physicochemical properties (size, charge) and effect of variation due to amino acid properties
- conservation state of a given AA and its relation to mutation frequency and functional importance

### Tutorials

- What is "liftover" being used for?
  => _To translate/transform between reference genome assemblies_
- Linkage disequilibrium and population genetics
	- What do you analyse with PLINK?
	  => _Was PLINK mentioned even once in the course?_
	- Examples for filters/parameters used in linkage analysis
	  => _what is linkage analysis? ...w00t?_

### Genomic privacy

- genome "Beacons"
  => _?_
  - concept
  - "unbreakable"?
- de-identification attacks
  => _?_
- genomic privacy, research, comparable risks (opinions)
  => _did we talk about this in the course at some point? (I would've missed it)._
