## task 1:

### Why is STR variation relevant to health and disease?

Recent studies have shown that STRs play a widespread role in regulating gene expression and other molecular phenotypes. These analyses suggest that STRs are 
an underappreciated but rich reservoir of variation that likely make significant contributions to Mendelian diseases, complex traits, and cancer.
Their repetitive nature induces slippage events during DNA replication that result in frequent mutations in the number of repeats. 
As a result, STRs exhibit mutation rates that are orders of magnitude higher than other types of variation, and thus contribute 
a large fraction of human genetic variation.
For instance, STRs are predicted to contribute a higher number of de novo mutations per generation than any other type of variation.


### What are some of the challenges in analysing STRs from NGS data? 

First, short reads often do not span entire repeats, effectively reducing the number of informative reads. 
Second, STR variations present as large insertions or deletions that may be difficult to align to a reference genome, 
and thus introduce significant mapping bias toward shorter alleles. 
Finally, PCR amplification during library preparation often introduces “stutter” noise in the number of repeats at STRs.


## task 2:

### Why should you use multiple tandem repeat detection algorithms to look for repeats in biological sequence?

the different algorightms create redundant or overlapping annotations, several statistical frameworks for filtering false positive annotations, 
and importantly a tandem repeat annotation and refinement module based on circular profile hidden Markov models (cpHMMs).



### What different functionalities does TRAL provide?

An open source Python 3 TR annotation library. TRAL is highly modularized, such that a researcher can use the implemented methods or customize 
them by adding other TRDs, overlap criteria, statistical tests or model-based annotation methods.

Annotate sequences with TRs of a known motif.

For de novo annotations, we implemented a scaffold for executing and parsing external TRD software.

Included a flexible system to establish overlap and clustering of TRs in TRAL. Two definitions of overlap for a pair of TRs are currently implemented: 
  1. having at least some characters in common and 
  2. having a common ancestry of at least one pair of characters in alignments of multiple TR units for both TRs

Test and filter for statistical significance.

TRAL provides access to characteristics such as TR unit alignments, TR unit length, number, divergence and indel distribution.



