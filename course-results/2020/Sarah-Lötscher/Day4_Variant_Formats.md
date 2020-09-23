## Task: Exploration and Reading up on Variant Formats

### SAM  (Sequence Alignment Map)

-Type of alignement file.

-Starts with a header containing information about the reference genome such as name and length and information about the sequencing and alignement.
After the header the alined sequences are listed along with ther information like their names and position and what the differences are to the reference and where to find them on the sequenze.

-The SAM format also gives a quality score for each alignment.

````
@HD    VN:1.3    SO:coordinate
@SQ    SN:conticA    LN:443
@SQ    SN:contigB    LN:1493
@SQ    SN:contigC    LN:328

readID43GYAX15:7:1:1202:19894/1    256    contig43    613960    1    65M    *    0    0    CCAGCGCGAACGAAATCCGCATGCGTCTGGTCGTTGCACGGAACGGCGGCGGTGTGATGCACGGC 
EDDEEDEE=EE?DE??DDDBADEBEFFFDBEFFEBCBC=?BEEEE@=:?::?7?:8-6?7?@??#    AS:i:0    XS:i:0  XN:i:0  XM:i:0  XO:i:0  XG:i:0  NM:i:0  MD:Z:65  YT:Z:UU

readID43GYAX15:7:1:1202:19894/1    272    contig32    21001    1    65M    *    0    0    GCCGGACGTCACACGGCCGCCGGGCCGGTCTACGACCAGACGCATGCGGATTTCGTTAGAGCCGG 
#??@?7?6-8:?7?::?:=@EEEEB?=CBCBEFFEBDFFFEBEDABDDD??ED?EE=EEDEEDDE    AS:i:-5    XS:i:0   XN:i:0  XM:i:1   XO:i:0   XG:i:0   NM:i:1   MD:Z:42T22   YT:Z:UU
````
More about SAM : [URL1](https://samtools.github.io/hts-specs/SAMv1.pdf) / [URL2](https://sites.google.com/site/wiki4metagenomics/tools/samtools/bam-sam-file-format)

 ------
 
 ### BAM  (Binary Alignment Map)

-The SAM format can be compressed into a BAM which is binary file. Bam files can't be read by eye but there are algoroithms that can deal with this format. 

-BAM files also consist of a header section containing information such as sample name, sample length, and alignment method and the Alingement sequence.

-BAM files can apparently be visualised in genome browsers such as UCSC.

 [More about BAM](https://support.illumina.com/help/BS_App_RNASeq_Alignment_OLH_1000000006112/Content/Source/Informatics/BAM-Format.htm)
 
 ------

### VFC  (Variant Call Format)

-The VFC format is used to store informations about variants and genetic alterations compared to a specified reference genome.

-It also contains a header with informationa about the reference genome.

-A VFC file specifies exactly at what position of the reference, which type of variant is present in the sample sequences compared to the reference sequence.

````
##fileformat=VCFv4.3
##fileDate=20090805
##source=myImputationProgramV3.1
##reference=file:///seq/references/1000GenomesPilot-NCBI36.fasta
##contig=<ID=20,length=62435964,assembly=B36,md5=f126cdf8a6e0c7f379d618ff66beb2da,species="Homo sapiens",taxonomy=x>
##phasing=partial
##INFO=<ID=NS,Number=1,Type=Integer,Description="Number of Samples With Data">
...
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
````
 [More about VFC](https://samtools.github.io/hts-specs/VCFv4.2.pdf)

------
### FASTA

-FASTA is a format for storing DNA sequences.

-In the FASTA file sequences are listed starting with '>' follwed by the sequence name and information. On the next line the whole nucleotide or aminoacid sequence is displayed. 

-FASTA files with sequence information of specific genomes can be downloaded from Genome browsers such as NCBL.

````
>gi|186681228|ref|YP_001864424.1| phycoerythrobilin:ferredoxin oxidoreductase
MNSERSDVTLYQPFLDYAIAYMRSRLDLEPYPIPTGFESNSAVVGKGKNQEEVVTTSYAFQTAKLRQIRA
AHVQGGNSLQVLNFVIFPHLNYDLPFFGADLVTLPGGHLIALDMQPLFRDDSAYQAKYTEPILPIFHAHQ
QHLSWGGDFPEEAQPFFSPAFLWTRPQETAVVETQVFAAFKDYLKAYLDFVEQAEAVTDSQNLVAIKQAQ
LRYLRYRAEKDPARGMFKRFYGAEWTEEYIHGFLFDLERKLTVVK

````
 
 [More about FASTA](https://zhanglab.ccmb.med.umich.edu/FASTA/) 
