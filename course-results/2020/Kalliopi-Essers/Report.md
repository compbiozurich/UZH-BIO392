# Report UNIX

##### Why do we use the terminal in bioinformatics?
* In Bioinformatics we use the terminal to control a computer with text based commands. Working on the Command Line Interface (CLI) is more efficent than on the Graphical User interface (GUI). On the CLI you are able to work reproducible and with multiple networks.

##### What is a plain text file?
* a plain text file is written in English using the alphabet and common punctuation marks.

##### In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?
* Plain texts can be compressed simpler and therefor the data can be saved with smaller storage. The data is in this formats more practical to be rewritten and used from other researchers.

##### How can we list files are in a directory? Please provide the command(s).
    ls
##### What | and > do in a terminal?
* This | allows you to use the output of one command as the input for the next one. 
* If you use > this in the terminal it will be created a new file or the existing file will be overwritten

##### How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).
    tail /mnt/test/test.tx

##### How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).
    cut -df 1 /mnt/test/test.txt

##### How can we print every third line of a text file? Please provide the command(s), and discuss what they do.
    awk 'NR % 3 == 0' 

##### How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.
     awk 'NR % 4 == 1 {print ">"$1};
          NR % 4 == 2 {print}' file.fasta

##### Which are the advantages of BED/coordinate files as compared to storing just sequences?
* The advantage of the BED files is that they need less storage compared to sequence storing files. The files refere to a reference genome. It do not list the hole genome, you just look up the sequence you are interestet in.

##### Which QC values are tracked during a normal bioinformatic NGS workflow? (from sequencing to variant calling)?
* The Quality control (QC) of the sample, the library, the sequencing, the sequence analysis viewer and the sequencing reads.

### We’d like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify).

### All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we’d like to include the start nucleotide too) in position 1000 of chr2. Intervals A and B have an score of 0, and interval C has a score of 1000.
    0-start, half-open

##### Can we store this in SAM file? Why / why not?
* No, for that we need genome sequence reads.
##### How would we store this information in BED3? Are we losing any information?
* BED3 contains name of the chromosome, the startig positon and ending position'. Therefore we lose some information.

        chr2    1000    1999
        chr2    2000    2999   
        chr2    3000    3999


##### And in BED6? Are we losing any information?
* BED6 contains BED3 and the name,  the score and the strand. With BED6 we do not have any loss of information.

        chr2    1000    1999    A   0       +
        chr2    2000    2999    B   0       +
        chr2    3000    3999    C   1000    +

##### And in BED12? Are we losing any information?
* BED12 is BED6 with far more information, which we don't have in this case. So there is no loss of information at all.

        chr2    1000    1999    A   0       +   .   .   .   .   .   .
        chr2    2000    2999    B   0       +   .   .   .   .   .   .
        chr2    3000    3999    C   1000    +   .   .   .   .   .   .

##### And in the most compact Wiggle as possible? Are we losing any information?
    fixedStep chrom=2 start=1000 step=1000 span=1000 strand=+
    0
    0
    1000
