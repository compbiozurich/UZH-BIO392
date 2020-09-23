# Report questions:

* Why do we use the terminal in bioinformatics?
--> Because we interpret DNA as text. And Unix is for text streams.
--> It increases the reproducibility

* What is a plain text file?
--> It's a file that only contains text. Unlike a rich-text document, a plain text file cannot have bold text, fonts, larger font sizes, or any other special text formatting.

* In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?
--> Because "DNA-data" is huge and plain text is a very accessible way of storing data.

* How can we list files are in a directory? Please provide the command(s).
$ 'ls' # list files in a given path
$ 'ls -l' # lists files and their attributes

* What | and > do in a terminal?

* How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).

* How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).

* How can we print every third line of a text file? Please provide the command(s), and discuss what they do.

* How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

* Which are the advantages of BED/coordinate files as compared to storing just sequences?

* Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?

* Can we store this in SAM file? Why / why not?

* Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?

* And in BED6? How? Are we losing any information?

* And in BED12? How? Are we losing any information?

* And in the most compact Wiggle as possible? How? Are we losing any information?
