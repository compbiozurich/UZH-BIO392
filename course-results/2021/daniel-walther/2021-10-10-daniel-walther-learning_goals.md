_daniel walther_

_source: [Core learning goals](https://github.com/compbiozurich/UZH-BIO392/blob/master/pages/_doc/learning-goals.md )_

# BIO392 core learning goals & short answers

This page lists the "core learning goals" in preparation for the exam at the end of the course. These may not cover 100% of possible questions, but rather be considered representative.

### General questions about the topic of the course  


You should be able to demonstrate an understanding of the relationships between inherited and acquired genome variants and their possible implications for understanding phenotypic human variation.
What are problems encountered there, and why do we think we need many more genomes to be available for comparative analyses? 
Also, examples of data types beyond genome data relevant for understanding genomic variation should be provided.

=> _problems surrounding understanding phenotypic human variation(?)_
=> _Biologists think more genomes are required, i.e. better coverage of the genomic make-up of human populations, because_
=> _I assume 'genome data' refers to nucleotide sequence data types (e.g. FASTA and FASTQ), and "data types beyond" refers to formats like VCF and other annotation focused data types._  

You should know some disease examples for which a genomic contribution could be described.

=> _breast cancer, cholorectal cancer (slide 5 day 2)._
=> _neurodevelopmental disorders, e.g. autism spectrum disorder (ASD), ADHD(?)_
=> _sickle cell anemia, Bluterkrankheit, etc._

##### Some factlets:

- approximate size of human genome
  => _~3 billion base pairs (3 \* 10^9), typically ~5 million variants_
- size of largest human chromosome
- example(s) for sequencing "depth/coverage" in standard analysis scenarios, and the impact this has on the different genome file formats
  => _sequencing depth: e.g. great depth where sequence is duplicated, small depth where copy was deleted._
  => _sequencing coverage: the sequenced portion of a genome. e.g. the seq.ing coverage is better/greater in WGS (whole Genome sequencing) than in WES (whole Exome sequencing)._
- (dis)advantages of WES & WGS (and what those acronyms stand for)
  => _see slide 15 day 2_
  => _WGS: Whole Genome Sequencing_
    => _(dis)advantages_
  => _WES: Whole Exome Sequencing_
- What are "genome reference assemblies", and can you name (some of) them?
- Structuring of HGVS annotations (and - possibly made up - example)
  => _[HGVS nomenclature](https://varnomen.hgvs.org/) (Human Genome Variation Society). [HGVS simple](https://varnomen.hgvs.org/bg-material/simple/) language to describe changes in D/RNA, proteins ('variants') - the HGVS nomenclature standard._
  => _The format of a complete variant description is __"reference:description"___
  => _visit the 2nd link for a better understanding (well readable)._
- Basic understanding of cytogenetic banding annotation, and (approximate) spatial resolution of such annotations
  => _[Cytogenetic Banding Nomenclature](https://www.ncbi.nlm.nih.gov/Class/MLACourse/Modules/Genomes/map_cytogenetic_bands.html ), e.g. 3p21.1: chromosome 3 > p-arm > band 2 > sub-band 1 > sub-sub-band 1; (so, region "two-one-one", not "twenty-one-point-one")_
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

- (reference genome)
  => _a reference genome is a collection of contigs/scaffolds_
  => _a contig is a stretch of DNA sequence encoded as A,G,C,T,N._
- FASTA
  => _use cases:_ unaligned sequences; reference genomes typically come in FASTA format;
  => _type: text files (probably ASCII)_
  => _core strength: practical for storing raw sequences_
  => _core weakness: no quality measure for error prob. of nucleotides; not annotations besides scaffold (some ID, species, cell type, genome region)_ 
- FASTQ
  => _use cases:_ unaligned sequences; standard de facto for short read, high-throughput sequencing instruments (i.e. Solexa/Illumina), which return sequence and error rate assessment;
  => _type: text files (probably ASCII)_
  => _core strength: storing raw sequences from sequencing machine outputs, including quality measure for sequencing error rate/probability_
  => _core weakness: different standards of quality encoding (Phred scores)_  
- SAM/BAM/~~CRAM~~ (Sequence Alignment Map / Binary Alignment Map)
  => _use cases: alignments (to (parts of) reference genomes); to map to known genomic sequences_
  => _type: SAM text files; BAM binary format, binary & thus compressed version of SAM_
  => _core strength: contains much mapping information & extracted/inferred metadata_
  => _core weakness: much space needed for storage_  
- BED
  => _use cases:_ genomic ranges;
  => _type:_
  => _core strength: reduces space needed for storing genomic (alignment/aligned) data by replacing sequence with position mapping to reference genomes_
  => _core weakness: rather rigid file structures, norms and conventions exist which make this format not flexible (could be used flexibly, e.g. other columns, but reusability suffers)_
- (GFF/GTF)
  => _use cases: gene annotation; e.g. can contain info. such as exon or intron, chromosome, nucleotide type, other info., etc._
- (wiggle files, BEDgraphs)
  => _use cases: genomic scores;_
- VCF (more extensive understanding of file structure expected)
  => _use cases:_ variants;
  => _type:_
  => _core strength:_
  => _core weakness:_  
  => _Variant Call Format: for making the calling(?) of variants easier, faster, cheaper, more efficient \~_
  => _[Understanding VCF format](https://www.ebi.ac.uk/training/online/courses/human-genetic-variation-introduction/variant-identification-and-analysis/understanding-vcf-format/ )_
- ~~"segment files"~~
  => I think segment files are used in functional genomics (studying epigenetics)

### Protein representation of variants ?

_exam relevant? / where was what mentioned?_

Is it meant so, that: "Protein representation of variants with regard to...":
- protein sizes
  => _generally measured in kiloDaltons (kD)_
- resource(s) for 3D protein structures and other protein information resources
  => _Protein Data Bank (PDB) with associated file format .pdb_
- types of genome variants with respect to their impact on protein composition
  => _what do you mean? what is the learning goal?_
- amino acid physicochemical properties (size, charge) and effect of variation due to amino acid properties
- conservation state of a given AA and its relation to mutation frequency and functional importance

### Tutorials ?

- What is "liftover" being used for?
  => _To translate/transform between reference genome assemblies_
- Linkage disequilibrium and population genetics
	- What do you analyse with PLINK?
	  => _exam relevant?_
	- Examples for filters/parameters used in linkage analysis
	  => _exam relevant?_

### Genomic privacy ?

_exam relevant?_

- genome "Beacons"
  =>
  - concept
  - "unbreakable"?
- de-identification attacks
  =>
- genomic privacy, research, comparable risks (opinions)
  =>
