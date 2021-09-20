# Report questions:

* Why do we use the terminal in bioinformatics?

--> Because we interpret DNA as text. And Unix is for text streams.
--> It increases the reproducibility

* What is a plain text file?

--> It's a file that only contains text. Unlike a rich-text document, a plain text file cannot have bold text, fonts, larger font sizes, or any other special text formatting.

* In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?

--> Because "DNA-data" is huge and plain text is a very accessible way of storing data.

* How can we list files are in a directory? Please provide the command(s).

--> $ `ls` # list files in a given path
--> $ `ls -l` # lists files and their attributes

* What | and > do in a terminal?

--> |:Run command A and then pass the result to command B (joins commands together)
--> >: Push output to file, keep in mind it will get overwritten

* How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).

--> `tail /mnt/test/test.txt`

* How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).

--> `awk '{print $1}' /mnt/test/test.txt`

* How can we print every third line of a text file? Please provide the command(s), and discuss what they do.

-->`awk 'NR%3==0' file.txt ==> it prints the line only if (NR)/3 == 0

* How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

--> `awk 'NR % 4 == 1 {print ">"$1}; NR % 4 == 2 {print}' SP1.fq` ==> adds a ">" to the first line (sequence identifier) of each group of 4 and also prints the second line (genomic code) of all groups. (the other lines are ignored)

* Which are the advantages of BED/coordinate files as compared to storing just sequences?

--> The files are much smaller like this

* Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?

--> I didn't found anything (to be updated)

* We'd like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify).
We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we'd like to include the start nucleotide too) in position 1000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.

--> I will count starting by 1 and half open

* Can we store this in SAM file? Why / why not?

--> No because SAM is a sequence file

* Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?

-->Yes but we'd lose some information:
chr2 1000 1999
chr2 2000 2999
chr2 3000 3999

* And in BED6? How? Are we losing any information?

-->Possible, without losing anything.
chr2 1000 1999 A 0 +
chr2 2000 2999 B 0 +
chr2 3000 3999 C 1000 +

* And in BED12? How? Are we losing any information?

-->Same as before, but here some columnes will be "unused" they remain blank

* And in the most compact Wiggle as possible? How? Are we losing any information?

-->Yes but the names and the direction of the strands will be lost
fixedStep chrom=chr2 start=1000 step=1000 span=1000
0
0
1000
