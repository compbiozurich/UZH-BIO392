# Task: Exploration of different file formats

## Which genomic file formats exist and what are their use cases?

### Raw Sequence file formats

* **FASTA**
FASTA is used to storing Reference Sequence. Can store protein sequences, but also nucleotide sequences, and if its retrieved from a sequencer instrument you can also have ambiguity codes within the nucleotide sequence.
Format has a header line, starts with ">" and a body consiting of the sequence.
> '>seq0'  
> FQTWEEFSRAAEKLYLADPMKVRVVLKYRHVDGNLCIKVTDDLVCLVYRTDQAQDVKKIEKF

FASTA is not optimal for multiple retrevals of small parts of the sequence in a big file.
Alternative: FASTA indexing. Creates additional file with ending .fai

* **FASTQ**
Next level of complexity after FASTA file formats. Te Q stands for quality. This format is for storing both a biological sequence and its corresponding quality score. This is the de facto standard for storing the output of high thorughput sequencing instruments such as Illumina Genome Analyzer. 
* The first line is the header line, starts with an @ followed by a sequence identifier and optional description and information about the sequence
* Following the raw sequence letters
* The third line begins with "+" and is optinally followed by the same sequence identifier (though not here I guess)
* The last line are the quality Values for the sequence in line 2. Most contain the same number of symbols as letters in the sequence

> @SEQ_ID  
> GATTTGGGGTTCAAAGCAGTATCGATCAAATAGTAAATCCATTTGTTCAACTCACAGTTT  
> +  
> !''((((+))%%%++)(%%%%).1*-+*''))*655CCF>>>>>>CCCCCCC65  

* **FAST5**



### Aligned Reads file formats

* **SAM: sequence alignment Map**
SAM: Sequence alignment MAP. This format is for storing biological sequences aligned to a reference genome. This format supports long reads (up to 128 Mbp) in text-based format.
It consists of a header and and alignment section. The binary Alignment MAP (BAM) file is the binary equivalent of SAM, which stores the same data in a compressed
binary representation. The header starts with an "@". There are 11 mandatory fields, as well as a number of optional fields. 
Contains the same information as BAM (header and alignment) but is more human readable and easier to process by conventional text base processing programs (python…)
* Needed storing place would take about 300'000 GB

 
Here the mandatory fields

