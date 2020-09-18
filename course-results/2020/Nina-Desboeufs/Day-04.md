# FIle Formats 

## Variant Nomenclature 

### ISCN 
The International System for Human Cytogenetic Nomenclature (ISCN) is a widely used nomenclature to describe the **human chromosome complement** and consists of symbols and abbreviated terms to specifically describe chromosomes and **numerical and structural chromosomal changes** (based on microscopic and cytogenetic techniques). It has been proposed since 1960 and the last update found was in 2016 named extension ISCN and recently modified in May 2020. E.g.:

| Abbreviation        | Meaning                |
|:--------------------|:-----------------------|
| fra                 | fragile site           |
| cht                 | chromatid              |
| t                   | translocation          |
| []                  | surround number of cells or genome build |

More abbreviations can be found [here](https://www.coriell.org/0/Sections/Support/Global/iscn_help.aspx?PgId=263) and the recommendations are published as [book, 2016](https://www.karger.com/Book/Home/271658). 

### HGVS
The Human Genome Variant Society (HGVS) is a standard nomenclature to describe variants. The following format is used: 
* **reference sequence -> variant** \
 e.g. **NM_004006.2:c.4375C>T**, NM_004006.2 (Reference), c.4375C>T (variant) 


The RNA and protein predictions have to be specified by using "()". _c_ stands for "coding DNA reference sequence" but _g_ can also be used since the whole genome is sequenced and stands for "genomic reference sequence". 


**ISCN vs HGVS**: ISCN focuses on the resulting structure of the chromosomes while HGVS on the observed variants. 
