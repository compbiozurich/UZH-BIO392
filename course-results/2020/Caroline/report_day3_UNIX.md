# Report UNIX
## Why do we use the terminal in bioinformatics?

Before the Graphical User Interface (GUI) was developed, there only was the Command Line Interface (CLI). CLI is exclusively used with text commands. In bioinformatics you interact with programs by typing things in the command line, generally through a terminal. The terminal is a text-based interface to your computer. 

The command line in somepoints is more efficient, if you for example have an algorithm or process that you want to apply to hunderds of networks. Another reason for using the terminal instead of GUI is that it is reproducible. Your code and your steps can be repeated and reviewed. In addition the command line interface provides more control on the computer.

## What is a plain text file?
A plain text means just "simple" text, namely only characters of readable material. For example, only plain text is written in the terminal (Input and Output). There is no text formatinng e.g. no **bold**, no *italic*.  

## In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?

As described in the first question, bioinformaticians use rather CLI instead of GUI. They work with huge data sets and in order to find their way around and make adaptations, it is easier to do this via the terminal. 

The data used, stored in these different file formats, are often available to the public.  This suggests that it is much more practical for all researchers to save their data in the same way (or so that they can be easily rewritten with a programme), so that everyone can benefit from them. In addition, as we learn last week, the most efficient way for storage of such big files is in plain text. 

## How can we list files are in a directory? Please provide the command(s).
The first step is to go into the directory you are interested in: `cd /C/Users/Caro/XXX` or in my case `cd ~/XXX` results in the same. 

The next step is then to list the entries in this directory by simply typing the command `ls`. `ls -l` provides us the list with some more informations, such as access rights (user, group and others), time etc.

## What | and > do in a terminal?
 - "|" in the terminal e.g. XXX | YYY: | is called "pipe" in UNIX. It symbolizes that the output from the first (XXX) will be the new input for the next (YYY), whereby no intermediate or temporary files (intermediates) are created. 
 - ">" in terminal: `>` the greater than sign is used to create a new file. Example: `old.txt > new.txt`. Pay attention by doing this, since this can overwrite a file if you name it the same way. Two >> will append the output at the end of an existing file. Example: `old1.txt old2.txt >> new.txt`.

## How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).

`tail /mnt/test/test.txt`

The tail and head command allways provide the last and respectively the first ten lines of a file.
Another option is to first go into the directory of interest: `cd /mnt/test` and after this directly typing `tail test.txt`

## How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).
First we again go in the directory we want: `cd /mnt/test`
I first tried a way that maybe is a bit complicated, since we have to create a new file first and our file should only contain one tab per line... but I show it anyway: `tr ' ' '\n' < test.txt > testnew.txt`
After this, each space is removed and we have only one column. 
Since I said above this file should only contain two columns, we now can do following command to extract only first line characters: `awk 'NR%2 == 1' testnew.txt`.

For another way I have to do some more searching...

So, what I found out is that awk extracts the line we are looking for by typing:`awk '{print $1}' test.txt`

before doing so, one should go to the directory of interest: `cd /mnt/test`

## How can we print every third line of a text file? Please provide the command(s), and discuss what they do.
first go to directory where your file of interest is: `cd /mnt/test`

second type: `awk 'NR % 3 == 0' test.txt`
The `awk` is able to scan a file line by line. By only typing `awk {print} test.txt` each line would be printed, one by one. Here we want only every third line printed, that is why we specifiy Numbers: with the modulos operator (%) we only get these lines which are divisible by 3. In the end we just specify from which file we want every third line. 


## How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

### FASTA and FASTQ
 - FASTA: header starts with '>', followed by the Sequence ID. The next lines contain the actual sequence.
 - FASTQ: contains additionally quality scores for each nucleotide. Format: A line (1) starting with '@' contains the sequence ID. Next line (2) contains the actual sequence. A new line starting with the character '+', and being either empty or repeating the sequence ID (3). Last we have one line containing the quality scores (4).
 - What do we need to transform FASTQ to FASTA?

We need the header which starts with '@' in FASTQ and should start with '>' in FASTA (first line). 
Second we need the actual sequence (second line).

By using the `sed` command we are able to replace, insert or delete in a file. The first to commands are maybe not the most elegant way of solving this problem, but since I used it above, and know how this works I just did it with the modulus operator again.

 - print lines 1, 5, 9, 13, etc.: `awk '(NR + 3) % 4 == 0' test.txt`
 - print lines 2, 6, 10, 14, etc.: `awk '(NR + 2) % 4 == 0' test.txt`
 - transfrom "@" to ">": `sed -i 's/@/>/g' test.txt`

Now those three commands should be combined somehow to create this new FASTA file...

I don't know how to do so... I will try to solve this problem at another time point:).
