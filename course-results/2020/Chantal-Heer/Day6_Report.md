# Report  
* Which are the advantageous of BED/coordinate files as compared to storing just sequences?  
> BED files are simpler data representations. They are smaller and easier to handle. All the information (when not even more) of a FASTA file is stored in only one line per sequence.
* Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?     
> 
  
We'd like to store the following information. You can decide to encode them counting by 0,1 and closed/open at your convenience (but please specify).  
>     
We have 3 genomic intervalls. All intervalls are 1'000 nt long. They are continguous (head to tail). All in the plus strand. The first one starts (we'd like to include the start nucleotide too) in position 1'000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B have score of 0 and interval C has a score of 1'000.  
* Can we store this in SAM file? Why / why not?  
> We can't store this information because the sequences are avaiable as scores. The SAM file format stores the sequences information as alignment to the reference genome. 
* Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?  
>   
* And in BED6? How? Are we losing any information?  
> 
* And in BED12? How? Are we losing any information?  
>
* And in the most compact Wiggle as possible? How? Are we losing any information?  
>
