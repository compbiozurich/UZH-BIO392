
##  Exploration of different file formats


 ####  1. SAM file format:

SAM short for Sequence Alignment/Map format is a tab-separated values file. It processes short read alignments, which are mapped against a reference sequence. 
Each record consists of 11 mandatory fields and optional fields, which are filling one line. This line gives you information about where and how the sequence maps into the reference. The file usually starts with a header using ‘@’ preceding the sequendce [[1]].  

One example of a SAM format is illustrated below [[2]].
![](https://www.samformat.info/images/sam_format_annotated_example.5108a0cd.jpg)

[1]: http://samtools.github.io/hts-specs/SAMv1.pdf
[2]: https://www.samformat.info/sam-format-flag


---

 #### 2. BAM file format:
The BAM (Binary Alignment Map) file format is the compressed binary representation of SAM file format. 
The storage is more efficient compared to SAM file format as it is compressed and uses a search index facilitating the access of individual records.  
For those reasons BAM is the file format usually used as a storage format rather than the SAM file format [[1]].

---

 #### 3. CRAM file format:
Like the BAM file formats CRAM is a compressed version of alignment using a reference-based sequence data. It is managed by the Global Alliance for Genomics and Health (GA4GH). 
For example, the compression of CRAM files is so efficient that the size of the CRAM file can be up to 60% smaller than the BAM [[3]].


[3]: https://samtools.github.io/hts-specs/CRAMv3.pdf

---

 #### 4. VCF file format:
VCF (Variant Call Format) is encoding data for SNPs storing information in a tab-delimited text file format. The file is separated into three parts:  The first one is the Meta-information lines, which are optional and specify the VCF version number and contain other information. 
The second part is the header, where various important information are stored such as for example the quality score or the start coordinate of the variant. 
The last part of the file gives information on genotype data, quality score , position on chromose and etc… [[4]].
 
 The following picture illustrates the structure of a VCF file format:
 
 ![](https://adatastory.files.wordpress.com/2016/09/example_vcf_wiki.jpg?w=1024)



[4]: https://samtools.github.io/hts-specs/VCFv4.2.pdf

---

 ####  5. FASTA file format
FASTA file contain either nucleotide sequences or peptide sequences. It begins with a header starting with ‘>’ followed by a sequence ID and then by the sequence [[5]].


![](https://upload.wikimedia.org/wikipedia/commons/0/03/FAM149A_Promoter_region_%28FASTA_format%29.png)


[5]: http://genetics.bwh.harvard.edu/pph/FASTA.html


 #### 6. MPEG-G
MPEG-G can selectively access the data in the compressed domain by using APIs ( Class of data , Genomic regions etc..) and it is a also specific transport format [[6]].

[6]: https://www.biorxiv.org/content/10.1101/426353v1#:~:text=The%20MPEG%2DG%20standardization%20project,data%20processing%2C%20transport%20and%20sharing.

---




-  	which would you use for storing called variants?
  >I would use VCF for storinh called variants
  
  
  
-   which would you use for full archival purposes?
  >I would use CRAM, BAM because those are compressed.
  
  
  
  
  
 -  which would you use for browser visualization?
 >I would use BED
  
  
  
  

---
---

## Which genomic variant format exits ?



#### 1. ISCN ( International System for Human Cytogenetic Nomenclature)

First created in 1960 at the Denver Conference and still used nowadays, ISCN uses a nomenclature containing symbols, abbreviated terms and band term to describe the human 
chromosome and chromosome aberrations[[6]].

An example of the nomenclature used for an insertion:
>NC_000023.10:g.32867861_32867862insT (NM_004006.2:c.169_170insA)

[6]: http://varnomen.hgvs.org/bg-material/consultation/ISCN/


---


#### 2. HGVS  (Human Genome Variation Society)
HGVS provides recommendations on the description of sequence variant (change in sequence, change in amount and change in position) in DNA, RNA and protein sequences. For this purpose it uses HGNC gene symbols, abbreviations and reference sequence from reliable sources, e.g Ensemble(EBI) and RefSeq(NCBI). HGVS also uses recommendations to describe variants, where not all information are known (e.g.  no mapping back of variant to a unique location or insertions not fully sequenced) [[7]] [[8]] [[9]].

An example of the nomenclature is depicted below:

>NM_004006.2:c.4375C>T


[7]: https://varnomen.hgvs.org/recommendations/general/
[8]: http://www.hgvs.org/varnomen/HGVS-basics2017.pdf
[9]: https://varnomen.hgvs.org/recommendations/uncertain/


---


####  3. GA4GH Variation Representation Specification
GA4GH VR Specification standardizes the exchange and representation of variation data by using e. g terminology and information model, machine readable schema (JSON Schema), facilitating data sharing and unified computed identifiers [[10]].

[10]: https://vr-spec.readthedocs.io/en/1.1/

