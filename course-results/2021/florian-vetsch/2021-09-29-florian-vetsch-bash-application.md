# New commands learned

### General
create all 3 subfolders and course dir  
`mkdir -p course/soft course/data course/output`  
  
`ls -lah hg19.genome`  
  
adding exec permissions to the binary  
`chmod a+x bedToBigBed`  
  
downlaod and save  
`curl http://imlspenticton.uzh.ch/imallona/teaching/example.bed > example.bed`  

aliasing  
`alias vcftools='~/course/soft/vcftools_0.1.13/bin/vcftools'`  

### FASTQ
counting sequences  
`wc -l SP1.fq | awk '{print $1 / 4}'`  
  
getting the reads out of a fastq file  
`awk 'NR%4==2'   ~/course/data/SP1.fq`  
  
enumerate all line of file  
`awk '{print NR, $0 }' SP1.fq`  
 
get full lines of identifier and sequence   
`awk 'NR%4==2 || NR%4==2' SP1.fq > SP1.fa`  
 
fastq to fasta (only getting first column of identifier)  
`awk 'NR%4==1 {print ">"$1};  
      NR%4==2 {print}' SP1.fq  
      > SP1.fa`  
  
### BED
bed6 to bed3 (only first way seperates by tab)  
`awk -v OFS='\t' '{print $1,$2,$3}' a.bed`  or `awk '{print $1,$2,$3}' a.bed`
  
bed3 to bed 6  
`awk -v OFS='\t' '{print $1,$2,$3,".",0,"."}' a.bed`  
  
Add a nucleotide to the start and subtract a nucleotide from the end to all records  
`awk -v OFS='\t' '{print $1,$2+1,$3-1,$4,$5,$6}' a.bed`  
  
checking overlap between two files reported on the file defined as -a (not considering strandness and only report the parts of each line that do have overlap with b)  
`bedtools intersect \
  -b  x.bed \
  -a  z.bed`    
  
considering strandness  
`bedtools intersect \
  -s \
  -a  a.bed \
  -b  b.bed`   
  
 use -v to repport all lines that don't overlap, only reports the lines that have completly no overlap (-wa -wb to get extra info)  
`bedtools intersect \
  -v \
  -b  ~/course/soft/bedtools2/test/intersect/a.bed \
  -a  ~/course/soft/bedtools2/test/intersect/b.bed`  
  
 get clearest idea of overlap (lines in a with no overlap will show . and -1) 
`bedtools intersect -wao -a  ~/course/soft/bedtools2/test/intersect/a.bed -b  ~/course/soft/bedtools2/test/intersect/b.bed`  
  
### VCF  
install  
`cd ~/course/soft/
curl -L https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz/download > \
   vcftools.tar.gz
tar xzvf vcftools.tar.gz
cd vcftools_0.1.13/
make`  
  
check how many of the transposable elements in humans are covered by exon positions 
transforme exons.bed to match chromo nomenclature of vcf file  
`sed 's/^chr//g' exons.bed > exons_nochr.bed`  
`bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf \
  -b exons_nochr.bed > overlap.txt`  
`wc -l overlap.txt`  

are they in active or inactive regions  
`curl -O https://s3.amazonaws.com/bedtools-tutorials/web/hesc.chromHmm.bed`  
`sed "s/^chr//g" hesc.chromHmm.bed > chromHmm.bed`  
`bedtools intersect -a chromHmm.bed -b CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf > chrom_state_intersect.txt`  
`awk '{print $4}' chrom_state_intersect.txt | sort | uniq -c | sort -nr`  

compared to genetic background  
`awk '{print $4}' hesc.chromHmm.bed | sort | uniq -c | sort -rn`









