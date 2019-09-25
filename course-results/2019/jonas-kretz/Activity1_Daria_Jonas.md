# Activity 1
Daria & Jonas 25.08.2019
## Paper 1: Impact of genetic variation on three dimensional structures and function of proteins 
### 1. What is the biological question?
_In this paper, they wanted to improve the understanding of the relationship between point mutations (SNVs) and observed consequences in the 3D structure from PDB. Furthermore, they set the focus on phenotype alterations as a consequence from a specific SNV. Over all, they present a detailed overview about the observed effects of SNVs on the structure, function, stability an binding properties of proteins._  

### 2. What is the method?
_The data set was a semi-automatically derived and hand-curated collection of proteins, each of which possess an amino acid that has been changed by SNV and 3D atomic coordinates are available._ 

**To assemble the dataset:** 
_They identified 2’596 structures which then were filtered in two steps: First, they selected all the structures for which the dbSNP mutation information matched information coming from UniProt and the 3D structure. In a second step, they make sure that every SNV was represented once. 
Based on these two selection steps, they ended up with 374 unique PDB structure._ 

**manual annotation of SNVs:**
_For each SNV, they extracted the position on the secondary protein structure (if it’s on a loop, α-Helix or β-sheet) and effect or consequence of the SNV based only on literature._

**Databases and servers used in this work:** 
* RCSB PDB
* LS-SNP/PDB
* dbSNP
* NHLBI exome sequencing project, exome variant server
* PubMEd

**Software tools for mapping genetic variation to protein sequence 3D structure**
_They developed tools to facilitate mapping of any genetic location onto corresponding protein sequences and 3D structure._ 
* Human Gene View
* Proetien Gene View
* 3D viewer

**Categories for assigning effects SNV**
_They defined some categories of the protein which can be affected by a SNV:_
* Activity
* Aggregation
* Stability
* Binding/ Dissociation 
* Assembly
* Rearrangement
### 3. What significant scientific contribution does the paper make?
_Their paper shows that the range of possible SNV effects at the protein level are significantly greater than currently assumed. Alterations due to SNV are not always associated with a disease phenotype even if the change the structure of the protein._ 

## Paper 2: Mutational landscape of metastatic cancer revealed from prospective clinical sequencing of 10’000 patients. 
### 1. What is the biological question?
_At the MSK cancer centre, they developed a hybridization capture-based NGS panel 
(MSK-IMPACT) that is capable to detect all protein-coding mutations, copy number alteration and selected promoter mutations and structural rearrangements in cancer-associated genes. This was done with the aim to improve the clinical treatment of cancer._ 
### 2. What is the method?
_They used 10’945 tumors to explore the genomic landscape of metastatic cancer as encountered in clinical practice and performed an analysis of the clinical utility of MSK-IMPACT in determining the prevalence of actionable mutations and matching patients to molecularly targeted therapy. This study was done as a cohort study._ 
**How does the MSK-IMPACT clinical workflow works?** _Form every patient they collected tumor DNA sample and blood DNA sample as a source of normal DNA. The two DNA samples were sequenced to receive reads. After that, the reads were analysed trough a bioinformatics pipeline which is able to detect multiple classes of genomic rearrangements. The results from this analysis were checked manually for quality and accuracy in MPath (genomic database). After that, the new genomic variations were then uploaded to an open free portal for data mining and interpretation._ 
### 3. What significant scientific contribution does the paper make?
_With their new developed method they found more mutations compared to WES. One example is the TERT promoter: the TERT promoter is usually not covered by WES analysis and important mutations which alter the expression of the telomerase were not detected. 
One important point is that they made their data accessible via cBioPortal for cancer genomics. This could help in further research for drug targets as well as developing new biomarkers for cancer._ 

# Activity 1 Protein
## 1) select a protein:
_We (Jonas and Daria) selected the protein DJ-1, which has a variation (PDB ID: 2RK4) which is associated with a familial Parkinsonism in humans. In the following questions, we only considered variations in humans._
## 2) Go to the PDB and give a brief summary of the available information.
**How many entries are there for the protein?** 

* _In total, there are 65 entries for the DJ-1 protein in humans._

**Which method(s) were used in characterization of the structure?** 

* _The X-ray was used for all 65 entries_

## 3)For the most recent entry with a publication record... 
#### (released date: 9/5/2018)
* _We went to PDB and searched for the DJ-1 protein (only in humans!). Then, we sorted the 65 entries according to their release date (newest to oldest) and selected the newest released variant, which was in our case 6M8Z._

**What is the structure determination method?** 

* _X-ray Diffraction_

**What is the Uniprot ID** 

* _6M8Z_

**How many chains does it have?** 

* _Only 1 chain, which is also visible in the structure colour by chain (the structure is only blue)._ 

**What is the sequence length?** 

* _191 amino acids_

**Which ligands are present?** 

* _There are two ligands, the 4-(2-HYDROXYETHYL)-1-PIPERAZINE ETHANESULFONIC ACID and the CHLORIDE ION_

#### 
![Image colored by side-chain](/home/jokre/Desktop/pic1.png)

![Image colored by hydrophobicity](/home/jokre/Desktop/pic2.png)

### We could not upload the Images. they were sent by email via the first report (DJ-1 protein.docx). 
