# Results of the exercises of day 3

## Exercise 1
* Number of lines = 100

## Exercise 2
* Head: to print the first 10 lines of a FILE to standard output

## Exercise 3
* chr1    13219   13390
* chr1    14695   14837
* chr1    15784   15947
* chr1    16848   17058
* chr1    17231   17374

## Exercise 4
* Number of lines = 5

## Exercise 5
* Didn't work, so I did it manually.

## Exercise 6
* File size = 3.6K
* Number of lines = 40
* Head

## Exercise 7
* Total number of lines = 40
* Number of sequences = 10 (wc -l SP1.fq | awk '{print $1 / 4}')

## Exercise 8
* Using "@" won't work since it might be part of the phred quality score, so those lines would be counted as well.

## Exercise 9
* Retrieve 10 sequences using the % modulo operator (awk 'NR%4==2' SP1.fq)

## Exercise 10
* Print line numbers (awk '{print NR}' SP1.fq)
* Print whole lines with numbers (awk '{print NR, $0 }' SP1.fq)

## Exercise 11
* Get header line (awk 'NR % 4 == 1' SP1.fq | head)
* Get sequence line (awk 'NR % 4 == 2' SP1.fq | head)
* Get comment line (awk 'NR % 4 == 3' SP1.fq | head)
* Get quality line (awk 'NR % 4 == 0' SP1.fq | head)

## Exercise 12
* Convert FASTQ to FASTA (awk 'NR % 4 == 1 {print ">"$1}; NR % 4 == 2 {print}' SP1.fq)

## Exercise 13
* Save FASTA file (awk 'NR % 4 == 1 {print ">"$1}; NR % 4 == 2 {print}' SP1.fq > example.fa)

## Exercise 14
* Confirm that both files have the same amount of sequences

## Exercise 15
* Download and unzip compressed SAM data form (gunzip ex1.sam.gz)

## Exercise 16
* Transform BED6 to BED3 (extract first three columns, awk -v OFS='\t' '{print $1,$2,$3}' a.bed)

## Exercise 17
* Transform BED3 to BED6 (add three columns, awk -v OFS='\t' '{print $1,$2,$3,".",0,"."}' recordsOutOfOrder.bed)

## Exercise 18
* Add a nucleotide to the start and subtract a nucleotide from the end of all records (awk -v OFS='\t' '{print $1,$2-1,$3+1,$4,$5,$6}' a.bed)

## Exercise 19
* Both are BED6 files

## Exercise 20
* Output is a direct intersect in style of BED6 with the overlapping intervals (bedtools intersect \
  -a ~/course/soft/bedtools2/test/intersect/a.bed \
  -b ~/course/soft/bedtools2/test/intersect/b.bed)
  
## Exercise 21
* When changing a and b, it seems like the "reference strand" where the intervals are indicated changes.

## Exercise 22
* Only report overlapping intervals on the same strand (bedtools intersect \
  -s \
  -a ~/course/soft/bedtools2/test/intersect/a.bed \
  -b ~/course/soft/bedtools2/test/intersect/b.bed)

## Exercise 23
* Only report intervals in a.bed that do not overlap with b.bed (bedtools intersect \
  v \
  -a  ~/course/soft/bedtools2/test/intersect/a.bed \
  -b  ~/course/soft/bedtools2/test/intersect/b.bed)
* Invert -a and -b flags with -wa and -wb flags (bedtools intersect \
  -v \
  -wa -wb \
  -b  ~/course/soft/bedtools2/test/intersect/a.bed \
  -a  ~/course/soft/bedtools2/test/intersect/b.bed)
  
## Exercise 24
* Report amounts of overlap for all features when comparing a.bed and b.bed, including those that do not overlap (bedtools intersect \
  -wao \
  -a  ~/course/soft/bedtools2/test/intersect/a.bed \
  -b  ~/course/soft/bedtools2/test/intersect/b.bed)
* Now both strands are reported next to each other, and non overlaps are on neither strand(?)

## Exercise 25
