# Different File Formats

In Bioinformatics exist many different file formats that store DNA, RNA, protein sequence or stractural information. There is not only one single format that is used, depending on the context different files formats can be preferred. Those formats are often convertible for easier access or sharing. Here only sequence file formats are described.

## BAM and SAM
BAM and SAM in someway belong together. Since the SAM is called the “readable version” of BAM. So both files contain the same information, just in a different format. Both formats start with a header section followed by an alignment section. The BAM format is used when working and analyze the file, since this format is much easier for computer programs to work with. For converting SAM to BAM there a tool, called samtools.

In UNIX this conversion is done like this:

    samtools view -S -b sample.sam sample.bam

There’s an easy way to distinguish the alignment and header line. In contrast to alignment lines header lines start with “@”. The Header contains the information about the entire file, such as sample name, length, and alignment method. The Alignment section contains the read name, its sequence, its quality, alignment information and custom tags. In the Alignment section are 11 mandatory files, those are listed in the following table:


| 1     | 2    | 3     | 4   | 5    | 6     | 7     | 8     | 9    | 10  | 11   |
|-------|:----:|:-----:|:---:|:----:|:-----:|:-----:|:-----:|:----:|:---:|-----:|
| QNAME | FLAG | RNAME | POS | MAPQ | CIGAR | RNEXT | PNEXT | TLEN | SEQ | QUAL |
| Query template NAME | bitwise FLAG | References sequence NAME | 1- based leftmost mapping POSition | MAPping Quality | CIGAR String | References name of the mate/ next read | Position of the mate/ next read | observed Template LENgth | segment SEQuence | ASCII of Phred-scaled base QUALity+33 |

### Why Sequence Alignment Map (SAM) and Binary Alignment Map (BAM)?
SAM is used as a file format for storing alignment information of short reads mapped against reference sequences. Its main use is to store data derived from next generation sequencing technologies. The format includes short reads as well as long reads (up to 128 Mbp). Further this storage format was chosen for the 1000 Genomes Project.
BAM formats are the compressed binary version of a SAM file. BAM files are typically used if working with the file on the computer. SAM files on the other hand are used to make the whole file readable and understandable for us humans.

### Example of SAM and BAM Format:
    @HD VN:1.3  SO:coordinate
    @SQ SN:ref  LN:45
    @SQ SN:ref2 LN:40
    r001    163 ref 7   30  8M4I4M1D3M  =   37  39  TTAGATAAAGAGGATACTG *   XX:B:S,12561,2,20,112
    r002    0   ref 9   30  1S2I6M1P1I1P1I4M2I  *   0   0   AAAAGATAAGGGATAAA   *
    r003    0   ref 9   30  5H6M    *   0   0   AGCTAA  *
    r004    0   ref 16  30  6M14N1I5M   *   0   0   ATAGCTCTCAGC    *
    r003    16  ref 29  30  6H5M    *   0   0   TAGGC   *
    r001    83  ref 37  30  9M  =   7   -39 CAGCGCCAT   *

## CRAM

Like BAM and SAM CRAM files are alignment files. CRAM is an efficient reference-based alternative to SAM and BAM. This file format is used to reduce storage costs, since it uses optional a genomic reference to describe differences between the aligned sequence fragments. In general CREM files use 30-60% smaller storage place in comparison to BAM files.

## Variant Call Format (VCF)

VCF is a text file format, since large files needs a lot of storage capacity it is often stored in a compressed manner. VCF files store only variants (SNPs, deletions and insertions). There are three parts that make up a VCF.

1. Meta – Information: start with “##”, here we get the information of the version of the VCF format and the reference genome that was used to call the variants in this file. (metainformation can have many many lines)
2. Header: only one line for the Header. Each header represents a column in the VCF. The first 8 headers are mandatory, see table:


| 1     | 2   | 3  | 4   | 5   | 6    | 7      | 8    |
|-------|:---:|:--:|:---:|:---:|:----:|:------:|-----:|
| CHROM | POS | ID | REF | ALT | QUAL | FILTER | INFO |

- CHROM: the Chromosome the variant is on
- POS: the POSition the variant is on
- ID: the name of the variant
- REF: its REFerence allele (how it should be)
- ALT: the variants mutant or alternative allele (what is the variant)
- QUAL: the variants Quality
- FILTER: if there is a filter applied
- INFO: additional information