|Column|Field|Type|Description|
-------|-----|----|-----------|
1 | QName| String | Query Template Name: Reads/segments having a identical QName are regarded to come form the same template
2 | FLAG | Int | Combination of bitwise flags (denote multiple attributes of a read alignment in binary)
3 | RNAME| String | Reference sequence NAME of the alignment
4 | POS | Int | 1-based leftmost mapping POSition of the first matching base. First base = 1. POS = 0 for an unmaped read without coordinates
5 | MAPQ | Int | Mapping quality ( = -10 log10Pr{mapping position worng}
6 | CIGAR | String | Concise Idiosyncratic Gapped Alignment Report string (?)
7 | RNEXT | String | Refernece name of the next read/mate
8 | PNEXT | Int | Position of the mate/next read
9 | TLEN | Int | observed template length
10 | SEQ | Stirng | segment SEQuence (Asterix if empty)
11 | QUAL | String | ASCII of Phred-scaled base QUALity+33

Example:   
> @HD VN:1.3  SO:coordinate   
> @SQ SN:ref  LN:45   
> @SQ SN:ref2 LN:40   
> r001    163 ref 7   30  8M4I4M1D3M  =   37  39  TTAGATAAAGAGGATACTG *   XX:B:S,12561,2,20,112   
> r002    0   ref 9   30  1S2I6M1P1I1P1I4M2I  *   0   0   AAAAGATAAGGGATAAA   *   
> r003    0   ref 9   30  5H6M    *   0   0   AGCTAA  *   
> r004    0   ref 16  30  6M14N1I5M   *   0   0   ATAGCTCTCAGC    *   
> r003    16  ref 29  30  6H5M    *   0   0   TAGGC   *   

* **BAM: binary format for storing sequence data, compressed version of a SAM file**
The binary Alignment MAP (BAM) file is the binary equivalent of SAM, which stores the same data in a compressed binary representation.

Files contain a header section and an alignment section: (header contains information about entire file, alignments contains read name, read sequence, read quality, alignment information and custom tags)
associated costs for the 1000 Genome project would be about 125'200 CHF
needed storing place would take 260'000 GB
because of the compressed binary code, these file type is appropriate for storing called variants

* **CRAM**

### Genome Annotation file formats
* **GFF**

It is a format to describing genes and other features of DNA, RNA and protein sequences

Structure: They have 9 fields per line. 
|Position index|Position Name|Description|
---------------|-------------|-----------|
1 | sequence | The name of the sequence where the feature is located
2 | source | keyword identifying the source of the feature (Programm, organisation ...)
3 | feature | feature type name like "gene" or "exon"|
4 | start | Genomic start of the feature with 1-base offset (BED is 0-offset)
5 | end | genomic end of the feature
6 | score | numeric value indicates the confidence of the source. "." means null value
7 | strand | Single character that indicates the strand ("+" : 5' -> 3', "-": 3' -> 5', ".": undetermined)
8 | phase | phase of CDS feature (?)
9 | attributes | all other information. varies the most

* **GTF**

Gene transfer format. It is a format used to hold information about the gene structure. It is based on the general feature format GFF but contains
additional conventions specific to gene information. Given a Sequence and a GTF file, one can check that the format is correct.
GTF is identical to GFF version 2.

* **BED: Browser Extensible Data format provides a flexible way to define the data lines that are displayed in an annotation track
format:**

This is used to store genomic regions as coordinates and associated annotations. They are presented in form of columns separated by spaces or tabs. (Developed by the Human Genome Project). Its the _de facto_ standard in bioinformatics.
Advantage: Manipulaton of the coordiantes instead of the sequence, which optimises the power and computation when comparing all or part of the genome.
It easy to work with with word processing and scripting languages (Pythin, Ruby, Perl, *BEDTool*)
Associated costs for the 1000 Genome project would be about 500'800 CHF because in these file every letter needs 8bit instead of 2bit in the BAM format needed storing place would take 1'040'000 GB
These format can be perfectly used for browser visualisation and it will fit with tools like BLAST.

It consists of a minimum of 3 columns up to twelve.
|column number|Title|Definition|
--------------|-----|----------|
1 | chrom | chromosome (chr3, chrY ...)
2 | chromStart | Start coordinate on chromosome for the considered sequence (first base on chromosome = 0)
3 | chromEnd | End coordinate
4 | name | Name of the BED file
5 | score | score between 0 - 1000
6 | strand | DNA strand orientation positive (+), negative (-), or no strand (.)
7 | thickStart | starting coordinate from which the annotation is displayed in a thicker way (graphical representation; e.g. start codon or gene)
8 | thickEnd | end coordinate form which the annotation is displayed in a thicker way
9 | itemRgb | RGB vlaue determining the display colour of the annotation contained in the BED file
10 | blockCount | Number of blocks (e.g. exons) on the line of BED file
11 | blockSizes | List of Values seperated by commas corresponding to the size of the block (the number of values must correspond to "blockCount")
12 | blockStarts | List of values seperated by commas correspond to the starting coordinates of the blocks, calculated relative to those present in the chromStart column

Coordinate system:  is zero based!! ==> chr7   0   1000 starts with the first nucleotide and chr7   1   1000 starts with the second

example: BED3 (minimal)
>chr7       127471196       127472363   
>chr7    127472363    127473530   
>chr7    127473530    127474697   

BED9: 
> chr7    127471196    127472363    Pos1    0    +    127471196    127472363    255,0,0   
> chr7    127472363    127473530    Pos2    0    +    127472363    127473530    255,0,0   
> chr7    127473530    127474697    Pos3    0    +    127473530    127474697    255,0,0   
> chr7    127474697    127475864    Pos4    0    +    127474697    127475864    255,0,0   
> chr7    127475864    127477031    Neg1    0    -    127475864    127477031    0,0,255   
> chr7    127477031    127478198    Neg2    0    -    127477031    127478198    0,0,255   
> chr7    127478198    127479365    Neg3    0    -    127478198    127479365    0,0,255   
> chr7    127479365    127480532    Pos5    0    +    127479365    127480532    255,0,0   
> chr7    127480532    127481699    Neg4    0    -    127480532    127481699    0,0,255 


* **bigBED**

### Quantitated data file formats

* **bedGraph**

* **Wig**

* **bigWig**

## Variant Call file formats

**VCF: Variant Call Format**
advent of large-scale genotyping and DNA sequencing projects -> only the variations need to be stored along with a reference genome
contains metainformation lines, header line, data line containing information about a position in the genome
One full sequenced reference genome is used and the variations of 88 million variants, so I estimate the storing costs on around 200 CHF.
These file format can be used for full archival purposes because you can put all the relevant data in it and need less space because the same sequences are saved only once.


It is a format of a text file used for storing gene sequence varaition. Much of the data in GFF is redundant because much of it will be shared. With the 
VCF only the variation need to be stored along with a reference genome.
The header begins the file and provides metadata describing the body of the file. It starts with #. Special keywords are denoted with ##. Such keywords include
fileformat, fileDate and reference.

|Column|Name|Description|
-------|----|-----------|
1 | CHROM | Name of the sequence (typically a chromosome) on which the variation is called ==> Usually known as reference sequence (sequence at which the given sample varies)
2 | POS | The 1-based position of the variation on the given sequence
3 | ID | The identifier of the variation
4 | REF | The reference base (or bases in case of indel's) at the givne position on the given reference
5 | ALT | List of alternative alleles at the position
6 | QUAL |  A quality score associated with the inference of the given allels
7 | FILTER | A flag indicatin which of a given set of filters has passed
8 | INFO | An extensible list of key value pairs describing he variation
9 | FORMAT | an (optional) extensible list of field for describing the samples
+ | SAMPLEs| For each (optinal) sample described in the file, values are given for the fields listed in FORMAT

Example:
```
##fileformat=VCFv4.3
##fileDate=20090805
##source=myImputationProgramV3.1
##reference=file:///seq/references/1000GenomesPilot-NCBI36.fasta
##contig=<ID=20,length=62435964,assembly=B36,md5=f126cdf8a6e0c7f379d618ff66beb2da,species="Homo sapiens",taxonomy=x>
##phasing=partial
##INFO=<ID=NS,Number=1,Type=Integer,Description="Number of Samples With Data">
##INFO=<ID=DP,Number=1,Type=Integer,Description="Total Depth">
##INFO=<ID=AF,Number=A,Type=Float,Description="Allele Frequency">
##INFO=<ID=AA,Number=1,Type=String,Description="Ancestral Allele">
##INFO=<ID=DB,Number=0,Type=Flag,Description="dbSNP membership, build 129">
##INFO=<ID=H2,Number=0,Type=Flag,Description="HapMap2 membership">
##FILTER=<ID=q10,Description="Quality below 10">
##FILTER=<ID=s50,Description="Less than 50% of samples have data">
##FORMAT=<ID=GT,Number=1,Type=String,Description="Genotype">
##FORMAT=<ID=GQ,Number=1,Type=Integer,Description="Genotype Quality">
##FORMAT=<ID=DP,Number=1,Type=Integer,Description="Read Depth">
##FORMAT=<ID=HQ,Number=2,Type=Integer,Description="Haplotype Quality">
#CHROM POS      ID         REF   ALT    QUAL  FILTER   INFO                             FORMAT       NA00001         NA00002          NA00003
20     14370    rs6054257  G     A      29    PASS    NS=3;DP=14;AF=0.5;DB;H2           GT:GQ:DP:HQ  0|0:48:1:51,51  1|0:48:8:51,51   1/1:43:5:.,.
20     17330    .          T     A      3     q10     NS=3;DP=11;AF=0.017               GT:GQ:DP:HQ  0|0:49:3:58,50  0|1:3:5:65,3     0/0:41:3
20     1110696  rs6040355  A     G,T    67    PASS    NS=2;DP=10;AF=0.333,0.667;AA=T;DB GT:GQ:DP:HQ  1|2:21:6:23,27  2|1:2:0:18,2     2/2:35:4
20     1230237  .          T     .      47    PASS    NS=3;DP=13;AA=T                   GT:GQ:DP:HQ  0|0:54:7:56,60  0|0:48:4:51,51   0/0:61:2
20     1234567  microsat1  GTC   G,GTCT 50    PASS    NS=3;DP=9;AA=G                    GT:GQ:DP     0/1:35:4        0/2:17:2         1/1:40:3


## When would you use which?

Which file format would I use for storing variations?
--> To store variations I would use the VCF-file format, because it shows in an ‘easy and clear’ way the 
variations to a specific reference genome. It needs the smallest storage and is also one of the cheapest option 

Which file format would I use for full archival purposes?
--> I think the best option for this is the BAM-file format. Because it uses binary code to store the full sequence alignment 
(compressed way).BAM also allows searching after indexing. 
Another option would be CRAM, which is even more compressed than the BAM file-format. 

Which file format would I use for presenting a sequence? 
--> I would use the FASTA-sequence because it’s very simple to ready and also very flexible.
