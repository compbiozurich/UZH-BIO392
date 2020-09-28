## After-class exercise: Genome liftOver

### **1. Convert other files to the BED format (programmatically).**

```javascript
awk -v OFS='\t' '{print "chr"$2,$3,$4,$1"-SEGPROBES-"$7,$6,$5,$3,$4}' 20200924/segments.tsv \
> 20200924/segments_transformed.bed
```

### **2. Use the liftOver program locally:**


```javascript
// The program is made executable using
chmod a+x liftOver // The path to liftOver was previously changed using cd ~/Documents/BIO392

./liftOver # information about how to use appears

/* To run the program a map.chain file is needed
This can be downloaded at http://hgdownload.cse.ucsc.edu/goldenPath/hg18/liftOver/
I used the hg18toHg19.over.chain */


# Is very important that the BED file used in liftOver does not have a header row that describes what is in every column.

awk -v OFS='\t' 'NR !=1 {print "chr"$2,$3,$4,$1"-SEGPROBES-"$7,$6,$5,$3,$4}' 20200924/segments.tsv \
> 20200924/segments_transformed.bed

# The command line should have the following format: liftOver oldFile map.chain newFile unmapped

./liftOver 20200924/segments_transformed.bed hg18toHg38.over.chain \
20200924/liftOver_converted_segments_transformed.bed unmapped-to-grch37

head 20200924/segments_transformed.bed 
chr1	558358	822262	SAMPLE_1-SEGPROBES-4	0.1164	0	558358	822262
chr1	1598122	70541062	SAMPLE_1-SEGPROBES-103	-0.1346	0	1598122	70541062
chr1	71679114	180533364	SAMPLE_1-SEGPROBES-116	0.0324	0	71679114	180533364
chr1	181351615	196333968	SAMPLE_1-SEGPROBES-16	0.24	1	181351615	196333968
chr1	197555049	246405976	SAMPLE_1-SEGPROBES-55	0.147	0	197555049	246405976
chr1	246499124	247086071	SAMPLE_1-SEGPROBES-8	0.314	1	246499124	247086071
chr2	60038	81349722	SAMPLE_1-SEGPROBES-107	-0.0134	0	60038	81349722
chr2	82603782	110970825	SAMPLE_1-SEGPROBES-27	0.088	0	82603782	110970825
chr2	112466561	127666737	SAMPLE_1-SEGPROBES-17	0.2419	1	112466561	127666737
chr2	127716603	218862592	SAMPLE_1-SEGPROBES-91	0.0679	0	127716603	218862592

head 20200924/liftOver_converted_segments_transformed.bed

chr1	633115	897019	SAMPLE_1-SEGPROBES-4	0.1164	0	633115	897019
chr1	1676820	70302791	SAMPLE_1-SEGPROBES-103	-0.1346	0	167682070302791
chr1	183115857	198098215	SAMPLE_1-SEGPROBES-16	0.24	1	183115857	198098215
chr1	199319298	248176051	SAMPLE_1-SEGPROBES-55	0.147	0	199319298	248176051
chr2	70038	81269087	SAMPLE_1-SEGPROBES-107	-0.0134	0	70038	81269087
chr2	111992513	127192691	SAMPLE_1-SEGPROBES-17	0.2419	1	111992513	127192691
chr2	127242557	218289625	SAMPLE_1-SEGPROBES-91	0.0679	0	127242557	218289625
chr2	218300389	242124921	SAMPLE_1-SEGPROBES-34	-0.0636	0	218300389	242124921
chr3	78046	89521897	SAMPLE_1-SEGPROBES-126	-0.1647	-	78046	89521897
chr3	93909306	198029529	SAMPLE_1-SEGPROBES-127	0.0804	0	93909306	198029529
mariamuscalu@Marias-MacBook-Air-2 BIO392 % 

```


```javascript
cd ~/Documents/BIO392

# Setup Python virtual environment
python3 -m venv myenv 
source myenv/bin/activate 
pip install --upgrade pip 

# Install segment_liftover: 
pip install segment_liftover

segment_liftover -l ./liftOver -i 20200924/ -o 20200924/ -c hg18ToHg38 -si segments.tsv \
-so py_liftOver_segments.tsv 

awk -v OFS='\t' 'NR !=1 {print "chr"$2,$3,$4,$1"-SEGPROBES-"$7,$6,$5,$3,$4}' 20200924/py_liftOver_segments.tsv \
> 20200924/py_liftOver_segments_transformed.bed

head 20200924/py_liftOver_segments_transformed.bed
chr1	633115	897019	SAMPLE_1-SEGPROBES-4	0.1164	0	633115	897019
chr1	1676820	70302791	SAMPLE_1-SEGPROBES-103	-0.1346	0	1676820	70302791
chr1	71440843	182297606	SAMPLE_1-SEGPROBES-116	0.0324	0	71440843	182297606
chr1	183115857	198098215	SAMPLE_1-SEGPROBES-16	0.24	1	183115857	198098215
chr1	199319298	248176051	SAMPLE_1-SEGPROBES-55	0.147	0	199319298	248176051
chr1	248269199	248825249	SAMPLE_1-SEGPROBES-8	0.314	1	248269199	248825249
chr2	70038	81269087	SAMPLE_1-SEGPROBES-107	-0.0134	0	70038	81269087
chr2	111992513	127192691	SAMPLE_1-SEGPROBES-17	0.2419	1	111992513	127192691
chr2	127242557	218289625	SAMPLE_1-SEGPROBES-91	0.0679	0	127242557	218289625
chr2	218300389	242124921	SAMPLE_1-SEGPROBES-34	-0.0636	0	218300389	242124921
```

There are a many differences between the two files:
```javascript
diff 20200924/liftOver_converted_segments_transformed.bed 20200924/py_liftOver_segments_transformed.bed

< chr11	106961340	134996570	SAMPLE_1-SEGPROBES-53	-0.1915	-	106961340	134996570
---
> chr11	106961340	134996570	SAMPLE_1-SEGPROBES-53	-0.1915	-1	106961340	134996570
```
However most of these differences are caused by minor changes in one column as indicated by the example above.  In the liftOver_converted_segments_transformed.bed file the strang has a “–“ symbol, while the 20200924/py_liftOver_segments_transformed.bed file (which was done using segment_liftover and then converted to a bed file) has a -1.
