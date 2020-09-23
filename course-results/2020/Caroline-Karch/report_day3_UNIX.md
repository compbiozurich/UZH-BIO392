# Report UNIX 
### Why do we use the terminal in bioinformatics?

Before the Graphical User Interface (GUI) was developed, there only was the Command Line Interface (CLI). CLI is exclusively used with text commands. In bioinformatics you interact with programs by typing things in the command line, generally through a terminal. The terminal is a text-based interface to your computer. 

The command line in somepoints is more efficient, if you for example have an algorithm or process that you want to apply to hunderds of networks. Another reason for using the terminal instead of GUI is that it is reproducible. Your code and your steps can be repeated and reviewed. In addition the command line interface provides more control on the computer.

### What is a plain text file?
A plain text means just "simple" text, namely only characters of readable material. For example, only plain text is written in the terminal (Input and Output). There is no text formatinng e.g. no **bold**, no *italic*.  

### In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?

As described in the first question, bioinformaticians use rather CLI instead of GUI. They work with huge data sets and in order to find their way around and make adaptations, it is easier to do this via the terminal. 

The data used, stored in these different file formats, are often available to the public.  This suggests that it is much more practical for all researchers to save their data in the same way (or so that they can be easily rewritten with a programme), so that everyone can benefit from them. In addition, as we learn last week, the most efficient way for storage of such big files is in plain text. 

### How can we list files are in a directory? Please provide the command(s).
The first step is to go into the directory you are interested in: `cd /C/Users/Caro/XXX` or in my case `cd ~/XXX` results in the same. 

The next step is then to list the entries in this directory by simply typing the command `ls`. `ls -l` provides us the list with some more informations, such as access rights (user, group and others), time etc.

### What | and > do in a terminal?
- | in the terminal e.g. XXX | YYY: | is called "pipe" in UNIX. It symbolizes that the output from the first (XXX) will be the new input for the next (YYY), whereby no intermediate or temporary files (intermediates) are created. 
- '>' in terminal: `>` the greater than sign is used to create a new file. Example: `old.txt > new.txt`. Pay attention by doing this, since this can overwrite a file if you name it the same way. Two >> will appends the output at the end of an existing file. Example: `old1.txt old2.txt >> new.txt`.

### How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).

`tail mnt/test/test.txt`
The tail and head command allways provide the last and respectively the first ten lines of a file.
Another option is to first go into the directory of interest: `cd mnt/test` and after this directly typing `tail test.txt`

### How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).
First we again go into the directory we have our file into: `cd mnt/test`

The awk command looks at the file line by line. By typing `awk '{print $1}' test.txt` we  get the first column only. (or direct `awk '{print $1}' mnt/test/test.txt`


### How can we print every third line of a text file? Please provide the command(s), and discuss what they do.
first go to directory where your file of interest is: `cd mnt/test`

second type: `awk 'NR % 3 == 0' test.txt`

The `awk` is able to scan a file line by line. By only typing `awk {print} test.txt` each line would be printed, one by one. Here we want only every third line printed, that is why we we use NR (current line number). With the modulos operator (%) we only get these lines which are divisible by 3 with a remain of 0. In the end we just specify from which file we want every third line. (or direct `awk 'NR % 3 == 0' mnt/test/test.txt`)


### How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

### FASTA and FASTQ
 - FASTA: header starts with '>', followed by the Sequence ID. The next lines contain the actual sequence.
 - FASTQ: contains additionally quality scores for each nucleotide. Format: A line (1) starting with '@' contains the sequence ID. Next line (2) contains the actual sequence. A new line starting with the character '+', and being either empty or repeating the sequence ID (3). Last we have one line containing the quality scores (4).
 
#### What do we need to transform FASTQ to FASTA?

We need the header which starts with '>' in FASTA (first line of FASTQ). Second we need the actual sequence (second line of FASTQ).

#### How do we get the lines we want? 
With the `awk` command we look at our FASTAQ file line by line. We first specify `'NR % 4 == 1'` this means that we devide NR (line number) by 4, if the remain is 1 (modulus operator), then these statement is true. `{print ">"$1}`, this following command is used to say "what to do if the command was correct" so we want to print this line with the greater than sign in advance. 
What we want next is the second line (actual sequence). This line is identical in FASTQ and FASTA. We again specify every second line by typing `NR % 4 == 2`. In the end we just tell for which file this should be done (FASTQ.fq). In the end we can (if we want) save the FASTA format with the > sign.

`awk 'NR % 4 == 1 {print ">"$1}; 
     NR % 4 == 2 {print}' FASTQ.fq > FASTA.fa`



### Which are the advantages of BED/coordinate files as compared to storing just sequences?

|Sequence storing file format|Example|Coordinate file format|Example|
|:---|:---|:---|:---|
|FASTA| >VIT_201s0011g0352530\n AAAAAAAAAATTTTTTTTTGGGGGGGGCCCCCCCCC|BED3| chr7    127471196  127472363\n chr7    127472363  127473530|

The advantage of BAM files is that they refere to a reference genome, they do not list the whole sequence. Therefore the storage they need is much smaller compared to sequence storing files. 

### Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?
- not finished

## We'd like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify). We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we'd like to include the start nucleotide too) in position 1000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.

I will use:

- counting: 0, 1, 2, 3, ...
- Interval: half - open 

![Interval](http://genome.ucsc.edu/blog/wp-content/uploads/2016/12/newInterval.png)


### Can we store this in SAM file? Why / why not?
No we can not, since it is written "we don't have reads". SAM files require  genome sequence reads.
 
### Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?
BED3
1. chrom: name of the chromosome
2. chromStart: starting position
3. chromEnd: ending position

Since we have some more information given in the text regarding position (ABC), score and strand, we lose information in this BED3.


    chr2   1000   1999   
    chr2   2000   2999  
    chr2   3000   3999
 
### And in BED6? How? Are we losing any information?
BED6
4. name: defines name of BED line
5. score: between 0-1000
6. strand: defines the strand (+ or -)


    chr2   1000   1999   A   0      +
    chr2   2000   2999   B   0      +
    chr2   3000   3999   C   1000   +

We don't lose any information, all of the information given in the text could be used to fill up BED6.

### And in BED12? How? Are we losing any information?

As mentioned before we don't have more information that could be used to expand BED. By making a BED12, more storage would be used since we have more columns (+6) but no further information is gained. Anyway, no information would get lost.

    chr2   1000   1999   A   0      +   .   .   .   .   .   .
    chr2   2000   2999   B   0      +   .   .   .   .   .   .
    chr2   3000   3999   C   1000   +   .   .   .   .   .   .


### And in the most compact Wiggle as possible? How? Are we losing any information?
WIG is used to display dense, continous data in a more compressed way. 

It should be possible:

    fixedStep chrom=2 start=1000 step=1000 span=1000
    0
    0
    1000

If we lose information? We for sure lose the information of "name", I'm not sure if we lose the information about the strand, maybe we can fix this problem by doing this (but I don't know if this is allowed to do):

    fixedStep chrom=2 start=1000 step=1000 span=1000 strand=+
    0
    0
    1000
