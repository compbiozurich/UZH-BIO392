
 ### 1. Why do we use the terminal in bioinformatics?

-  The terminal with only a simple command line interface, is efficient,scalable, portable and facilitates reproducibility. It also allows multiple terminals to be plugged into one computer facilitating its use for many people as well as allowing multiple programs to run at once on the computer.

### 2. What is a plain text file?

-  A plain text file is a type of file, which contains only ASCII characters(letter,numeric and punctuation marks) but no specific effects such as graphs and images.  Moreover this file  is simple to use and it facilitates the portability between all operating system.

### 3. In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq, but also SAM, BED, GTF, VCF and others. Why is that?

- Bioinformaticians are using this type of file format because of the small storage size, reproducibility but also for its protability.

### 4. How can we list files are in a directory? Please provide the command(s).

```
ls [options] [relative path/absolute path]

```
- possible options: -l: listing the long format
### 5. What | and > do in a terminal?

- '>': it will redirect the output into a new file
- '|':  the pipe will pass the output from one program to the input of another file without creating a temporaray file.


### 6. How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).
```
tail ~/mnt/test/test.txt
```
- Don't need to specify the number of lines as the "tail" default is the listing the last 10 lines.

### 7. How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).
```
awk '{print $1}' ~/mnt/test/test.txt
```

### 8. How can we print every third line of a text file? Please provide the command(s), and discuss what they do.
```
awk 'Nr % 3== 0' filename.txt
```
-  It takes each line number (NR) and divides it by the modulo 3. If the remainder of the division is zero then this line is printed.


### 9. How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.
```
awk 'NR % 4 == 1 {print ">"$1}; 
     NR % 4 == 2 {print}' filename.fq > example.fa
```

-  NR % 4 == 1 {print ">"$1}: it takes the number of the line(NR) and uses the modulo 4 (as fastq has 4 lines per record) to get the remainder. If the remainder is 1, then it will retrieve this line and will print it as the header line in the fasta file.
-  NR % 4 == 2 {print}' filename.fq: it will uses the same line as the command before and will retrieve lines, where the remainder is 2 and will extract it as the sequence line in the fasta file format.
-  if both conditions are True , retrieved lines are saved in filename.fq


### 10. Which are the advantages of BED/coordinate files as compared to storing just sequences?

-  It uses specific coordinates instead of a nucleotide sequence. It is stored as 1 line per sequence, which reduces the storage size.


### 11. Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?

-  For the sequence quality: Phred score is used: Q=-10log10P, however depending on the technology used, the Phred score encoding may vary.Moreover we have the read quality, mapping quality and variant callint quality score


### 12. We'd like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify).We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we'd like to include the start nucleotide too) in position 1000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.

-  I would encode starting with 0-based and half-open

### 13. Can we store this in SAM file? Why / why not?

-  No , we would need an alignment in order to store it in a SAM file.


### 14. Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?

-  Yes it is possible to store it BED, however we would loose the score and information on the direction of the strand ( here plus strand)

```
chr2 1000 2000
chr2 2000 3000
chr2 3000 4000
```

### 15. And in BED6? How? Are we losing any information?

-  Yes it is possible as we also have information on the name (interval A-C), the direction of the strand and the score.
```
chr2 1000 2000  A 0 +
chr2 2000 3000  B 0 +
chr2 3000 4000  C 1000 +
```

### 16. And in BED12? How? Are we losing any information?

-  Yes it is also possible. For the remaining BED fields (thickStart, thickEnd, itemRGB, blockCount, blockSizes and blockStarts) we will have a dot instead. However if we dont have a thick part,thickStart and thickEnd will be set to the ChromStart position. 
```
chr2 1000 2000  A 0 + . . . . . .
chr2 2000 3000  B 0 + . . . . . .
chr2 3000 4000  C 1000 + . . . . . .
```

### 17. And in the most compact Wiggle as possible? How? Are we losing any information?

-  Yes it is possible but we will loose information on the name, direction of the strand.
fixedStep chrom=chr2 start=1000 step=1000 span=1000
