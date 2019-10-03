## Activity 5 - NCBI 

##### Paloma Toedtli and Bastien Canonica

**Which chromosome is it located on? Note its location.**

Chr 11 (NC_000011.10):531,909 - 535,900

**What information is contained in dbVar?**

dbVar stores informations about specific large variants, such as copy number variations, insertions, or inversions, identified in a chromosomal region of an organism. It specifies the region size, and displays the genome view, allowing to see overlapping variant regions from other studies.

**What information is in dbSNP?**

Unlike dbVar, dbSNP provides informations about short genetic variations, such as SNVs, indels, or short repeats. 


**What information is in ClinVar?**

ClinVar reports relationships between human variations and their phenotypes.


The results are filtered by selecting :
- In ClinVar – yes
- Most severe clinical significance – pathogenic
- Molecular consequence – missense variant

**How many variants do you have? (Preferably more than 3)**

There are 13 variants, summurized in the table below. In "Mutation type", (H) is hydrophobic, (P) is polar, (A) is acid and (B) is basic. 
In the "Prediction impact" (D.) means damaging.

| Variant ID       |   Mutation                       | Mutation type           |   PDB ID       |              Location in protein         | Polyphen 2 score         | Prediction impact | 
| :---             |    :----:                        |     :---:               |    :---:       |                     :---:                |      :---:               |              ---: |
| rs104894231      | Ala146Pro  Ala146Thr             | H > H<br>H > P          | - |    In a Turn<br>Close to GTP-binding site          |      1.000<br>0.935      | Probably D.<br>Possibly D. |
| rs104894227      | Lys117Arg  Ser11Gly              | B > B<br>P > H          | 2QUZ<br>-    |    In a loop<br>In the GTP-binding site            |      0.998<br>Error      | Probably D.<br> Error |
| rs121917756      | Glu63Lys                         | A > B                   | -    |    In a Beta Strand                                |      0.983.              | Probably D. |
| rs121913233      | Gln61Leu<br>Gln61Arg<br>Gln61Pro | P > H<br>P > B<br>P > H | 4G3X<br>-<br>-    |    In a Beta Strand                                | 0.552<br>0.008<br>0.021  | Possibly D.<br>Benign<br>Benign   |
| rs28933406       | Gln61Glu<br>Gln61Lys             | P > A<br>P > B          | -    |    In a Beta Strand                                |      0.268<br>0.012      | Benign<br>Benign     |
| rs730880460      | Gly60Val<br>Gly60Asp             | H > H<br>H > A          | -    |    In a Beta Strand                                |      1.000<br>1.000      | Probably D.<br>Probably D.    |
| rs121917758      | Thr58Ile                         | P > H                   | -    |    In a Beta Strand                                |      1.000               | Probably D.    |
| rs121917757      | Gln22Ter<br>Gln22Lys             | P > -<br>P > B          | -    |    In an alpha Helix                               |      -<br>1.000          | -<br>Probably D.|
| rs104894226      | Gly13Val<br>Gly13Ala<br>Gly13Asp | H > H<br>H > H<br>H > A | -<br>-<br>6E6P    |    In a Beta Strand<br> In the GTP-binding site   |  0.996<br>0.850<br>0.286 |   Probably D.<br>Possibly D.<br>Benign   |
| rs104894228      | Gly13Cys<br>Gly13Arg<br>Gly13Ser | H > H<br>H > B<br>H > P | -    |    In a Beta Strand<br> In the GTP-binding site    |  0.504<br>0.997<br>0.819 |   Possibly D.<br>Probably D.<br>Possibly D.    |
| rs727503094      | Gly12Ala<br>Gly12Asp<br>Gly12Val<br>Gly12Glu | H > H<br>H > A<br>H > H<br>H > A     | -    |    In a Beta Strand<br> In the GTP-binding site|  0.860<br>0.513<br>0.738<br>0.994 |   Possibly D.<br>Possibly D.<br>Possibly D.<br>Probably D.   |
| rs104894230      | Gly12Val<br>Gly12Ala<br>Gly12Asp | H > H<br>H > H<br>H > A | -    |    In a Beta Strand<br> In the GTP-binding site    |  0.738<br>0.860<br>0.513 |  Possibly D.<br>Possibly D.<br>Possibly D.   |
| rs104894229      | Gly12Cys<br>Gly12Arg<br>Gly12Ser | H > H<br>H > B<br>H > P | 4L9S<br>-<br>- |    In a Beta Strand<br> In the GTP-binding site    |  0.525<br>0.878<br>0.831 |   Possibly D.<br>Possibly D.<br>Possibly D.  |


**What is the PDB ID of the wild type protein?**
In UniProt, the PDB ID of some structure is given. The structure 121P has been taken.


Using iCn3D, the structure figure of the mutated protein Hras K117R was made, and the mutation was highlighted in yellow

<img src="2QUZ.png" width="400" height="400">
