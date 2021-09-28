# Resource notes

## File formats in genomics

**BAM: binary format for storing sequence data, compressed version of a SAM file**
 files contain a header section and an alignment section: (header contains information about entire file, alignments contains read name, read sequence, read quality, alignment information and custom tags)
associated costs for the 1000 Genome project would be about 125'200 CHF
needed storing place would take 260'000 GB
because of the compressed binary code, these file type is appropriate for storing called variants

**SAM: sequence alignment Map**
text-based format originally for storing biological sequence aligned to reference sequence
contains the same information as BAM (header and alignment) but is more human readable and easier to process by conventional text base processing programs (python…)
needed storing place would take about 300'000 GB
and therefore the costs would be even higher for these file type

**BED: Browser Extensible Data format provides a flexible way to define the data lines that are displayed in an annotation track
format:**
•	chrom -> chromosome name with or without 'chr' prefix
•	chromStart -> start position
•	chromEnd -> endEnd
•	9 additional lines possible
associated costs for the 1000 Genome project would be about 500'800 CHF because in these file every letter needs 8bit instead of 2bit in the BAM format
needed storing place would take 1'040'000 GB
These format can be perfectly used for browser visualisation and it will fit with tools like BLAST


**VCF: Variant Call Format**
advent of large-scale genotyping and DNA sequencing projects -> only the variations need to be stored along with a reference genome
contains metainformation lines, header line, data line containing information about a position in the genome
One full sequenced reference genome is used and the variations of 88 million variants, so I estimate the storing costs on around 200 CHF.
These file format can be used for full archival purposes because you can put all the relevant data in it and need less space because the same sequences are saved only once.
(They used also this file format for the 1000 Genome Project)

Which file format would I use for storing variations?
--> To store variations I would use the VCF-file format, because it shows in an ‘easy and clear’ way the 
variations to a specific reference genome. It needs the smallest storage and is also one of the cheapest option 

Which file format would I use for full archival purposes?
--> I think the best option for this is the BAM-file format. Because it uses binary code to store the full sequence alignment 
(compressed way).BAM also allows searching after indexing. 
Another option would be CRAM, which is even more compressed than the BAM file-format. 

Which file format would I use for presenting a sequence? 
--> I would use the FASTA-sequence because it’s very simple to ready and also very flexible.
