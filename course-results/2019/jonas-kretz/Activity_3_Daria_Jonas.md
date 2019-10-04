# Activity 3
Daria & Jonas 26.09.2019

_We choose the protein DJ-1 which is encoded by the PARK7 gene._
## Case study 1: Variants in a gene
On **EVA Variant browser**, we find 2588 variants of our gene (PARK7, Parkinson associated deglycase)
from 12 different studies. On Clinvar, we see that the gene shows an association with the recessive
Parkinson disease.

We can use the **Ensemble** webpage to explore genetic variation in the PARK7 locus. If we go to the
Ensemble webpage and search for our gene, we got a lot of different variants. On the top, we can
filter the results according to different factors. We filtered for pathogenic exonic variants that exist at
allele frequency >0.011. We got no variants which fit these filter. But if we remove the frequency
filter and allow showing us all variants, not regarding their frequency, we receive 59 variants which
are pathogenic. Most of them are SNP’s, but there are also some indels.

Now that we know that there are diseases associated with some variants, we can use EMBL-EBI to
understand the potential effects of variants on protein structure and function. We now want to find
out where these variants lie on the protein sequence. For this, we can go to **UniProt** and look at the
UniProt sequence viewer of our gene (Q99497). We found the following results:

+ We see 9 variants which are likely associated with a disease. One of them is close to the
active site on position 106.
+Only 9 of the likely-pathogenic variants are reviewed, means that only these 5 have high
quality.
+Taking a closer look to the pathogenic-likely variant on position 104 (close to active site), we
see that the amino acid Alanine is replaced by Threorine. We think that this change can be
worse because we switch from a hydrophobic amino acid to a hydrophilic one. In addition, it
on a β-strand. This variant seems to be interesting; its variant ID is rs774005786. On Uniport,
the variant number is VAR_0220495.
+ From paper: **Parkinson disease protein DJ-1 binds metals and protects against
metal-induced cytotoxicity (Bjorkblom B.)** = _Mutations of DJ-1 are known to cause a
form of recessive early onset Parkinson disease, highlighting an important functional
role for DJ-1 in early disease prevention. This study identifies human DJ-1 as a metalbinding protein able to evidently bind copper as well as toxic mercury ions in vitro.
The study further characterizes the cytoprotective function of DJ-1 and PD-mutated
variants of DJ-1 with respect to induced metal cytotoxicity. The results show that
expression of DJ-1 enhances the cells' protective mechanisms against induced metal
toxicity and that this protection is lost for DJ-1 PD mutations A104T and D149A. The
study also shows that oxidation site-mutated DJ-1 C106A retains its ability to protect
cells._

## Case study 2: Search for a variant

From our variant analysis, we found an interesting variant on position 104 of our protein sequence.
It’s variant ID is rs774005786 or, if we look on Uniprot, VAR_0220495.
If we go to Ensemble, we can find many information about this variant:

+ It’s a missense variant
+ It’s a really rare variant, which occurs with a frequency <0.01 in the population. This is
interesting because its associated disease (Parkinson disease) is more common in the
population.
+ This variant lead to the loss of protection of DJ-1 against metal cytotoxicity.
+ Among different populations, the frequency of the variant remains nearly the same (low!)
+ On the DNA sequence level, the nucleotide guanine is the ancestral one; the variants can be
thymine or adenine.
+ This variant is present in ten transcripts.

To learn more about the association with a specific variant, we can go to the GWAS catalogue and
search for it. If we do this for rs774005786, we find no results. This is really strange, then we have
seen before on Ensemble that this variant exists and that is has a association with the Parkinson
disease.

If we search for the disease (Parkinson disease) in GWAS catalogue, we find different variants. But
none of these variants was found on Uniprot.

We choose one variant (rs3766606) and took a closer look to it. We found the following information:

+ Variant of an intron of the gene PARK7
+ MAF = 0.1775
+ Location: 1:7962137
+ According to GWAS catalogue, this variant is associated with 6 different diseases

**Conclusion**: In this activity we saw the importance of a so called universal language or a
standardisation of naming for protein, genes etc. Because it can lead to difficulties and
misunderstandings in the search process. some variations were only found on one page and not on
another page. 
