> # Report UNIX

> ##### Why do we use the terminal in bioinformatics?
> * In Bioinformatics we use the terminal to control a computer with text based commands. 
>
> ##### What is a plain text file?
> * a plain text file is written in English using the alphabet and common punctuation marks.
>
> ##### In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?
> * gute frage, nächste frage
>
> ##### How can we list files are in a directory? Please provide the command(s).
>     ls
>
> ##### What | and > do in a terminal?
> * This | allows you to use the output of one command as the input for the next one. 
> * If you use > this in the terminal it will be created a new file or the existing file will be overwritten
>
> ##### How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).
>    tail /mnt/test/test.tx
>
> ##### How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).
>     cut -df 1 /mnt/test/test.txt
>
> ##### How can we print every third line of a text file? Please provide the command(s), and discuss what they do.
>     awk 'NR % 3 == 0' 
>
> ##### How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.
>      awk 'NR % 4 == 1 {print ">"$1};                                                                                                                                                       NR % 4 == 2 {print}' file.fasta
