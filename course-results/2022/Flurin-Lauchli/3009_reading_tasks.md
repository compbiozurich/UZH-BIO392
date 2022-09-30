**paper "a genomic view of short tandem repeats**
- Why is STR variation relevant to health and disease?
	- more de novo mutations than any other variant class
	- variety of pathogenic effects (Figure 1), includ- ing polyglutamine aggregation [6], hypermethylation [7], RNA toxicity [8], and repeat associated non-ATG (RAN) translation [9]. Smaller pathogenic repeats have also been shown to affect RNA splicing (cystic fibrosis [10]) or regulate gene expression (progressive myoclonus epi- lepsy [11] and Gilbert syndrome [12])
	- **clear implication for disease, but hard to study; not done on a large scale until 2017(paper)**

- What are some of the challenges in analysing STRs from NGS data?
	- PCR strand slippage (library prep) -> stutter artefact
	- long repeats vs. NGS read lengths: read length must be > than repeat length, otherwhise number of informative reads is greatly rediced
	- bioinformatic alignment algorhythms: difficulty in finding the right spot, as repeats allow multiple alignments. different solutions present (aim: align with high fidelity and low computational load)


**paper: TRAL: tandem repeat annotation library**

- Why should you use multiple tandem repeat detection algorithms to look for repeats in biological sequence?
	- they do not yield the same results -> increase accuracy by combining

- What different functionalities does TRAL provide?
	- it does the whole evaluating-STRs-with-different-algorhithms for you
	

**paper: Profiling the Genome-Wide Landscape of Tandem Repeat Expansions**

- What sets GangSTR apart from other STR genotyping tools?
	- it can work with a variety of STR classes, while other methods only detect one

- What types of information does GangSTR use for STR genotyping?
	- 4 classes of paored-end reads:
		- enclosing read pairs (‘E’) con- sist of at least one read that contains the entire TR plus non-repetitive flanking region
		- spanning read pairs (‘S’) originate from a fragment that completely spans the TR, such that each read in the pair maps on either end of the repeat
		- flanking read pairs (‘F’) contain a read that partially extends into the repetitive sequence of a read
		- fully repetitive read pairs (‘FRR’) contain at least one read consisting entirely of the TR motif.
