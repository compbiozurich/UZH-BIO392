## Questions 
* Why do we use the terminal in bioinformatics?
> Compared to the GUI, using the terminal allows to find the commands used (history).
---
* What is a plain text file?
> Every file that contains only text. 
---
* In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?
> File compression reduces the space for storage and speed up the data circulation
---
* How can we list files are in a directory? Please provide the command(s).
> `ls ~/path/to/the/directory`
---
* What | and > do in a terminal?
> **Pipe "|"** allows us to pass from the output from one program **directly** to the input of another program. And ">" 
---
* How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).
> `tail ~/mnt/test/test.txt`
---
* How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).
> `awk -F '|' '{print $1} ~/mnt/test/test.txt `
---
* How can we print every third line of a text file? Please provide the command(s), and discuss what they do.
> `awk 'NR%4==3 {print}' file.sq`. From the file.sq, take the remainder 3 of the modulo 4 of the current line number. 
---
* How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.
> `awk 'NR % 4 == 1 {print ">"$1}; 
     NR % 4 == 2 {print}' SP1.fq 
     | > example.fa` \
Extract from the example.fa file, the 1st line (using the modulo 4 out of the number of current lines and print it with ">" (ID) with the value of line. Similar for the 2nd line (seuqence), but just print it. 
---
* Which are the advantages of BED/coordinate files as compared to storing just sequences?
> They are smaller and easier to handle and are designed for genome browser. 
---
* Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?
> - Phred-Scaled Quality score 
> - Read quality 
> - Mapping quality 
> - Variant calling quality 
---
* We'd like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify). \
We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts \ 
(we'd like to include the start nucleotide too) in position 1000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B \
have a score of 0, and interval C has a score of 1000.
> **?** 
---
* Can we store this in SAM file? Why / why not?
> No, because SAM format is used for alignements. It would be possible to align them using online tools however, the specie and the reference genomes are not given. 
---
* Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?
> Yes, we can. However, we lose the following information: plus strand and scores.
---
* And in BED6? How? Are we losing any information?
> Yes, we can too. However, we lose the information about the starting position. 
---
* And in BED12? How? Are we losing any information?
> We would need more information such as the number of blocks (exons) in the BED line. 
---
* And in the most compact Wiggle as possible? How? Are we losing any information?
> No, since we do not have the distance between the data values. 
