_daniel walther_

_source: [Core learning goals](https://github.com/compbiozurich/UZH-BIO392/blob/master/pages/_doc/learning-goals.md )_

# BIO392 core learning goals & short answers

This page lists the "core learning goals" in preparation for the exam at the end of the course. These may not cover 100% of possible questions, but rather be considered representative.

### General questions about the topic of the course  


You should be able to demonstrate an understanding of the relationships between inherited and acquired genome variants and their possible implications for understanding phenotypic human variation.
What are problems encountered there, and why do we think we need many more genomes to be available for comparative analyses? 
Also, examples of data types beyond genome data relevant for understanding genomic variation should be provided.

=> _One branch of relationships between inherited and acquired genome variants is of medical nature. There, genome variants can lead to disease with varying certainty, e.g. some genetic diseases' manifestations depend on the genome of the indvidual, some do not, some can be treated differently or not at all._
=> _The influence of genome variants on human phenotypic variation is often unclear since there are approximately ~5 million variants in every human, for which the current coverage of the whole population is lacking to determine which variants have phenotypic implications, to what extent, if at all. These possible influences on phenotypes of course include pathogenic variants and penetrance thereof._
=> _The lack of data may affect the unclear penetrance of genetic diseases more directly than the association between variants and diseases themselves. But unclear penetrance of a given disease due to lack of data of course in turn affects uncertain correlation between variants and diseases, let alone clear causal relationships._
=> _Biologists think more genomes are required, i.e. better coverage of the genomic make-up of human populations, because variants are not easily identified as phenotypically relevant with the current sample size of available genomes._
=> _I assume 'genome data' refers to nucleotide sequence data types (e.g. FASTA and FASTQ), and "data types beyond" refers to formats like VCF and other annotation focused data types._  
=> _Examples of important/relevant data types beyond pure genome data are firstly positional reference formats, e.g. BED files, which encode sequences by refering to reference genome positions. Then there are many different annotation focused data types, like GFF and GTF, VCF, etc._
=> _Some of these examples can be used just as well for DNA, RNA, or protein sequences. But for proteins, specifically there exist other specialised data types, like PDB which is the most used format for working with 3D protein structures and interactions between proteins, including simulations._

You should know some disease examples for which a genomic contribution could be described.

_look up the corresponding relevant genes / regions (first understand different resources)_
=> _breast cancer (BRCA1/2), cholorectal cancer (slide 5 day 2)._
=> _neurodevelopmental disorders, e.g. autism spectrum disorder (ASD), ADHD(?)_
=> _sickle cell anemia, Bluterkrankheit, etc._

##### Some factlets:

- approximate size of human genome
  => _~3 billion base pairs (3 \* 10^9), typically ~5 million variants_

- size of largest human chromosome
  => _~240 million bp, chromosome 1 and 2 almost as large. [ncbi chromosome map](https://www.ncbi.nlm.nih.gov/books/NBK22266/#A273 )_

- example(s) for sequencing "depth/coverage" in standard analysis scenarios, and the impact this has on the different genome file formats
  => _sequencing depth: Sequencing depth is a measure for how many overlapping reads there are for the same contig sequence (more reads ~ more depth). e.g. great depth where sequence is duplicated, small depth where copy was deleted._
    => _Greater sequencing depth makes measurements more accurate (in sequencing machines), although more space is needed to store the reads, and more computation is needed for the alignments (affecting FASTA/Q formats). Also, especially in cancer genomes with much higher CNV portions, duplicated fragments can make alignment harder and ambiguous (e.g. if mutations happen between duplications) (affecting SAM, BAM files - uncertainty; affecting VCF files - more variants for the same bases, maybe not all actually important)._
	=> _Differing sequencing depth impacts: FASTA/Q files (phred scores), ..._
  => _sequencing coverage: Sequencing coverage is a measure for what portion of a genome is covered i.e. has been sequenced. The sequenced portion of a genome. e.g. the seq.ing coverage is better/greater in WGS (whole Genome sequencing) than in WES (whole Exome sequencing)._
    => _Greater coverage can lead to bigger files (e.g. in case of global alignment in SAM files), where less coverage might have also sufficed. It could also lead to losing focus on the truly relevant variants and to smaller effect size in statistical evaluations - if e.g. for clinical studies, WGS is used whereas potentially known important regions could have been focused, this could lead to simply much more elaborate, time and computation intensive workflows to get to the same results (i.e. identifying pathogenic genome variants in cancer cells), or even to missing sequenced important variants maybe due to choosing unfortunate thresholds in filtering variants._
	=> _Differing sequencing coverage impacts: FASTA/Q files (size), ..._

- (dis)advantages of WES & WGS (and what those acronyms stand for)
  => _see slide 15 day 2_
  => _WGS: Whole Genome Sequencing_
    => _(-) much more data, probably not everything is important_
	=> _(+) will not miss anything, some non-coding regions might have important interactions with coding regions (promoters for instance, idk...)_
	=> _(+) can reconstruct much more accurate and more highly resolved  (in time) evolutionary trees in comparative / systematic studies, including epidemiological research_
  => _WES: Whole Exome Sequencing_
    => _(+) much less data (coding part of human genome is only 1% of the whole)_ 
	=> _(-) might miss important non-coding regions, which could play a role in gene regulation or pathogenic mutations (~99% of cancer genomes variation is in non-coding regions)_
	=> _(+) much faster process if you have prior knowledge excluding non-coding regions_
- QU: Are mitochondrial genomes included when talking about WGS?

- What are "genome reference assemblies", and can you name (some of) them?
  => _Genome reference assemblies are attempts at creating standard genomes serving as control and contig sequences, meaning which serve as a control version of healthy genomes, and which also serve as a positional reference for alignment of sequences, e.g. in sequencing but also in variant calling & research._
  => _The 1000 genomes project (first one to incorporate substantial number of genomes) [insert link]_
  => _The Genome Reference Cosortium, representing efforts by the NCBI. There are human, mouse, zebrafish, and other species' reference genomes._
  => _The UCSC Genome Browser and UCSC genome assemblies, e.g. hg38 assembly, by the genomics institute of the UCSC university. Many species' reference genomes can be found here. Original HGP genome (Watson's genome) made by this institute.
  => _others which I should know?_

- Structuring of HGVS annotations (and - possibly made up - example)
  => _[HGVS nomenclature](https://varnomen.hgvs.org/) (Human Genome Variation Society). [HGVS simple](https://varnomen.hgvs.org/bg-material/simple/) language to describe changes in D/RNA, proteins ('variants') - the HGVS nomenclature standard._
  => _The format of a complete variant description is __"reference:description"___
  => _visit the 2nd link for a better understanding (well readable)._

- Basic understanding of cytogenetic banding annotation, and (approximate) spatial resolution of such annotations
  => _[Cytogenetic Banding Nomenclature](https://www.ncbi.nlm.nih.gov/Class/MLACourse/Modules/Genomes/map_cytogenetic_bands.html ), e.g. 3p21.1: chromosome 3 > p-arm > band 2 > sub-band 1 > sub-sub-band 1; (so, region "two-one-one", not "twenty-one-point-one")_
  => _intuition for (approx.) spatial resolution: smallest band(s)-regions are ~10^5 bp long, largest are ~10^7 bp long. This depends a lot on which chromosome and which band therein, hard to generalise._
    => _What can be generalised, is that sub-bands and sub-sub-bands are smaller than bands as a whole, so sub-bands, I guess, are generally ~10^6 bp or smaller._

- "1000 genomes" - what are they, and advantages vs. problems associated with using them in genomics workflows
  => _see the paper on 1000 genomes (one of the human genome reference assemblies) - attempt to create a reference genome for humans, taking variation due to ethnicity (variation between populations) into account._
  => _problems: QU: is it clear as to which ethnicity is referenced to, is there some general indicator/terminology for this?_
  => _problems: one problem is certainly, that even at ~6'000 genomes, the sample size is not yet representative of genome variants (I would say not even close to being representative)._
  => _Advantage: With the sample size of 6k whole genomes, the most conserved genome variants are certainly accounted for and this project thus results in a solid start in creation of more representative referene genomes._

### General computing & science questions

There can be some non-technical questions on e.g. best software practices (OpenSource vs. "black box" software, choice of operating system...). Here, it may be more about justifying an opinion vs. providing a "true answer".

- reproducibility (OpenSource, versioning, standard formats, programmatic data manipulation, stable resources/repositories)
  => _problems with being potentially exploited by research entities who don't practice the same openness of data (hint: comm. china)._
  => _problems with competitiveness and ability to stay competitive if data is shared, again, some might not share but take nonetheless._
  => _reproducibility strongly profits from general opensource practices, as does scientific progress overall. although competability might suffer from too much opensource, but auditability certainly doesn't (e.g. security concerns of genome archives and such).

- general workflow steps from reads to variants
  => _see SNV calling workflow. was susch no? isch glaub au allgemein gmeint (aber scho au zumene teil spezifisch uf de Rahel Paloots teil)_

### Resources

Some familiarity with selected genome & molecular knowledge resources, their primary goals and example use cases is expected.

- ClinGen
  => _resource for clinically relevant gene/genome annotation data? What's the diffference between ClinGen and ClinVar?_

- ClinVar
  => _resource for genomic variant annotation with clinical relevance/relation_

- UCSC genome browser
	
	- files used to represent features, and load them into custom tracks (BED, bedGraph, Wiggle, BAM, pgSNP...)
	
	- importance to select the right genome edition - Why?
	  => _because the sequences' positions usually change somewhat between assemblies._

### File types in genomics and their use

You should be able to list at least 2-3 core features (main use cases, type, core strength, core weakness).

- (reference genome)
  => _a reference genome is a collection of contigs/scaffolds_
  => _a contig is a stretch of DNA sequence encoded as A,G,C,T,N._
  => _usually stored in FASTA/FASTQ format_

- FASTA
  => _use cases:_ unaligned sequences; reference genomes typically come in FASTA format;
  => _type: text, nucleotide sequence stored directly_
  => _core strength: practical for storing raw sequences; unambiguous standard;_
  => _core weakness: no quality measure; not well annotated (some ID, species, cell type, genome region); needs much space_ 

- FASTQ
  => _use cases:_ unaligned sequences; standard de facto for short read, high-throughput sequencing instruments (i.e. Solexa/Illumina), which return sequence and error rate assessment;
  => _type: text, nucleotide sequence stored directly, with read quality_
  => _core strength: storing raw sequences from sequencing machine outputs, including quality measure for sequencing error rate/probability_
  => _core weakness: different standards of quality encoding (Phred scores)_  

- SAM/BAM/~~CRAM~~ (Sequence Alignment Map / Binary Alignment Map)
  => _use cases: alignments (to (parts of) reference genomes); identifying measured sequence by mapping to known genomic sequences_
  => _type: SAM text files; BAM binary format, binary & thus compressed version of SAM; both contain reference, measured sequence, and alignment information_
  => _core strength: contains much mapping information & extracted/inferred metadata_
  => _additional strength: in case of alignment errors / assembly conflicts, the sequence is unchanged (unlike with positional data formats like BED)_
  => _core weakness: global and local alignment methods, more readable alignment results vs. faster alignment; much space needed for storage (especially with global alignment)_  

- BED
  => _use cases: genomic ranges; not practical for variant data_
  => _type: text, positional data referring to reference genomes_
  => _core strength: reduces space needed for storing genomic (alignment/aligned) data by replacing sequence with position mapping to reference genomes_
  => _core weakness: indexing not uniform (fully-closed, half-open, fully-open); strong dependency on genome assemblies, can go out of bounds in case of version conflicts;_
  => _additional weakness: rather rigid file structures, norms and conventions exist which make this format not flexible (could be used flexibly, e.g. other columns, but reusability suffers); _

- (GFF/GTF)
  => _use cases: gene annotation; e.g. can contain info. such as exon or intron, chromosome, nucleotide type, other info., etc._

- (wiggle files, BEDgraphs)
  => _use cases: genomic scores;_

- VCF (more extensive understanding of file structure expected)
  => _use cases: standard file format for storing variation data; The variant call format (VCF) is a generic format for storing DNA polymorphism data such as SNPs, insertions, deletions and structural variants, together with rich annotations. [The variant call format and VCFtools](https://www.ncbi.nlm.nih.gov/labs/pmc/articles/PMC3137218/ )_
  => _file structure: All data lines are TAB delimited and the number of fields in each data line must match the number of fields in the header line. It is strongly recommended that all annotation tags used are declared in the VCF header section._
  => _type: text, table of genome variant information_
  => _core strength: unambiguous, scalable, flexible; space efficient_
  => _core weakness: referencing of genome variants is heavily dependent on which genome assembly is used_
  => _additional weakness: files can contain many columns, every variant needs a column (even the ones not contained)_  
  => _Variant Call Format: for making the calling(?) of variants easier, faster, cheaper, more efficient \~_
  => _[Understanding VCF format](https://www.ebi.ac.uk/training/online/courses/human-genetic-variation-introduction/variant-identification-and-analysis/understanding-vcf-format/ )_

- ~~"segment files"~~
  => I think segment files are used in functional genomics (studying epigenetics)

- (counting in 0/1 spaces, usually this is the case:)
  - BED 0-based
  - GTF 1-based
  - GFF 1-based
  - SAM 1-based, BAM 0-based
  - VCF 1-based, BCF 0-based
  - Wiggle 1-based
  - GenomicRanges 1-based
  - BLAST 1-based

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

### Genomic privacy ?

- genome "Beacons"
  =>
  - concept
  - "unbreakable"?
- de-identification attacks
  =>
- genomic privacy, research, comparable risks (opinions)
  =>
