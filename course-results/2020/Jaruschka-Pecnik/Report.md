# Report 

**Why do we use the terminal in bioinformatics?**

**What is a plain text file?**
A plain text file is a loose term file for data including only characters of readable material. It differs from formatted text and binary files. [Source](https://en.wikipedia.org/wiki/Plain_text)

**In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?**
- that they are readable for us and to store them it is easier and uses less space, when the are compressed

**How can we list files are in a directory? Please provide the command(s).**
- command: ls -l

**What | and > do in a terminal?**
- the "|" symbol is called pipe in UNIX
	- directly pass the output form one program ro the input of another without creating intermediate steps in files
- the ">" symbol is


**How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).**
- commands to use:
	- 'sort -nr' command: for sort the file in reverse order
	- 'head -10' command: display only the first ten lines of the reverse-ordered file
- whole command: /mnt/test/test.txt | sort -nr | head -10

**How do we print the first column of the file named /mnt/test/test.txt whose columns are separated by tabs? Please provide the command(s).**
- commands to use:
	- "'tr " " "\\n"' command: for transforming the following characters into next line characters
	- '<' command: executing the left part of the symbol using the content on the right side of the symbol (the file)
	- 'head -1' command: displays the first line of characters
- whole command: tr " " "\\n" < /mnt/test/test.txt | head -1

**How can we print every third line of a text file? Please provide the command(s), and discuss what they do.**
- command: awk 'NR%3==0' ~ (directory of text file)
- NR is equal to the current line number
- the NR number is divided by 3 and the modulo operator of 3 should be equal 0, since there should not be any left overs (for the third line)


**How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.**
- commands: awk 'NR % 4 == 1 {print ">"$1}; NR % 4 == 2 {print}' file.fq


**Which are the advantages of BED/coordinate files as compared to storing just sequences?**
- simpler data representation, which is smaller and easier to handle
- usually BED files are the next step after getting the SAM files, where for instance BED files get generated with genomic coverages after mapping a new genome-wide sequencing


**Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?**
- 


**We’d like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify). We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we’d like to include the start nucleotide too) in position 1000 of chr2. We don’t have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.**
- concerning th encode counting:
	- I would use the 0-start, hybrid-interval/ half-open (interval type is: start-included, end-excluded), because it is more human readable and the UCSC Genome Browser uses it as well


- **Can we store this in SAM file? Why / why not?**
	- no, a SAM file is for sequences

- **Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?**
	- yes, because in BED3 are the information for chromosome (scaffold), start and end
	- file:
		- chr2		1000		1999
		- chr2		2000		2999
		- chr2		3000		3999


- **And in BED6? How? Are we losing any information?**
	- no, because additionaly to BED3 BED6 has information about name, score and strand
		- chr2		1000		1999		A		0		+
		- chr2		2000		2999		B		0		+
		- chr2		3000		3999		C		1000	+

- **And in BED12? How? Are we losing any information?**
	- no there won't be any information lost, because we don't have more information
	- the file would look like the one from BED6, but the addiditional column that come with that format would be empty

- **And in the most compact Wiggle as possible? How? Are we losing any information?**





