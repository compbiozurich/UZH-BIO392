# Report 
--> still not finished

*Why do we use the terminal in bioinformatics?*
- to write the commands in it, which executes them

*What is a plain text file?*
- is a loose term file for data including only characters of readable material
- it differs from formatted text and binary files
- source (https://en.wikipedia.org/wiki/Plain_text)

*In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards).*
*For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?*
- that they are readable for us and to store them it is easier and uses less space, when the are compressed

*How can we list files are in a directory? Please provide the command(s).*
- 

*What | and > do in a terminal?*
- the "|" symbol is called pipe in UNIX
	- directly pass the output form one program ro the input of another without creating intermediate steps in files
- the ">" symbol is


*How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).*
- commands to use:
	- 'sort -nr' command: for sort the file in reverse order
	- 'head -10' command: display only the first ten lines of the reverse-ordered file
- whole command:
	- /mnt/test/test.txt | sort -nr | head -10

*How do we print the first column of the file named /mnt/test/test.txt whose columns are separated by tabs? Please provide the command(s).*
- commands to use:
	- "'tr " " "\\n"' command: for transforming the following characters into next line characters
	- '<' command: executing the left part of the symbol using the content on the right side of the symbol (the file)
	- 'head -1' command: displays the first line of characters
- whole command:
	- tr " " "\\n" < /mnt/test/test.txt | head -1

*How can we print every third line of a text file? Please provide the command(s), and discuss what they do.*


How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

















