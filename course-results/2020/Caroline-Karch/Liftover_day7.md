# Liftover
When a new reference genome is available BED files does not correspond to this sequence (since they are aligned to e.g. hg18). The newer reference (e.g. hg19) has maybe some other nucleotides in it and a different length. A liftover (conversion) has to be done, so that the BED file's coordinates are capable with the new reference genome. There are tools like UCSC Liftover, NCBI Remap and CrossMap available to perform such conversions. 

These tools even can break segments into smaller parts if the segment is not continuous in the new assembly. 

## segment_liftover
This is a Python program that can convert segments between genome assemblies, without breaking them apart (whole segments). This program depends on the previous mentioned UCSC Liftover program.  

[Literature](https://github.com/baudisgroup/segment-liftover)
