## Report – Genome file formats and manipulations in terminal 

### **1. Which are the advantages of BED/coordinate files as compared to storing just sequences?**

The BED or other coordinate files can save pre line only information about a segment of the entire sequence. However, these files do not contain the actual nucleotide sequence but rather numbers, signs and short names, that describe each fragment. With numbers it is more efficient to store a sequence because these take up less memory space than letters, so it is a good alternative for compressing and storing a large amount of data. For example, the BED3 file format, which contains the least information when compared to the other BED files, provides all the data that is needed to describe a nucleotide sequence. This file format indicates the chromosome, as well as the start and end position of the fragment. Other BED files can contain additional information about the fragment, but this is also written in the compressed format.

### **2. Which QC values are tracked during a bioinformatics variant calling NGS workflow? (from sequencing to variant calling)?**

The quality control (QC) is done by looking at the Phed quality score for each nucleotide. For example, a score value of 10 corresponds to a base accuracy of 90%, which means that there is a probability of 1 in 10 for the nucleotide to be wrong. On the other hand, a Phed quality score of 60 indicates a 99.9999% accuracy, with only 1 in 1’000’000 chance for the nucleotide to be false. However, it is very important to check which technology was used to obtain the data, because depending on the machine, the intervals for the Phed quality scores vary.


### **3. We’d like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify). We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we’d like to include the start nucleotide too) in position 1000 of chr2. We don’t have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.**

#### **3.1 Can we store this in SAM file? Why / why not?**

I do not think that the given data can be stored as a SAM file, because this format has 11 mandatory columns and a lot of information would be missing. The text also mentions that the information about the reads and the alignments is not available, which make up two columns. Other important data, such as the bitwise FLAG, mapping quality, CIGAR sting, reference name of the next fragment and Phred scaled base quality, is also missing.

#### **3.2 Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?**

For writing down the files I choose the 0 start, half open interval.

> chr2	1000	2000
>
> chr2	2000	3000
>
> chr2	3000	4000

The information can be stored using a BED3 file format, however some things are lost when compared with the information given in the text, like the name, score and strand. But still, all the additional information is optional, because for the BED file format only the name of the chromosome, the start and end position are required.

#### **3.3 And in BED6? How? Are we losing any information?**

> chr2	1000	2000	A	0	+
>
> chr2	2000	3000	B	0	+
>
> chr2	3000	4000	C	1000	+

The BED6 file format was also written using the 0 start, half open interval and it contains all the information given by the text

#### **3.4 And in BED12? How? Are we losing any information?**

> chr2	1000	2000	A	0	+	1000	2000
>
> chr2	2000	3000	B	0	+	2000	3000	
>
> chr2	3000	4000	C	1000	+	3000	4000

This is a BED12 file format with a 0 start and a half opened interval. However not all the information that can be saved in a BED12 file is available in the text. For example, the RGB values, the number of exons (blocks), the block size and block start are missing. The only information that could be included in this file was the thickStart and thickEnd. 

For a BED file the first three columns, which are the name of chromosome, the start and end position, are required. The next three columns are optional and indicate the name of the BED feature, score and strand. The rest of the columns are ignored by bedtools.

#### **3.5 And in the most compact Wiggle as possible? How? Are we losing any information?**

The most compact Wiggle file format to store the given data is the fixedStep format:

> fixedStep 	chrom=chr2	start=1000 	step=1000	span=1000
>
> 0
>
> 0
>
> 1000

All the information could be saved using this file, apart from mentioning that the nucleotides are in the plus strang.

