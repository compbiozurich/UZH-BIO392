# Some file formats

### FASTA/FASTQ
Stores genetic or protein sequences in full. FASTA adds only a sequence ID to this, while FASTQ also adds an (often unused) line for additional info and
quality scores for the sequence. This means they are not very efficient for storing variant information, since it contains the whole sequence instead of only
the variants compared to a reference sequence. The advantage is that it is very easy to use, since no reference is needed. The information is
"self-contained" and does not rely on antything that is not part of the file itself.

### SAM/BAM
SAM files are similar to FASTA/FASTQ in the sense that they also store sequences. The data is arranged with tab delimiters as opposed to a group of lines though,
and there is some additional information stored. The main extra info is a record of where the sequence fits into a reference genome. The main use case for this is to 
store sequences before aligning them. When doing shotgun sequencing, the long strand of source DNA (or RNA or protein) is sequenced in smaller parts. These parts overlap, and can then be reassembled to form the entire original sequence. And storing those shorter "shotgunned" reads is what SAM is great for. This also means that a SAM file contains each, or at least most sections of the original sequence more than once (remember: overlaps), which makes the file larger for obvious reasons.
BAM is basically the same as SAM, except in binary. This means it is not really human readable anymore. It is also very efficiently compressable.

### VCF
VCF, or variant call format, doesn't store the whole sequence. It consists of a header followed by information on variant sequences in comparison to a specified reference genome.  
This means it is very efficient for sequences that are very similar to the reference, and when it comes to variant sets, which contain lots of call sets,eg from different patients,
it is useful if the variants that appear are mostly common ones. Since this is often not the case though (most variants that were recorded in the 1000 genome project
appeared in less than 1% of the sequenced genomes), VCF gets less efficient. Its still better than storing all of the data in something like FASTA, especially since it is also easier to compress.

### BED
Finally, BED doesn't actually store any sequences. It is used to store annotations with coordinates on a reference genome. It is useful for storing the type of data that
genome browsers display in parallel to the genome.

# Comparison in file sizes
My estimation on the order of file size if you were to store a large amount of sequences with different formats (large to small):  
SAM > BAM > FASTQ > FASTA > VCF
