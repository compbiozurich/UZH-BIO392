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

The VRS uses the Jonson-based schema [[9]] and was done to standardize the exchange of variation data [[10]]. In VRS an allele object is composed of a location and state at the respective location and it uses interbase coordinates [[11]]. The information about an allele can be made into a VRS object using the Jonson-based schema, which is shown below [[11]].

 
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

[9]: https://vr-spec.readthedocs.io/en/latest/terms_and_model.html#data-model-notes-and-principles
[10]: https://vr-spec.readthedocs.io/en/latest/introduction.html
[11]: https://vr-spec.readthedocs.io/en/1.1/impl-guide/example.html

#### 5. 0 or 1-based and "interbase" genomic coordinate systems

The interbase and 0-based coordinates refer to nucleotides or variant positions using the space between two bases on a genomic sequence, as opposed to the 1-based, which uses as coordinates the number of the actual nucleotides [[12]]-[[13]]. On one hand, the 0-based coordinates can sepcify a region with a half-closed-half-open interval [[14]]. For example, to describe the part between the second and sixth nucleotide, the interval [1, 6) is appropriate [[14]]. On the other hand, the 1-based coordinates can refer to a part of sequence using a closed interval and for the example above, this would mean the [2, 6] interval [[14]].  

[12]: https://genviz.org/module-01-intro/0001/02/01/Review_of_Central_Concepts/
[13]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3383450/#:~:text=The%20so%2Dcalled%20%E2%80%9Cbase%E2%80%9D,nucleotide%20positions%20in%20the%20genome.

#### 6. Other genomic file formats and their use cases

The SAM (Sequence Alignment/Map) file format is separated in two sections: one for the header and a second one for the alignment [[14]]. One of the differences between the two sections is that the header lines start with the *@* symbol [[14]]. The information from the alignment section is separated into 11 mandatory columns [[14]]. Each alignment line indicates the "linear alignment of a segment" [[14]]. The BAM (Binary Alignment/Map) file is the binary format of SAM [[15]] and because of this it needs less storage space but it is not as easy to read as SAM [[18]]. The CRAM and BAM files are both alignment files but the CRAM format more compressed as opposed to the BAM format, due to the reference that is used to store the data [[15]].

FASTA files are used for storing nucleotide or peptide sequences [[16]]. The file has a .txt format and its content can be separated into two parts: a single information line (which begins with the symbol ">") and the sequence [[16]].

MPEG-G project has the goal to enable management of large genomic data, by achieving a compressed data format [[17]].


[14]: https://samtools.github.io/hts-specs/SAMv1.pdf
[15]: https://www.internationalgenome.org/formats
[16]: https://zhanglab.ccmb.med.umich.edu/FASTA/
[17]: https://www.biorxiv.org/content/10.1101/426353v1#:~:text=The%20MPEG%2DG%20standardization%20project,data%20processing%2C%20transport%20and%20sharing.
[18]: https://mdozmorov.github.io/BIOS668.2018/assets/03_Genomic_resources/01_File_formats.pdf

### Estimate Storage Requirements for 1000 Genomes

#### 1. How much computer storage is required for 1000 Genomes

##### WES & WEG

According to the [NGS Data Management and Analysis](https://www.strand-ngs.com/support/ngs-data-storage-requirements) website the whole genome sequence (WGS) can take up to 150 GB and a whole exome sequence (WES) needs 8 GB. As a result the WGS would need a total of 150 TB and the WES would require 8 TB. The same website suggests that the data is stored as BAM files which take up less space [[19]].

[19]: https://www.strand-ngs.com/support/ngs-data-storage-requirements

##### BAM file format

BAM file is used to store in a binary format the linear alignment of a segment (saves the binary format of the SAM file) [[14]]-[[15]]. According to the course BIO392 [slides](https://compbiozurich.org/UZH-BIO392/course-material/2020/2020-09-18-BIO392-files.pdf) and the [Mass Genomics](http://massgenomics.org/2014/11/brace-yourself-for-large-scale-whole-genome-sequencing.html) website a 30x BAM file can store a whole genome for up to 100 GB. In total for a 1000 Genomes the BAM file format would need 100 TB.

[20]: http://massgenomics.org/2014/11/brace-yourself-for-large-scale-whole-genome-sequencing.html


##### SAM file format

The [Uppsala Multidisciplinary Center for Advanced Computational Science](https://www.uppmax.uu.se/support/user-guides/using-cram-to-compress-bam-files/) indicates the differences in size between the SAM, BAM and CRAM format file. They use as an example a BAM file that has 1.9 GB and indicate that it was compressed from a 7.4 GB SAM file [[21]]. As a result considering that the BAM file format would need 100 TB to store 1000 Genomes, the SAM file format would take up 390 TB.

[21]: https://www.uppmax.uu.se/support/user-guides/using-cram-to-compress-bam-files/

##### CRAM file format
According to the [Uppsala Multidisciplinary Center for Advanced Computational Science](https://www.uppmax.uu.se/support/user-guides/using-cram-to-compress-bam-files/) website CRAM lossless file (which means that the convertion from BAM to CRAM and back to BAM has no data loss) has 1.4 GB [[21]]. A CRAM lossless file would need about 74 GB.


##### VCR file format

The VCR file format cis used to store information about the genomic variants [[7]], meaning that these files contain the differences among individual genomes [[22]]. If we consider that each genome has about 3 million variants, this will lead to VCR file format with a size of 125 MB per genome [[22]]. As a result 1000 genomes would require 125 GB.

[22]: https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0
