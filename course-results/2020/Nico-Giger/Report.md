 :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal:

## Day 3

1. Why do we use the terminal in bioinformatics?\
Scipts --> reproducability

2. What is a plain text file?\
data containing only characters of readable material (no graphical representation/other objects)

3. In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?\
no need for other; easy to use/transform/access

4. How can we list files are in a directory? Please provide the command(s).\
`ls`

5. What | and > do in a terminal?\
`|` piping e.g. 'left|right' --> do left and then right (chronologially)
`>` e.g. 'left>right' put output of 'left' in 'right

6. How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).\
`tail /mnt/test/test.txt`

7. How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).\
`awk '{print $1}' /mnt/test/test.txt`

8. How can we print every third line of a text file? Please provide the command(s), and discuss what they do.\
`awk 'NR%3==0' file_name.txt` print line if the mod of line number (NR)/3 == 0

9. How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.\
``awk 'NR % 4 == 1 {print ">"$1}; NR % 4 == 2 {print}' SP1.fq`` add '>' to the first line (sequence identifier) of each group of 4 and print the first two lines of all groups

10. Which are the advantages of BED/coordinate files as compared to storing just sequences?\
storage efficiency

11. Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?
read depth, base sequence quality scores, GC content information, sequence duplication levels, overrepresented sequences

12. We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we'd like to include the start nucleotide too) in position 1000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.

* Counting 0 closed
* Can we store this in SAM file? Why / why not?\
No, sequence needed, score, interval category

* Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?\
Yes, information loss: strand\
  * Chr2    0999   1998\
Chr2    1999   2998\
Chr2    2999   3998


* And in BED6? How? Are we losing any information?\
Yes, no information loss\

  * Chr2    999   1998   A   0   +\
Chr2    1999   2998   B   0   +\
Chr2    2999   3998   C   0   +


* And in BED12? How? Are we losing any information?\
Yes, but no information gain ('empty' columns)


* And in the most compact Wiggle as possible? How? Are we losing any information?\
Yes, information loss: interval category, strand\
fixed step format:

  * fixedStep chrom=chr2 start=999 step=1000 span=1000)\
0\
0\
1000



 :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal:
