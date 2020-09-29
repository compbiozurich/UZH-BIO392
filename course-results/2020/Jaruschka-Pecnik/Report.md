# Report 


## Why do we use the terminal in bioinformatics?
Terminal is a text-based interface to the computer where the commands that are typed in will be executed by the command line interpreter (CLI). This allows more flexibility and efficinecy in comparison of using the graphical users interface (GUI) instead.


## What is a plain text file?
A plain text file is a loose term file for data including only characters of readable material. It differs from formatted text and binary files.


## In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?
They are more readable for us and easier to store, since they use in the compressed format less space.

## How can we list files are in a directory? Please provide the command(s).

    ls -l


## What | and > do in a terminal?
- the "|" symbol is called pipe in UNIX
	- it directly passes the output form one program (left side of the pipe) to the input of another (right side of the pipe) without creating intermediate steps in files
- the ">" symbol is used to get something into a file (left side is the input for the right side)


## How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).

    tail ~/mnt/test/test.txt


## How do we print the first column of the file named /mnt/test/test.txt whose columns are separated by tabs? Please provide the command(s).

    awk 'print{$1}' ~/mnt/test/test.txt


## How can we print every third line of a text file? Please provide the command(s), and discuss what they do.

    awk 'NR % 3 == 0' ~(directory of text file)
    
- when the NR (current line number) is divided (%) by 3 and this equation is equal (==) 0, the line is printed
- the modulo operator (%) should give in this example after the division 0, because no remainder are expected


## How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.
- in general, FASTA consits of the sequence identifier of the FASTQ with a ">" in front of the line and the following line is the genomic code 

    awk 'NR % 4 == 1 {print ">" $1}; NR % 4 == 2 {print}' file.fq

- awk reads the lines of the file
- 'NR % 4 == 1 {print ">" $1} 
	-> the first line of the FASTQ sequence will be used (FASTQ has 4 lines) and printed with an ">" in fornt of the first line (typical for FASTA)
- NR % 4 == 2 {print}' 
	-> the second line of the FASTQ file will be printed
- file.fq is a FASTQ file


## Which are the advantages of BED/coordinate files as compared to storing just sequences?
- simpler data representation, which is smaller and easier to handle
- usually BED files are the next step after getting the SAM files, where for instance BED files get generated with genomic coverages after mapping a new genome-wide sequencing


## Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?
During a bioinformatic variant calling are the quality control values, the Phred quality scores, tracked. These scores are logarithmically linked to error probabilities (Q = -10 log<sub>10 *P*). It is important to know, which NGS was used, because the encoded score frame can vary.


## We’d like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify). We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we’d like to include the start nucleotide too) in position 1000 of chr2. We don’t have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.
- concerning the encode counting I would use the 0-start, hybrid-interval/ half-open (interval type is: start-included, end-excluded), because it is more human readable and the UCSC Genome Browser uses it as well


## Can we store this in SAM file? Why / why not?
- no, a SAM file is for sequences


## Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?
- yes, because in BED3 are only the information for chromosome (scaffold), start and end
- file:

    >chr2 1000 1999 <br>
    >chr2 2000 2999 <br>
    >chr2 3000 3999 <br>


## And in BED6? How? Are we losing any information?
- no, because additionaly to BED3 BED6 has information about name, score and strand

    >chr2 1000 1999 A 0 + <br>
    >chr2 2000 2999 B 0 + <br>
    >chr2 3000 3999 C 1000 + <br>


## And in BED12? How? Are we losing any information?
- no there won't be any information lost, because we don't have more information
- the file would look like the one from BED6, but the addiditional column that come with that format would be empty


## And in the most compact Wiggle as possible? How? Are we losing any information?
- yes, but information will get lost, since the criteria of the strand can't be integrated 

    >fixedStep chrom=chr2 start=1000 step=1000 span=1000 <br>
    >0 <br>
    >0 <br>
    >1000




