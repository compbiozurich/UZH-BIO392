# Day II - Gene Disease Relation
#### Sandrin Hunkeler  (MSc. in Informatics)

___


## Variants and diseases

### Search Strategy

For ClinVar I filtered for Germline, Pathogenic and Multiple Submitters. Then I selected one of the top most promising variations.
For ClinGen I switched between searching for the gene and the disease. The search results for all elements were unambiguous.
For the Gene Product and the Disease I searched online using [Medi+](https://medlineplus.gov/). 

### Relational list using [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/)

| Disease              | Disease description                                                                           | Gene    | Variants（HGVS)                        |
|----------------------|-----------------------------------------------------------------------------------------------|---------|---------------------------------------|
| Hemochromatosis      | a disorder that causes the body to absorb too much iron from the diet                         | HJV     | NM_213653.4:c.187C>T                  |
| Thalassemia          | 	A blood disorder where there is less than normal amounts of an oxygen carrying protein	      | ATRX    | 	NM_000489.6:c.134-2A>G 	             |
| Haemophilia          | 	A blood disorder where the blood does not clot properly	                                     | F8      | 	NM_000132.4:c.670+1G>A	              |
| Cystic Fibrosis      | 	A disorder where slime is built up in the lungs and also affects digestion 	                 | 		CFTR  | 	NM_000492.4:c.1891dup 	              |
| Tay sachs disease    | 	Disorder which results in the destruction of the nerve cells	                                | 	HEXA	  | 	NM_000520.6:c.72G>A 	                |
| Fragile X syndrome   | 	A condition causing mental disability and learning difficulties	                             | 	MECP2	 | 	NM_001110792.2:c.1198_1199delinsTA 	 |
| Huntington's disease | A progressive brain disorder which causes random muscle movement and slow mental disability		 | 		PRNP  | 		NM_000311.5:c.392G>T                |


### Relational list using [ClinGen](https://clinicalgenome.org/)

| Gene   | Gene name                                 | Chromosomal location | Gene product                                                                     | Disease                               | Disease description                                                                                                                  |
|--------|-------------------------------------------|----------------------|----------------------------------------------------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| CFTR   | CF transmembrane conductance regulator    | 7q31.2               | epithelial ion channel, transport of chloride ions across the cell membrane      | Cystic fibrosis                       | A genetic disorder characterized by the production of sweat with a high salt content and mucus secretions with an abnormal viscosity |
| CYBB   | 	cytochrome b-245 beta chain	             | 	Xp21.1-p11.4	       | subunit of proteins that form enzyme NADPH oxidase, important for immune system	 | 	Granulomatous disease	               | 	A disease where the imunsystem cannot fight infections properly	                                                                    |
| HJV    | 	hemojuvelin BMP co-receptor	             | 	1q21.1	             | 	hemojuvelin, maintains iron levels and levels of hepcidin	                      | 	Hemochromatosis type 2A	             | 	A disorder where the body stores too much iron which then damages organs	                                                           |
| CDKN2A | 	cyclin dependent kinase inhibitor 2A	    | 	9p21.3	             | several proteins, p16 and p14 which are tumor suppressors		                      | 	Melanoma-pancreatic cancer syndrome	 | 	An increased risk of pancreatic cancer	                                                                                             |
| KRAS   | 		KRAS proto-oncogene, GTPase             | 12p12.1		            | K-Ras, part of RAS pathway which controls cell growth		                          | 	Noonan syndrome	                     | 		         A genetic condition which results in heart and facial differences                                                         |
| TP53   | 	  tumor protein p53  	                   | 	17p13.1	            | 	p53, tumor suppressor	                                                          | 	Li-Fraumeni syndrome	                | 	disorder which increases the risk of developing multiple types of cancer	                                                           |
| 	FMR1  | 		fragile X messenger ribonucleoprotein 1 | 	Xq27.3	             | FMRP, plays a role in development of synapses		                                  | Fragile X syndrome                    | A genetic disorder characterized by mild-to-moderate intellectual disability                                                         |