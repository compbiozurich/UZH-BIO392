### Why do we use the terminal in bioinformatics?
Terminal commands can be assembled into scripts, which means you have a history of executed commands. This is important to increase reproducibility. Also, you can work with every type of content. It's an efficient way to work with large data. 
### What is a plain text file?
Data, that represent only characters of readable material. No graphical representation. 

### In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq, but also SAM, BED, GTF, VCF and others. Why is that?
By storing data in plain text files, you can easily handle it e.g. via terminal. Compressed versions provide storage. 

### How can we list files are in a directory? Please provide the command(s).
ls: directory listing (ls means list storage)
ls -al: formatted listing with hidden files

### What | and > do in a terminal?
|: With the pipe you can connect two or more commands at a time. The output of one program used directly as input to the next one.

">": This symbol means "take the output of a command and redirect it into a file". Consequently, the whole file will overwritten. 

### How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).
```
tail /mnt/test/test.txt	
```
### How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).
```
awk '{print $1}' /mnt/test/test.txt
```

### How can we print every third line of a text file? Please provide the command(s), and discuss what they do.
```
awk '{print NR % 3 == 0}' /mnt/test/test.txt 
```
It processes each line and checks NR % 3 ==0 (if NR is multiples of 3). If it is, the line will be printed.

### How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.
```
awk 'NR % 4 == 1 {print ">"$1}; 
    'NR % 4 == 2 {print}' file.fq > file1.fa
```      
**awk 'NR % 4 == 1 {print ">"$1}:** each line will be checked if its rest equals 1 when divided by 4 (gets the header line in the fastq file). If it is, this line will be printed as the header line in the fasta file      
**'NR % 4 == 2 {print}' file.fq > file1.fa:** each line will be checked if its rest equals 2 when divided by 4 (gets the sequence line in the fastq file). If it is, this line will be the sequence line in the fasta file. 
      
### Which are the advantages of BED/coordinate files as compared to storing just sequences?
BED stores genomic regions as coordinates. One of the advantages of this format is the manipulation of coordinates instead of nucleotide sequences. It's easy to manipulate and read.

### Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?
Read quality, mapping quality, variant calling quality

## We'd like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify). We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we'd like to include the start nucleotide too) in position 1000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.
I choose 1 counting full-closed.

### Can we store this in SAM file? Why / why not?
SAM stores biological sequences aligned to a reference sequence. In this case, we have neither reads nor alignments. It wouldn't make sense to store it in SAM file.

### Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?
Yes. The information score, plus name and strand are lost.

```
chr2 1000 2000
chr2 2000 3000
chr2 3000 4000
```

### And in BED6? How? Are we losing any information?
No information loss.
```
chr2 1000 2000 intervalA 0 +
chr2 2000 3000 intervalB 0 +
chr2 3000 4000 intervalC 1000 -
```

### And in BED12? How? Are we losing any information?
We can store it in a BED12. There will be no information loss. But BED12 contains 6 more columns than BED6 and we don't have these information. So, it's unnecessary to store it in BED12.

### And in the most compact Wiggle as possible? How? Are we losing any information?
Yes. The information plus name and strand are lost.
```
fixedStep chrom=chr2 start=1000 step=1000
0
0
1000
```
