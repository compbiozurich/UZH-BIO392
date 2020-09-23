
# Report

### Why do we use the terminal in bioinformatics?
Users can interact with the operating system of the computer through a terminal. Working with a terminal generally substitutes the graphical interface like choosing a directory with the mouse. However by working with a terminal has many advantages like being able to give more complex commands.
Also important in bioinformatics for the sake of reproducibility we need to keep track of our analysis. This can be achieved with a bash scripts, which is a plain text file that contains a series of commands we would type into the terminal.

### What is a plain text file?
A plain text file is a document that contains only text which is human readable. It means also that there is no for instance bold text, fonts (graphical representation of text) or any other special text formatting.

### In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?

* Portable format between almost any operating system -> saving the file for long term
* easy to use (just typing "words")

### How can we list files in a directory? Please provide the command(s).

```
cd /home/userB/project/docs/  # goes to choosen directory
ls -l # lists the content of the directory
````

### What | and > do in a terminal?
the '|' symbol is called 'pipe' in UNIX. It allows to directly pass the output from one program to the input of another without creating intermediate or temporary files.
The symbol ">" redirects everything before to the "thing" afterwards. For example the output of a code can be saved to a file.

### How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).

```
tail -10 /mnt/test/test.txt    # -10 is not needed because printing 10 lines is the default
````

### How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).

```
cut -f 1 /mnt/test/test.txt
```

### How can we print every third line of a text file? Please provide the command(s), and discuss what they do.

```
awk '{print NR % 3 == 0}' /mnt/test/test.txt    # if the floor fivision of the line number (NR) trough 3 is equal to zero, then it gets printed
```

### How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

```
awk 'NR % 4 == 1 {print ">"$1};  # take the line whose number when divided by 4 leaves a rest equals 1, then print ">" and make sure the data is one row
     NR % 4 == 2 {print}' SP1.fq \ # take the line whose number when divided by 4 leaves a rest equals 2
```

### Which are the advantages of BED/coordinate files as compared to storing just sequences?
BED files are better for searching for overlapping regions because they are smaller and easier to handle. 

### Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?
QC = Quality Control
In FASTQ files, which is basically a FASTA file including quality data, the probability of each nucleotide to be an incorrect nucleotide is tracked.

---
---

We'd like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify).

We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we'd like to include the start nucleotide too) in position 1000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.

### Can we store this in SAM file? Why / why not?
? Because we dont have any alignment it wouldnt make any sense to store it in a SAM file.

### Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?

```
chr2 1000 1101
chr2 1100 1201
chr2 1200 1301
```
In a BED3 file no information is stored about the score and about the strand, so we will miss this information.

### And in BED6? How? Are we losing any information?

```
chr2 1000 1101 . 0 +
chr2 1100 1201 . 0 +
chr2 1200 1301 . 1000 +
```
In  a BED6 file all information which is available from the text above can be stored. No information gets lost.

### And in BED12? How? Are we losing any information?
???
```
chr2 1000 1101 . 0 + . . 0 1 . .
chr2 1100 1201 . 0 + . . 0 1 . .
chr2 1200 1301 . 1000 + . . 0 1 . .
```
We are not loosing any information but we just cant give any more information.

### And in the most compact Wiggle as possible? How? Are we losing any information? 

```
fixedStep chrom=chr2 start=1000 step=100
0
0
1000
```
We are not loosing any information and the file is also not asking for more.
