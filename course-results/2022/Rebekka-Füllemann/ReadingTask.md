# Task 1: STR background reading

### Why is STR variation relevant to health and disease?
STRs contribute to a large fraction of the human gene variation. But also dozens of diseases are linked to STRs.

### What are some of the challenges in analysing STRs from NGS data?
- short reads often do not span entire repeats
- STR variations present as large insertions or deletions that may be difficult to align to a reference genome
- PCR amplification during library preparation often introduces “stutter” noise in the number of
repeats at STRs
- STRs are often filtered from sequencing pipelines due to their low quality calls

# Task 2:Introduction to TRAL

### Why should you use multiple tandem repeat detection algorithms to look for repeats in biological sequence?
currently available TRDs do not provide exhaustive detections, and combining TRs from several TRDs is essential for
reliable TR annotation

### What different functionalities does TRAL provide?
- Annotate with sequence profile models
- Annotate with de novo tandem repeat detectors
- Identify and filter overlapping annotations
- Test and filter for statistical significance
- Retrieve tandem repeat characteristics
