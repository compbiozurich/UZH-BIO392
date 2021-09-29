# New commands learnt

create all 3 subfolders and course dir  
`mkdir -p course/soft course/data course/output`  
  
`ls -lah hg19.genome`  
  
adding exec permissions to the binary  
`chmod a+x bedToBigBed`  
  
downlaod and save  
`curl http://imlspenticton.uzh.ch/imallona/teaching/example.bed > example.bed`  
  
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
  
``  
  
``  
  
``  
