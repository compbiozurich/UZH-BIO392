# Report

* Why do we use the terminal in bioinformatics?
> The terminal is the command line interface (CLI, shell) between the user and the kernel. It's inteprets and execute the UNIX commands the user types in. MacOS and GNU/Linux computers have an terminal preinstalled. In Bioinformatics, we interpret DNA, proteins as text. Therefore, we use the UNIX language and the terminal to handle this big text data.

* What is a plain text file?
> A plain text file is a file that only contains text. The text is also no formatted. 

* In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). 
  For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). 
  Why is that?
> **!!!!????**

* How can we list files are in a directory? 
  Please provide the command(s).
> ls
  
* What | and > do in a terminal?
> We can use the pipe '|' to combine several commands at the same time on the same line. | will pass directly the output from one program to another without creating intermediate or temporary files. 
> '>' can be used to store the execution of a command in a new file. The file is either already present or will be created. 

* How do we print the last 10 lines of the file named /mnt/test/test.txt? 
  Please provide the command(s).
> tail /mnt/test/test.txt

* How do we print the first column of the file named /mnt/test/test.txt whose columns are separated by tabs? 
  Please provide the command(s).
> cut -df 1 /mnt/test/test.txt
> *(or can I skip '-d' and just use '-f'?)*

* How can we print every third line of a text file? 
  Please provide the command(s), and discuss what they do.
> akwk 'NR%9==3' 
> **?? siehe Exercise 9 Day3**

* How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? 
  Please provide the command(s), and discuss what they do.
> **?!?!?!**
