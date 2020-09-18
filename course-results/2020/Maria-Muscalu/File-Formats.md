### Exploration of variant annotation formats

#### 1. International System for Human Cytogenomic Nomenclature (ISCN)

The discribtion of the chromosomal changes, which are detected using microscopic and cytogenetic methods, is based on the ISCN guidelines [[1]]. One of the key points of this nomenclature is that, it ilustrates the structure of the chromosomes [[2]]. The ISCN format uses a variaty of symbols and abbreviations, which are all summarized by the [Coriell Institute for medical research](https://www.coriell.org/0/Sections/Support/Global/iscn_help.aspx?PgId=263). The [Sequence Variant Nomenclature](https://varnomen.hgvs.org/recommendations/DNA/variant/complex/) website, also points out some of the specific symbols and their use to describe the chromosomes. For example, *pter* and *qter* indicate the start and the end of the chromosomes respectively, while *cen* represents the centromere [[2]]. Other symbols like *sup* inform about the presence of an additiona sequence while *::* indicate the location of a break and formation of a ring chromosome [[2]]. The information given by ISCN focuses chromosomal translocations, invertions, delitions or insertions, as well as additional chromosomes [[2]].

An example of the ISCN can be seen below:

> chr2:g.pter_8,247,756::chr11:g.15,825,273_cen_qter (der11)
> chr11:g.pter_15,825,272::chr2:g.8,247,757_cen_qter (der2)

The previous lines indicates an example for a balanced translocation between chromosome two and 11, following the ISCN recomandations [[2]].
  

[1]: http://varnomen.hgvs.org/bg-material/consultation/ISCN/ 
[2]: https://varnomen.hgvs.org/recommendations/DNA/variant/complex/
[3]: https://www.coriell.org/0/Sections/Support/Global/iscn_help.aspx?PgId=263

#### 2. Human Genome Variation Society (HGVS)

While the ISCN nomenclature provides recomandations for the chromosomal changes, the HGVS nomenclature focuses on the describtion of the sequence variants [[4]]. The [Sequence Variant Nomenclature](https://varnomen.hgvs.org/recommendations/general/) website gives an overview of the recommended symbols and abreviations, which, only in some cases, overlap with the ones used by ISCN. (The common abbreviations for ISCN and HGVS are: *cen*, *chr*, *pter*, *qter*, *sup* and *::* [[5]]) The HGVS nomenclature is used to write the variants for DNA, RNA and proteins. As an example the DNA recommendations extend to variants substitution, deletion, duplication, insertion, inversion, conversion, deletion-insertion, alleles and repeated sequences [[6]].

An example of the HGVS can be seen below:

> NC_000002.12:g.pter_8247756delins[NC_000011.10:g.pter_15825272]
> NC_000011.10:g.pter_5825272delins[NC_000002.12:g.pter_8247756]

The previous lines represent a HGVS nomenclature using the same example as for the ISCN, to ilustrate the differences between the two nomenclature recommendations.

[4]: https://varnomen.hgvs.org/bg-material/basics/
[5]: https://varnomen.hgvs.org/recommendations/general/
[6]: https://varnomen.hgvs.org/recommendations/DNA/
