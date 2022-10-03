# Task: Estimate Storage Requirements for 1000 Genomes
## WGS: Whole Genome Sequencing
The genome is encoded by 4 bases: A, T, C, G. To encode the letters 2 bits per base are sufficient (00, 01, 10 ,11). Since the human genome consists of approximately 3 billion base pairs, the storage of 1000 genomes requires about **700GB**.

``` 3 billion base pairs * 2 bits per base * 1000 genomes / 8 bits per byte = 700 GB ```

## WES: Whole Exome Sequencing
In the human genome only about 1% are exons. Therefore the storage of 1000 Exomes requires about 1% of the storage for a whole genome (**7GB**).

```700 GB * 1% = 7 GB```

## File Formats

### SAM
SAM (Sequence Alignment Map) files are human-readable text files

<picture>
	<img alt="SAM" src="https://media.springernature.com/full/springer-static/image/art%3A10.1186%2F1756-0381-6-13/MediaObjects/13040_2013_Article_92_Fig8_HTML.jpg?as=webp" width=80% height=80%>
</picture>

[^1]

### BAM
BAM (Binary Alignment Map) files are the binary (and compressed) equivalent to SAM

### VCF
Variant Call Format

<picture>
	<img alt="VCF" src="https://media.springernature.com/lw685/springer-static/image/art%3A10.1186%2F1756-0381-6-13/MediaObjects/13040_2013_Article_92_Fig9_HTML.jpg?as=webp" width=65% height=65%>
</picture>

[^1]

### FASTA
The file contains a header and the unaligned sequence.

```
>sp|P01116|RASK_HUMAN GTPase KRas OS=Homo sapiens OX=9606 GN=KRAS PE=1 SV=1
MTEYKLVVVG AGGVGKSALT IQLIQNHFVD EYDPTIEDSY RKQVVIDGET CLLDILDTAG
QEEYSAMRDQ YMRTGEGFLC VFAINNTKSF EDIHHYREQI KRVKDSEDVP MVLVGNKCDL
PSRTVDTKQA QDLARSYGIP FIETSAKTRQ RVEDAFYTLV REIRQYRLKK ISKEEKTPGC
VKIKKCIIM
```

[^1]: [https://biodatamining.biomedcentral.com/articles/10.1186/1756-0381-6-13](https://biodatamining.biomedcentral.com/articles/10.1186/1756-0381-6-13)
