Fun with kinases


Questions:
– What is the function of Src tyrosine kinases?
Their primary function is control of cell growth by activating cascades via phosphorylation.


– Is there only one Src tyrosine kinase? What are some others?
No there's a whole bunch of them, such as the c-Abl tyrosine kinase or the HCK protein. Loss of function for
one of them often has little or no effect, because it can be balanced by the other proteins.


– What is special about v-Src? How does it differ from c-Src?
v-Src is a form of src tyrosine kinases that is expressed by Rous sarcoma virus, a virus that causes tumors
in chickens. This form is always active (unlike c-Src), constantly activating phosphorylation cascades
and promoting uncontrolled cell growth one of the key features of tumor cells.


– What is the purpose of most drug design studies against Src?
Because cancer cells often have mutations in their kinases that lead to loss of effective regulation (gain of
function; kinase always active), drugs are designed to shut down these kinases, counteracting the mutation.
One example is Gleevec, a drug that blocks the Abl protein.


– What is the name of the article?
Structural basis for the autoinhibition of c-Abl tyrosine kinase, by:
Nagar B, Hantschel O, Young MA, Scheffzek K, Veach D, Bornmann W, Clarkson B, Superti-Furga G, Kuriyan J.



Search for reviewed, human Src kinases with Src as the protein family filter.
- How many proteins are there?
13

– How many human Src kinases?
10

– How many Uniref100, Uniref90? What are these?
13 each. They contain the co-activators that are not actually the kinases, so we 'removed' these for alignment. By this we do
not mean that we actually removed them, we just added another filter, "kinase" which did not remove them but filtered them out.
The outcome is exactly the same, but this way we didn't remove any valuable data. Now we have 10 human kinases and aligned them.



• Can you identify any residues/regions that are highly conserved?
We can obtain a highly conserved region between the binding site and the active
site. Also in the previous and following regions (about 60b downstream of active site) of those two sites we can obtain an
accumulation of conserved regions.

• How conserved is the active site residue (how can you find it)? What is it?
An aspartic acid residue, it is highly conserved (100%). We can find it via options.

• Are there any variants around the active site residue?
There are 5 natural variants in 5 different proteins, P06241, P07948, P08631, P06239 Q9H3Y6. When examining e.g. P06241
in the feature viewer we see that there is a variant G>R (Glycine to Arginine) at position 410 (20b downstream of the active site)


• The protein structure can also be visualized with Uniprot. Pick a Src kinase. For a Uniprot entry, there may be several PDB structures
associated with it. Look under the column Positions. Pick the PDB ID with the maximum coverage (coverage refers to fraction of residues for
which there is structural data with respect to the whole sequence length). What is the PDB ID for this structure? Visualize the structure
within UniProt to obtain a view similar to that in the Abl kinase paper. Are there any red dots? What are they?

We picked the protein P06241 as reference. It's PDB-ID is 1G83, coverage goes from positions 82-246. Using the feature viewer of PDB and of UniProt
we were able to align the SH3- and SH2 domain. The main difference of our protein (a tyrosine kinase Fyn) to the Abl kinase is an additional part that
is "sticking" out of the SH2 domain. It seems to be present in the c-Src protein as well.
The red dots stand for H2O molecules and can be disabled if desired.
