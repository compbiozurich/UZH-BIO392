### Which are the advantages of BED/coordinate files as compared to storing just sequences?
In sequence data files it is not given from where to where a certain gene is present, it is just the sequence given.
BED files contains the coordinates of certain genomic regions (a.g. exones) for a reference genome.
BED files permits to reduce drastically computational effort and reduce strong the storing space necessary.
In additional colmns can be given more information about the segment documented, which is not given by the raw sequence.
A BAD file has at least 3 columns: chromosome, start position, end position.

	chr1	2990	3600
	chr1	1008	2055


### Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?
For each sequenced nucleotide is attributed a quality value. This value gives the probability that the given nucleotide is correct.
The qualiti value is influenced by the evidence of the sequencing results. A.g. if a Luminance technique is used, it is measured how 
sure a fluorescent signal for a certain nucleotide at a position was. (how high is the pick, how overposed with next pick or how wide the pick is)
It is also considered how many aligment are found and how high repeating regions are (longer sequence of repeating nucleotide composition reduce 
afidability of the alignment and reduce so the quality).


### We’d like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify).

I will use half-open intervals [start, end[ and counting by A, B, C.

### We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we’d like to include the start nucleotide too) in position 1000 of chr2. We don’t have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.

#### Can we store this in SAM file? Why / why not?
SAM file is a sequence file. In our example we have no sequence available, so we can't write a SAM file.

#### Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?
It is possible to use a BED3 file, because we have the chromosome name 'chr2', we know that all intervalls are 1000nt long, 
the first intervall starts at position 1000 and that they are continguos. 
We are losing the interval name, the score information and the strand direction, because this columns is not included in a BED3 file.

	chr2	1000	2000
	chr2	2000	3000
	chr2	3000	4000

#### And in BED6? How? Are we losing any information?
We can also write the informations we have in a BED6 file. In this case we loos no information, because the columns for interval name, 
score and strand direction are included in the table.

	chr2	1000	2000	A	0	+
	chr2	2000	3000	B	0	+
	chr2	3000	4000	C	1000	+

#### And in BED12? How? Are we losing any information?
We can also write our information in a BED12 file without loosing information. But we will have the last 6 rows completely empty and 
so producing a havier file without gaining more information. 

	chr2	1000	2000	A	0	+	na	na	na	na	na	na
	chr2	2000	3000	B	0	+	na	na	na	na	na	na
	chr2	3000	4000	C	1000	+	na	na	na	na	na	na

#### And in the most compact Wiggle as possible? How? Are we losing any information?
This is the most extensive wiggle file as possible. In this one we lost the name of the segments, but we still know that there are three in subsequent positions. What we surelly lost, is the string direction.

	fixedStep	chrom=chr2	start=1000	step=1000	span=1000
	0
	0
	1000
  
The most compact wiggle contains no start, step or span informations. So we lose a hughe amount of informations. We just will know that there are three consecutive positions on chromosome 2 with the given scores.

	fixedStep	chrom=chr2
	0
	0
	1000