### Example of VCF Format:
      ##fileformat=VCFv4.0
      ##fileDate=20090805
      ##source=myImputationProgramV3.1
      ##reference=1000GenomesPilot-NCBI36
      ##phasing=partial
      ##INFO=<ID=NS,Number=1,Type=Integer,Description="Number of Samples With Data">
      ##INFO=<ID=DP,Number=1,Type=Integer,Description="Total Depth">
      ##INFO=<ID=AF,Number=.,Type=Float,Description="Allele Frequency">
      ##INFO=<ID=AA,Number=1,Type=String,Description="Ancestral Allele">
      ##INFO=<ID=DB,Number=0,Type=Flag,Description="dbSNP membership, build 129">
      ##INFO=<ID=H2,Number=0,Type=Flag,Description="HapMap2 membership">
      ##FILTER=<ID=q10,Description="Quality below 10">
      ##FILTER=<ID=s50,Description="Less than 50% of samples have data">
      ##FORMAT=<ID=GT,Number=1,Type=String,Description="Genotype">
      ##FORMAT=<ID=GQ,Number=1,Type=Integer,Description="Genotype Quality">
      ##FORMAT=<ID=DP,Number=1,Type=Integer,Description="Read Depth">
      ##FORMAT=<ID=HQ,Number=2,Type=Integer,Description="Haplotype Quality">
      #CHROM POS     ID        REF ALT    QUAL FILTER INFO                              FORMAT      NA00001        NA00002        NA00003
      20     14370   rs6054257 G      A       29   PASS   NS=3;DP=14;AF=0.5;DB;H2           GT:GQ:DP:HQ 0|0:48:1:51,51 1|0:48:8:51,51 1/1:43:5:.,.
      20     17330   .         T      A       3    q10    NS=3;DP=11;AF=0.017               GT:GQ:DP:HQ 0|0:49:3:58,50 0|1:3:5:65,3   0/0:41:3
      20     1110696 rs6040355 A      G,T     67   PASS   NS=2;DP=10;AF=0.333,0.667;AA=T;DB GT:GQ:DP:HQ 1|2:21:6:23,27 2|1:2:0:18,2   2/2:35:4
      20     1230237 .         T      .       47   PASS   NS=3;DP=13;AA=T                   GT:GQ:DP:HQ 0|0:54:7:56,60 0|0:48:4:51,51 0/0:61:2
      20     1234567 microsat1 GTCT   G,GTACT 50   PASS   NS=3;DP=9;AA=G                    GT:GQ:DP    0/1:35:4       0/2:17:2       1/1:40:3



3. Variants
In VCF every variant is represented in one row.

VCF can be visualized with Integrative Genomics Viewer (IGV). In contrast to raw VCF format, where each variant got one row of data, in IGV every row is listed next to each other building up the whole sequence (also the once with no alterations or mutations compared to the reference). In IGV they work with different colors, one color for reference, one for heterozygous and last but not least a mutation or alteration in both alleles (homozygous).

## FASTA
In a FASTA file various information is displayed. Namely, primary structure from DNA sequences and protein sequences. FASTA format includes one headline, indicated with “>”, after the header the sequence data are displayed. It is recommended that each line of the file should contain a maximum of 80 characters.

FASTA formats are known for their “easy” handling, since they are only a text-based format. It is easy to manipulate using text-processing tools and scripting languages like Python.
### Example of FASTA format:   

    >seq0
     FQTWEEFSRAAEKLYLADPMKVRVVLKYRHVDGNLCIKVTDDLVCLVYRTDQAQDVKKIEKF

## Browser Extensible Data (BED)

BED format is a text file format used for storing genomic regions as coordinates and associated annotations. Its advantage is that in this format manipulation is done of coordinates instead of nucleotide sequences, which optimizes the power and computation time when comparing genomes. This format often contains a header (optional) to specify what data is in the file. This type of format is really good for comparing sequences, it is efficent using coordinates to extract sequences of interest.

### Example of BED Format:

    browser position chr7:127471196-127495720
    browser hide all
    track name="ItemRGBDemo" description="Item RGB demonstration" visibility=2 itemRgb="On"
    chr7    127471196    127472363    Pos1    0    +    127471196    127472363    255,0,0
    chr7    127472363    127473530    Pos2    0    +    127472363    127473530    255,0,0
    chr7    127473530    127474697    Pos3    0    +    127473530    127474697    255,0,0

## Moving Picture Experts Group (MPEG-G)
Today a huge amount of raw data (e.g. genome sequences) is produced. The problem that arises is that this data must be stored somewhere to be retrieved and analysed. The MPEG-G project has the effort to specify a compressed data format that enables large scale genomic data processing, transport and sharing. It is a project which tries to handle the current problem of genomic data formats towards a truly efficient handling. More on this topic can be found [here](https://mpeg-g.org/).


# Summary
-	Long genomic sequences: FASTA, BAM, SAM
-	Variants :VCF
-	for me FASTA files seemd to be the easiest to understand
