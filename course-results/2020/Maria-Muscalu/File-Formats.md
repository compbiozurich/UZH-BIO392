### Exploration of variant annotation formats

#### 1. International System for Human Cytogenomic Nomenclature (ISCN)


The description of the chromosomal changes, which are detected using microscopic and cytogenetic methods, is based on the ISCN guidelines [[1]]. One of the key points of this nomenclature is that, it illustrates the structure of the chromosomes [[2]]. The ISCN format uses a variety of symbols and abbreviations, which are all summarized by the [Coriell Institute for medical research](https://www.coriell.org/0/Sections/Support/Global/iscn_help.aspx?PgId=263). The [Sequence Variant Nomenclature](https://varnomen.hgvs.org/recommendations/DNA/variant/complex/) website, also points out some of the specific symbols and their use to describe the chromosomes. For example, *pter* and *qter* indicate the start and the end of the chromosomes respectively, while *cen* represents the centromere [[2]]. Other symbols like *sup* inform about the presence of an additional sequence while *::* indicate the location of a break and formation of a ring chromosome [[2]]. The information given by ISCN focuses chromosomal translocations, inversions, deletions or insertions, as well as additional chromosomes [[2]].

An example of the ISCN can be seen below:

> chr2:g.pter_8,247,756::chr11:g.15,825,273_cen_qter (der11)

The previous lines indicates an example for a balanced translocation between chromosome two and 11, following the ISCN recommendations [[2]].
  

[1]: http://varnomen.hgvs.org/bg-material/consultation/ISCN/ 
[2]: https://varnomen.hgvs.org/recommendations/DNA/variant/complex/
[3]: https://www.coriell.org/0/Sections/Support/Global/iscn_help.aspx?PgId=263

#### 2. Human Genome Variation Society (HGVS)

While the ISCN nomenclature provides recommendations for the chromosomal changes, the HGVS nomenclature focuses on the description of the sequence variants [[4]]. The [Sequence Variant Nomenclature](https://varnomen.hgvs.org/recommendations/general/) website gives an overview of the recommended symbols and abbreviations, which, only in some cases, overlap with the ones used by ISCN. (The common abbreviations for ISCN and HGVS are: *cen*, *chr*, *pter*, *qter*, *sup* and *::* [[5]]) The HGVS nomenclature is used to write the variants for DNA, RNA and proteins. As an example the DNA recommendations extend to variants substitution, deletion, duplication, insertion, inversion, conversion, deletion-insertion, alleles and repeated sequences [[6]].

An example of the HGVS can be seen below:

> NC_000002.12:g.pter_8247756delins[NC_000011.10:g.pter_15825272]

The previous lines represent a HGVS nomenclature using the same example as for the ISCN, to illustrate the differences between the two nomenclature recommendations [[2]].

[4]: https://varnomen.hgvs.org/bg-material/basics/
[5]: https://varnomen.hgvs.org/recommendations/general/
[6]: https://varnomen.hgvs.org/recommendations/DNA/

#### 3. Variant Call Format (VCR)

This file format is used to store genetic variants [[7]]. The file format can be separated in three sections: the meta information lines, the header line and the data lines [[8]]. The meta information lines are structured in INFO, FILTER and FORMAT, while the header line indicates the names of the eight columns in which the data is categorised [[8]]. The first column is CHROM which specifies the name of the chromosome, followed bx POS, which indicates the position [[8]]. The data also contains unique identifiers (ID), the original base(s) (REF), the replacement base(s) (ALT), an indication about the quality of the ALT assertion, a filter (FILTER) and additional information (INFO) [[8]].  

[7]: https://samtools.github.io/hts-specs/VCFv4.3.pdf
[8]: https://www.internationalgenome.org/wiki/Analysis/vcf4.0/

#### 4. GA4GH Variation Representation Specification (VRS)

The VRS uses the Jonson-based schema [[9]] and was done to standardize the exchange of variation data [[10]]. In VRS an allele object is composed of a location and state at the respective location and it uses interbase coordinates [11]. The information about an allele can be made into a VRS object using the Jonson-based schema, which is shown below [11]. 
 
```python
{
  "location": {
    "interval": {
      "end": 32936732,
      "start": 32936731,
      "type": "SimpleInterval"
    },
    "sequence_id": "refseq:NC_000013.11",
    "type": "SequenceLocation"
  },
  "state": {
    "sequence": "C",
    "type": "SequenceState"
  },
  "type": "Allele"
}
```

[9]. https://vr-spec.readthedocs.io/en/latest/terms_and_model.html#data-model-notes-and-principles
[10]. https://vr-spec.readthedocs.io/en/latest/introduction.html
[11]. https://vr-spec.readthedocs.io/en/1.1/impl-guide/example.html







