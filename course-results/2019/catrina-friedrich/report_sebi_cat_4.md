## NCBI resource activity

Search term used on NCBI Variation Viewer was: FXN

- Which	chromosome	is	it	located	on?	Note	its	location.\
Chr9: 69,035,752-69,079,076

- What	information	is	contained	in	dbVar?\
dbVar renders 373 variants in total, most of them (259) contain
__copy number variations__ and some have __insertions__ (46) and
__short tandem repeats__ (38).
Interestingly, all variants marked as pathogenic (53) are copy
number variations.

- What	information	is	in	dbSNP?\
Only ten out of the 9832 single nucleotide variants are reported as
pathogenic, for the majority the clinical significance is not provided.

- What	information	is	in	ClinVar?\
29 of these 9832 SNPs are in ClinVar, including all pathogenic variants.
Eight of them are single nucleotide variants and the remaining two are indels.
Applying the following filtering options... \
_In	ClinVar	– yes\
Most	severe	clinical	significance	– pathogenic\
Molecular	consequence	– missense	variant_\
...gives 6 variants:


  |Variant ID  |Mutation   |Mutation type  |PDB ID |Location |Polyphen 2 score |Prediction |
  |------------|:------------:| :-------------:| :-----:|:--------:|:---------------:| ---------:|
  |rs104894108|Met1Ile|sulfur loss|/|Transit peptide|/|/
  |rs145854903|Arg40Cys|polar to nonpolar|/|Transit peptide|0.656|possibly damaging|
  |rs104894105|Leu106Ser Leu106Ter|nonpolar to polar or stop|/|Helix|1|probably damaging|
  |rs104894107|Gly130Ala Gly130Val|larger|/|between beta strands|0.4845 | benign, probably damaging|
  |rs146818694|Asn146Lys|polar to positive|3T3J|Beta strand|0.997|probably damaging|
  |rs104894106|Ile154Val Ile154Phe|smaller or larger|/|Beta strand|0.60933|benign, possibly/probably damaging|

  - What is the PDB ID of the wild type protein?
  3S4M

  - Using	iCn3D,	make	a	structure	figure	for	your	protein	of	interest.	If	possible show	the	mutation	site	with	iCn3D
  We use the structure of the variant rs146818694 (with PDB ID 3T3J).\
  [Link to iCn3D image]()

  - You	can	also	visualize	the	effect	of	the	mutation	using	the	structure	viewer	in	PolyPhen	2.\
  [Link to Polyphen 2 image]()
