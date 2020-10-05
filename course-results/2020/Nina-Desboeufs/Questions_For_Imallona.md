## Questions 
* Why do we use the terminal in bioinformatics?
> Compared to the GUI, using the terminal improves the reproducibility (history/ bash scripts) as well as the efficiency of large data processing. Furthermore, Unix is designed to handle text streams (text streams are used for DNA and proteins in bioinformatics). 
---
* What is a plain text file?
> Every file that contains only text, i.e. sequence of characters (vs rich text;  mapped directly to ASCII characters). A major advantage of plain text file is the portability, meaning that it is portable between the different operating systems. Here is a list of plain text file editors: vim, BBEdit, Byword.
---
* In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?
> Plain text files reduces the space for storage and speed up the data circulation. 
---
* How can we list files are in a directory? Please provide the command(s).
> `ls ~/path/to/the/directory` and `ls -l`for long format. 
---
* What | and > do in a terminal?
> Pipe "|" allows us to pass from the output from one program directly to the input of another program. 
> ">" executes the output into the following file. 
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
> I would use 0-indexed and fully-closed. 
---
* Can we store this in SAM file? Why / why not?
> No, because SAM format is used for alignements. It would be possible to align them using online tools however, the specie and the reference genomes are not given. 
---
* Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?
> Yes, we can. However, we lose the following information: plus strand and scores.  \
chr2 1000 1999 \
chr2 2000 2999 \
chr2 3000 3999
---
* And in BED6? How? Are we losing any information?
> Yes, we can too and no information lost. \
chr2 1000 1999 Interval A 0 +\
chr2 2000 2999 Interval B 0 +\
chr2 3000 3999 Interval C 1000 + 
---
* And in BED12? How? Are we losing any information?
> Yes, however, we would need "." since information such as the number of blocks (exons) in the BED line is not given. 
---
* And in the most compact Wiggle as possible? How? Are we losing any information?
> Yes, however, the direction of the strands are missing.
