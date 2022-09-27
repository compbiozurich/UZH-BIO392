
# file types overview
FASTA (stores a variable number of sequence records, and for each record it stores the sequence itself, and a sequence ID) \
FASTQ (header, sequence, comment, quality) \
SAM/BAM/ CRAM (Alignments, mapping. SAM is human readable and BAM is binary, CRAM is compressed) \
BED (Genomic ranges) \
GFF/GTF (Gene annotation) \
BEDgraphs (Genomic ranges, display continuous-valued data in track format, useful for probability scores) \
Wiggles and BigWigs (Genomic scores, avoids extra columns by using chrom, span (how long the scores are), step (pattern of starting point) etc.) \
Indexed BEDgraphs/Wiggles \
VCFs (variants, good for comparing to reference) 

# FASTQ
## phred
how certain something is, different encoding depending on when it was sequenced
important when using grep because the "at" is also a phred!!
awk 'NR % 4 == 1' SP1.fq | head  # get header line
awk 'NR % 4 == 2' SP1.fq | head  # get sequence line
awk 'NR % 4 == 3' SP1.fq | head  # get comment line
awk 'NR % 4 == 0' SP1.fq | head  # get quality line

## make fastq to fasta

awk 'NR % 4 == 1 {print ">"$1}; 
     NR % 4 == 2 {print}' SP1.fq \
     | head  
     
     
# BED files format
>https://genome.ucsc.edu/FAQ/FAQformat.html#format1

## BED3 and BED6
BED3 and name, score, strand \
chr22 1000 5000 cloneA 960 + \
chr22 2000 6000 cloneB 900 - \


awk -v OFS='\t' '{print $1,$2,$3,".",0,"."}' \
  recordsOutOfOrder.bed

cd - ## to go back to the previous directory

## bedtools 
>https://github.com/compbiozurich/UZH-BIO392/blob/imallona/course-material/2022/imallona/exercises.md 
>http://quinlanlab.org/tutorials/bedtools/bedtools.html

By far, the most common question asked of two sets of genomic features is whether or not any of the features in the two sets “overlap” with one another. This is known as feature intersection. bedtools intersect allows one to screen for overlaps between two sets of genomic features. Moreover, it allows one to have fine control as to how the intersections are reported. bedtools intersect works with both BED/GFF/VCF and BAM files as input.
paper on bedtools:

>https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2832824/

### intersect
bedtools intersect \
  -a  ~/course/soft/bedtools2/test/intersect/a.bed \
  -b  ~/course/soft/bedtools2/test/intersect/b.bed \
  
The -wa (write A) and -wb (write B) options allow one to see the original records from the A and B files that overlapped. As such, instead of not only showing you where the intersections occurred, it shows you what intersected. \
The -wo (write overlap) option allows one to also report the number of base pairs of overlap between the features that overlap between each of the files. \

### intersect only on same strand
bedtools intersect \
  -s \
  -a  ~/course/soft/bedtools2/test/intersect/a.bed \
  -b  ~/course/soft/bedtools2/test/intersect/b.bed
### no overlap at all
-v
### not sure what this does
bedtools intersect \
  -wao \
  -a  ~/course/soft/bedtools2/test/intersect/a.bed \
  -b  ~/course/soft/bedtools2/test/intersect/b.bed
  
 # VCF
  vcftools: mainly to summarize data, run calculations on data, filter out data, and convert data into other useful file formats \
  --vcf defines which vcf to process \ 
  --chr filters for chromosomes


# useful
cat - printing files onto the screen \
mv - moving and renaming files \
rm - removing files and directories \
chmod - changing access permissions \
grep - searching for strings in files \
wc - counting words \
sed - stream editing files \
awk - a full language to process texts 
grep -look for expression/ character

Ctrl+A or Home: Go to the beginning of the line. \
Ctrl+E or End: Go to the end of the line.

## editing the standard ouput using pipes
echo "hello there"
echo "hello there" | sed "s/hello/hi/"
echo "hello there" | sed "s/hello/hi/" | sed "s/there/world/"

## redirecting the standard output to a file
echo hello > newfile.txt
ls -l newfile.txt
cat newfile.txt

## piping commands and redirecting to a file
echo hello | sed 's/hello/hElLo/' > newfile2.txt \
ls -l newfile2.txt \
cat newfile2.txt \
find ~/course/soft/vcftools_0.1.13 -name "*vcf*" -type f #find all files in the program that containt vcf in name and are of type f

## also good to know
often there are different coordinates for e.g. chromosomes--> if want to intersect, have to convert them into same format (sed 's/^chr//g' exons.bed > exons_nochr.bed) \
bedtools is much faster with presorted data
bc - basic calculator
sed 's/hello/hi/' - only replaces first hello
sed 's/hello/hi/g' - replaces all hellos                                                                                                                             

