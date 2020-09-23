## Day 3 Report unfinished

* Why do we use the terminal in bioinformatics?

   When working with many or large data its more easy and efficient to use the terminal. Italso gives the opportunity to save your work history / script.


---
* What is a plain text file?



---
* In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?

   This makes it easier to access the data and work with it via terminal or other applications. Depending on what type of file format there is also a defined way/structure how the data is presented in the file which makes it easier to retrieve or find whatever is needed.

---
* How can we list files are in a directory? Please provide the command(s).


   '$ ls' 
   or 'l$ s -l 'for long listing format including the access rights

   '$ ls -a' to display all files including current '.' and parent '..' directories as well as other hidden files and directories

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

   $awk 'NR % 3 == 0'  test.txt 

   This prints every third line by dividing the line number by three , if the remainder = 0 then it prints the line , else it goes to the next line.



---
* How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

   $ awk ‘NR % 4 ==1 {a=substr($0,2);}  NR % 4 ==2  {print”>”a”\n”$0}’  file.fasta
   
   Takes the first line with the identifier and the second line with the sequence, and replaces "@" with ">"
   
   
---
* Which are the advantages of BED/coordinate files as compared to storing just sequences?



---
* Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?




---
* We'd like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify).

We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we'd like to include the start nucleotide too) in position 1000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.

    Can we store this in SAM file? Why / why not?

    Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?

    And in BED6? How? Are we losing any information?

    And in BED12? How? Are we losing any information?

    And in the most compact Wiggle as possible? How? Are we losing any information?

   
   
   
