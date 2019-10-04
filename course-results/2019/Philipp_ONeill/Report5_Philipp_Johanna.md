Report 5, 04.10.2019, Philipp & Johanna

dbVar:
This database contains data regarding gene variants such as duplications, insertions, deletions, ...

dbSNP:
This database contains data regarding SNP. It is therefore not well suited for those bigger changes that
are the focus of dbVar, but perfect for informations on single nucleotides.

ClinVar
This database kinda collects information on variation for clinically relevant use (pathogenic, drug-response, risk factor, ...).
It is therefore best suited to research implications in health & disease for a gene or variant of interest.



You can filter by selecting In ClinVar – yes - Most severe clinical significance – pathogenic Molecular consequence – missense variant. How many variants do you have? (Preferably more than 3)

When doing this we have 0 results; SOD has never been associated with a pathogenic missense variant.
The only missense variant associated with SOD2 is the SNP described in report 3 (the change of valine
to alanine on position 16 of the gene) that is relevant to drug response.

Apart from this there's 20 pathogenic variations. However from these 20 variations only 4 are reviewed. These 4 However
were not reviewed by an expert panel but by a single submitter. When taking a closer look at the 4 entries it becomes apparent that all are derived from a single paper (An evidence-based approach to establish the functional and clinical significance of copy number variants in intellectual and developmental disabilities).
Because of this we decided to work with the missense variation that is relevant for drug response.

Chromosome: 6
Variant ID: 14751
Mutation: 47T>C (nucleotide), Val16Ala (protein)
Mutation type: apolar, aliphatic
PDB ID: none, rs4880 = dbSNP ID
Location in protein: 16, relatively close to metal-binding site (50)
Polyphen 2 score: 0.00
Prediction about impact? No impact predicted.

Polyphen 2 failed to predict the impact of the substitution, which makes sense, Val and Ala have very similar properties, therefore it might be difficult to predict impact on function in a
more global cellular and physiological context.

Wildtype PDB ID: 5VF9


When trying to view the affected sequence it became apparent that the sequences from UniProt and from PDB were different, because the mutated Valine could not be found in position 16.
We therefore took the two sequences and BLASTed them. This showed that the identity was 100% however the query cover was only 89%; The first 25 amino acids of the UniProt sequence were
not present in the PDB sequence. Since our SNP of interest lies within that region it cannot be displayed by iCn3D.
