## Day 3 Report unfinished

* Why do we use the terminal in bioinformatics?

   When working with many or large data its more easy and efficient to use the terminal


---
* What is a plain text file?



---
* In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?

This makes it

---
* How can we list files are in a directory? Please provide the command(s).


'ls' 
or 'ls -l'for long listing format including the access rights

'ls -a' to display all files including current '.' and parent '..' directories as well as other hidden files and directories

---
* What | and > do in a terminal?


To redirect the input of a command use '<' sign.

for example : $sort > file.txt  (sorts lines of file.txt)



'|' is used to pass  the output directly from one program to the input of another.

for example : $sort -u file.txt| wc -l  (sorts lines of file.txt and then counts them in this case the sort -u removes dublicates)


---
* How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).

$ tail mnt/test/test.txt


---
* How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).
 $ cut -d -f 1 mnt/test/test.txt

---
* How can we print every third line of a text file? Please provide the command(s), and discuss what they do.



---
* How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

