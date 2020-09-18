# Variant Nomenclature and File Formats 

## 1. Variant Nomenclature 

### ISCN 
The International System for Human Cytogenetic Nomenclature (ISCN) is a widely used nomenclature to describe the **human chromosome complement** and consists of symbols and abbreviated terms to specifically describe chromosomes and **numerical and structural chromosomal changes** (based on microscopic and cytogenetic techniques). It has been proposed since 1960 and the last update found was in 2016 named extension ISCN and recently modified in May 2020. E.g.:

| Abbreviation        | Meaning                |
|:--------------------|:-----------------------|
| fra                 | fragile site           |
| cht                 | chromatid              |
| t                   | translocation          |
| []                  | surround number of cells or genome build |

More abbreviations can be found [here](https://www.coriell.org/0/Sections/Support/Global/iscn_help.aspx?PgId=263) and the recommendations are published as [book, 2016](https://www.karger.com/Book/Home/271658). 

### HGVS
The Human Genome Variant Society (HGVS) is a standard nomenclature to describe variants. The following format is used: 
* **reference sequence -> variant** \
 e.g. **NM_004006.2:c.4375C>T**, NM_004006.2 (Reference), c.4375C>T (variant) 


The RNA and protein predictions have to be specified by using "()". _c_ stands for "coding DNA reference sequence" but _g_ can also be used since the whole genome is sequenced and stands for "genomic reference sequence". \
Types of variants described by HGVS are the following: 
| Variant             | Description            | Example            |
|:--------------------|:-----------------------|:-------------------|
| substitution        | ">"                    |c.4375C>T, 4375 describes the position |
| deletion            | "del"              | c.4375_4379del |
| duplication         | "dup"         | c.4375_4385dup. | 
| insertion           | "ins" | c.4375_4376insACCT |
| indel               | "delins" | c.4375_4376delinsAGTT | 


**ISCN vs HGVS**: ISCN focuses on the resulting structure of the chromosomes while HGVS on the observed variants. 
>> Really useful and clear [link](https://varnomen.hgvs.org), where to find the sequence variant nomenclature (for DNA, RNA, Prot). 

### GA4GH
The Global Alliance for Genomics and Health (GA4GH) is an international alliance aiming the **standardization** in research and medicine by developing a framework for genomic and health-related data **sharing**. Concrete actions are for example update of the variant file formats, variant annotation, Crypt4GH (data accesibility, privacy). More information can be found [here](https://www.ga4gh.org). 

--------------- 

## 2. Genomic Coordinate Systems 
Genomic coordinates are described as: 
* chromosome name 
* start position 
* end position 
* chromosome strand 
   * "+" forward strand 
   * "-" reverse strand 
   * "." both strands

Genomic coordinate systems start either by **0** (called **0-indexed**) or by **1** (called **1-indexed**), depending on the format. To denotate the end, there are also two different ways, the **fully-closed** (also called **end-inclusive**) and the **half-open**. The first one includes the last position IN the feature, while the second one denotes the first position NOT included. Thus, there are **four** possible genomic coordinate systems combining start and end system together. More information can be found [here](https://plastid.readthedocs.io/en/latest/concepts/coordinates.html). 

--------------

## 3. Variant Formats 
Miscellaneous variant formats are commonly used in bioinformatics depending on the use-cases. 

### SAM 
The Sequence Alignment/Map (SAM) format is a _tab_-delimited text file originated from **SAMtools** (as BAM and CRAM). This last one is a software to post-process short DNA sequence read alignments. SAM takes into account the sequence reads as well as the alignment data that link short reads to a reference sequence. 

> **Use**: visualize **short read sequences** in genome browsers such as IGV (Integrated Genome Viewer). \
> **Comment(s)**: large file size!!

It consists of a header (optional, starting with "@") and an alignment section. 
![SAM Format Example](~/Nina-Desboeufs/Screen_shot_SAM_Format.png) 

More information can be found [here](https://samtools.github.io/hts-specs/SAMv1.pdf). 


### BAM
To remediate to the large file size of SAM format, BAM is the **compressed binary** version of SAM (BGZF format as block compression -> gunzip compatible). BAM includes the same information as SAM but in another format. It includes indexable representation of nucleotide sequence alignments, which allows the processing of large data. 

> **Use**: same as SAM (**alignment file**) but to compress the data. \
> **Comment(s)**: SAM is easier to use by conventional text based software 


### CRAM
Similar to BAM, CRAM is a restructured and binary compressed alignment format, with column-orientation. It is managed by GA4GH. 

> **Use**: same as SAM (**sequence read file**) but highly space efficient due to the compression. \
> **Comment(s)**: smaller file size than BAM

### VCF
The Variant Call Format (VCF) 


### FASTA


### MPEG-G 










