# AWK Cheat Sheet

## BED
*BED6 file*  
>`chr1    10      20      a1      1       +`  
>`chr1    100     200     a2      2       -`

*BED3 file*  
>`chr1    10      20`  
>`chr1    100     200`


### Transformation of BED6 to BED3 and BED3 to BED6  
BED6 to BED3 (the file **a.bed** is a BED6 file)  
`awk -v OFS='\t' '{print $1,$2,$3}' a.bed`  
BED3 to BED6 (the file **recordsOutOfOrder.bed** is a BED3 file)  
`awk -v OFS='\t' '{print $1,$2,$3,".","0","."}' \  
 recordsOutOfOrder.bed`  

### Substract or add numbers to the nucleotides in column 2 and 3 of a BED6 file
`awk -v OFS='\t' '{print $1,$2-1,$3+1,$4,$5,$6}' a.bed`  
this will make this:
>`chr1    10      20      a1      1       +`  
>`chr1    100     200     a2      2       -`  
into this:  
>`chr1    9      21      a1      1       +`  
>`chr1    99     201     a2      2       -`

### Bed Intersect
By far, the most common question asked of two sets of genomic features is whether or not any of the features in the two sets “overlap” with one another. This is known as feature intersection. bedtools intersect allows one to screen for overlaps between two sets of genomic features. Moreover, it allows one to have fine control as to how the intersections are reported. bedtools intersect works with both BED/GFF/VCF and BAM files as input.

`bedtools intersect \`  
  `-a  ~/course/soft/bedtools2/test/intersect/a.bed \`  
  `-b  ~/course/soft/bedtools2/test/intersect/b.bed`  
  
This command will give the overlapping features of the two sources a and b.

## FASTQ
> 
### Get the number of fastq entries in a file; a fastq entry has 4 lines
`wc -l SP1.fq | awk '{print $1 / 4}' # counts number of lines and devides by 4` 

### Look up different lines of a FASTQ file
the file **SP1.fq** is a FASTQ file
`awk 'NR % 4 == 1' SP1.fq | head  # get header line `  
`awk 'NR % 4 == 2' SP1.fq | head  # get sequence line `  
`awk 'NR % 4 == 3' SP1.fq | head  # get comment line `  
`awk 'NR % 4 == 0' SP1.fq | head  # get quality line `  
