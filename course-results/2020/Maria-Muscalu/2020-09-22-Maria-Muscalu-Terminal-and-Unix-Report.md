## Terminal and Unix Report

### *1. Why do we use the terminal in bioinformatics?*

The terminal can be used to look a data files. For example, with some commands new folders and files can be made, data from URL links can be saved as well as copied to new files. The terminal code can extract and save specific data parts, as needed. Amongst other things, the terminal can display the data, the number of lines and other specific information.

*What is a plain text file?*

It is a document that can be used to write and display only text. These text files usually have a defined structure according to the format in which they come (e.g. SAM, FASTA, FASTQ, BED).


*In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?*

When working with genome sequences, usually a lot of data is generated which needs to be stored, processed and analysed. The plain text files provide an accessible way to store the data, as they use up less space and at the same time they can still be visualised, worked with and understood.

*How can we list files are in a directory? Please provide the command(s).*
The command for this is **l -ls**.

*What | and > do in a terminal?*

The **|** symbol is called a “pipe” and it can be written in between commands in order to pass the output from one command to the other without having to save the extracted data I between or creating new files.
For example:
awk 'NR % 2 == 0' ~/course/data/example.bed | wc -l
This example indicates how to use the **|** symbol to pass the data from the first command to the second one. First of all, every second line is extracted from these example.bed file and then the number of lines are counted.

The **>** symbol is used when the data is saved for example from an URL and into a text file. 
For example:
curl -L https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/SP1.fq  > SP1.fq

*How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).*

tail -10 ~/mnt/test/test.txt

*How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).*

awk '{print $1}' ~/mnt/test/test.txt 

*How can we print every third line of a text file? Please provide the command(s), and discuss what they do.*
awk 'NR % 3 == 0' ~/ mnt/test/test.txt 
This command will print every line for which the condition NR % 3 == 0 is true. In this condition the NR is the number of the current line and if this number is divided by 3 and there is no remainder then the line is printed.

*How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.*

In the FASTQ file four lines are used for one sequence, while the FASTA format uses only two. The FASTA format has as a first line the sequence identifier (which begins with the @ symbol), followed by the sequence, then a separator (which is a line that only has the + symbol) and the fourth line is the base [[1]]. To convert the FASTQ file to FASTA requires the extraction of the sequence identifier and the nucleotide sequence, which are the first two lines.

awk 'NR % 4 == 1 {print ">"$1}; NR % 4 == 2' example.fq

 NR % 4 == 1 will print only the lines, for which the line number (NR) divided by 4 has 1 as remainder. 

{print ">"$1} will print the > symbol in front of the first column, or in this case in front of the sequence identifier

NR % 4 == 2 will print only the lines, for which the line number (NR) divided by 4 has 2 as remainder.

“;” symbol stands for “or”, which means that the command is executed if the first part ('NR % 4 == 1 {print ">"$1}) **or** the second part (NR % 4 ==2) is true


[1]: https://support.illumina.com/bulletins/2016/04/fastq-files-explained.html
