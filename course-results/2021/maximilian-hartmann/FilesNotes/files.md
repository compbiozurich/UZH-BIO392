## FASTA
FASTA sores a variable number of sequence recors and for each records it stores the sequence itself + an sequence ID.
Each Record starts is composed of:
* Header line with the first charecter ">"
* Sequence

Header: it gives name and/or a unique identifier and maybe additional information
Sequence: may be Nukleotides or Amino Acids and they may contain gaps or alignment character (just image the "" are not there ;-))

> ">seq0"    
FQTWEEFSRAAEKLYLADPMKVRVVLKYRHVDGNLCIKVTDDLVCLVYRTDQAQDVKKIEKF   
> ">seq1"   
KYRTWEEFTRAAEKLYQADPMKVRVVLKYRHCDGNLCIKVTDDVVCLLYRTDQAQDVKKIEKFHSQLMRLME  
> ">seq2"   
EEYQTWEEFARAAEKLYLTDPMKVRVVLKYRHCDGNLCMKVTDDAVCLQYKTDQAQDVKKVEKLHGK   
> ">seq3"   
MYQVWEEFSRAVEKLYLTDPMKVRVVLKYRHCDGNLCIKVTDNSVCLQYKTDQAQDVK   
> ">seq4"   
EEFSRAVEKLYLTDPMKVRVVLKYRHCDGNLCIKVTDNSVVSYEMRLFGVQKDNFALEHSLL


## FASTQ
This format is for storing both a biological sequence and its corresponding quality score. This is the _de facto_ standard for storing the output of
high thorughput sequencing instruments such as Illumina Genome Analyzer.
Format:
* begins with "@" and a sequence identifier and an _optinal_ descritprion (= FASTA title line)
* raw sequence letters
* begins with "+" and is _optinally_ followed by the same sequence identifier (though not here I guess)
* Quality Values for the sequence in line 2. Most contain the same number of symbols as letters in the sequence

Example: 


> @SEQ_ID   
> GATTTGGGGTTCAAAGCAGTATCGATCAAATAGTAAATCCATTTGTTCAACTCACAGTTT   
> +   
> !''*((((***+))%%%++)(%%%%).1***-+*''))**55CCF>>>>>>CCCCCCC65    

## BED files
This is used to store genomic regions as coordinates and associated annotations. They are presented in form of columns separated by spaces or tabs. (Developed by the Human Genome Project)
its the _de facto_ standard in bioinformatics.
Advantage: Manipulaton of the coordiantes instead of the sequence, which optimises the power and computation when comparing all or part of the genome.
It easy to work with with word processing and scripting languages (Pythin, Ruby, Perl, *BEDTool*)

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
