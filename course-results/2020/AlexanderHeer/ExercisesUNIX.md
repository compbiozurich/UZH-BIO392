# Introduction to UNIX: Exercises


## Why do we use the terminal in bioinformatics?

While not as intuitive and visualy pleasing as many GUIs, there are many advantages in working in the terminal. A GUI might look nice but the drawback is, that it costs us processing power. Furthermore, creating a GUI is time itensive. With the fast past that new methods are developed, it would not be possible to keep up. The terminal also has the advantage, that many terminals could be plugged into one computer, allowing many people to use it at once. The UNIX operating system also allows mutliple programs to run at once on the computer. All this makes the terminal an extremely efficient tool. 

## What is a plain text file?

A file that consists only of characters (letter, numbers and punctuation marks). Due to them being so simplistic, they can in most cases be transfered between operating systems without problems and are generally easy to work with.


## In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq, but also SAM, BED, GTF, VCF and others. Why is that?

Sequencing genetic information produces huge amounts of data that have to be feasibly stored. Plain text files have a simple structure, and therefore use less space, but can still be worked with in a multitude of ways , therefore they are well suited for storing large amounts of data. 

----
## How can we list files in a directory? Please provide the command(s).

the **ls** command displays the content of a directory. It comes with many options:

* -l = uses a long listing format, including the access rights
* -h or --human-readable =prints file and directory sizes in human readable format
* -t = sorts by modification time - the default sorting is the filename
* -r = reverses the order while sorting
* -a or --all = display all files, including those which names start with a '.' (hidden sub directories → current & parent directory as well as others )

----
## What | and > do in a terminal?

**|** is called a pipe and its function is to pass output directly from one program to the input of another
**>** redirects outputs into a file (specified right after), if the specified file exists already, it will be overwritten

----
## How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).

```javascript
tail -10 ~/mnt/test/test.txt
```
----
## How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).

```javascript
awk '{print $1}' ~/mnt/test/test.txt
```

```javascript
awk '{print NR % 3 == 0}' filename.txt 
```

The awk command indicates that the following program is witten in the scripting language awk. The following program takes the file (filename.txt in this case) and goes through the file line by line, dividing the number of the line by 3. If the remainder of the division equals 0, the line will be printed.

----
## How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do

```javascript
awk 'NR % 4 == 1 {print ">"$1}; NR % 4 == 2 {print}' filename.fq > filename.fa
```
Again, we use the awk scripting language and we work again with the modulo. A fastq file has 4 lines, so we use the modulo 4, meaning we divide the number of every line by 4.In the first part we want to retrieve the header.Therefore, if the remainder is 1, the conditions in the brackets are applied to the line. This condition will always be the case for the header lines. It will print ">" and after that the first field of the line. In the second part we retrieve the sequene by asking for the remainder 2 and print it. Of course, we also have to sepcify the fastq file, that we want to transform and the filename of the fasta file that we want to create.

----
## Which are the advantages of BED/coordinate files as compared to storing just sequences?

A BED file stores genmic regions ad coordinates rather than as nucleotide sequences. This reduces storage size and makes it easy to manipulate.

----
## Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?

Read quality, mapping quality, variant calling quality are being tracked.

----

#### We'd like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify).

#### We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we'd like to include the start nucleotide too) in position 1000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.

I encode it as half open and starting a 0

##### Can we store this in SAM file? Why / why not?

As SAM files stores sequences aligned to a referecne, we cannot store it in a SAM file.

#### Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?

Yes, it is possible to store it as a BED3 file. The file would contain information about chromosome (scaffold), start and end of each interval (the start and end is why we need to specify the ecoding). However, with this format we would lose information about the name, the score and the strand. It would look like this:

```javascript
chr2 1000 1999
chr2 2000 2999
chr2 3000 3999
```

#### And in BED6? How? Are we losing any information?

This is again possible and from the given information we would not lose any. The file would look like this:

```javascript
chr2 1000 1999  A 0 +
chr2 2000 2999  B 0 +
chr2 3000 3999  C 1000 +
```

#### And in BED12? How? Are we losing any information?

Also storing it as a BED12 file would be possible. As in the BED6 we would include all the information. BED12 would also include 6 more fields (thickStart, thickEnd, itemRGB, blockCount, blockSizes and blockStarts), but as we do not have this information, these fields would jsut be empty. It would look like this:

```javascript
chr2 1000 1999  A 0 + . . . . . .
chr2 2000 2999  B 0 + . . . . . .
chr2 3000 3999  C 1000 + . . . . . .
```

#### And in the most compact Wiggle as possible? How? Are we losing any information?

We could also store it as such, but we would lose the information on the name and the strand. This is what it would look like:

```javascript
fixedStep chrom=chr2 start=1000 step=1000
0
0
1000
```
