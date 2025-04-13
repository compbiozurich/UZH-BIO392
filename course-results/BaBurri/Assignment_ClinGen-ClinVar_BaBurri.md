# **Asssignment by Basil Burri**


### Task of this assignment
- Query disease names on [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/) to assess disease associated variants.
- Query gene names on [ClinGen](https://clinicalgenome.org/) to assess which disease they cause when varied.


## **Relational list using [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/)**

**Settings for ClinVar query**
- Classification type: Germline
- Germline classification: Pathogenic
- Review status: Multiple submitters

**Variation selection**
- The disease name was queried and then a variation was selected that is associated with the disease.
- Only variations were selected on ClinVar which have a "Pathogenic" association with the diesease, "Pathogenic/Likely pathogenic" variations were ignored.

**Disease descriptions**
- Derived from [National Health Service](https://www.nhs.uk/conditions/), [MedlinePlus](https://medlineplus.gov/), and [Online Mendelian Inheritance in Man](https://www.omim.org/).

|Disease|Disease description|Gene|Variants（HGVS)|
|-------|-------------------|----|--------|
|Hemochromatosis|inherited condition where iron levels in the body slowly build up over many years|HJV|NM_213653.4:c.187C>T|
|Thalassemia|inherited blood disorder that affects hemoglobin and causes anemia-like symptoms|ATRX|NM_000489.6:c.7205del|
|Haemophilia|inherited condition that affects negatively blood clotting, leading to stronger bleeding|F8|NM_000132.4:c.4936del|
|Cystic Fibrosis|inherited genetic condition that causes breathing and digestive problems|CFTR|NM_000492.4:c.1891dup|
|Tay-Sachs disease|inherited condition that stops the nerves working properly and is usually fatal at neonate state|HEXA|NM_000520.6:c.1385A>T|
|Fragile X syndrome|inherited genetic disorder that causes physical abnormalities, behavioral issues and other health problems|MECP2|NM_001110792.2:c.1198_1199delinsTA|
|Huntington's disease|inherited progressive neurological condition that affects movement and thinking|PRNP|NM_000311.5:c.593T>C|


## **Relational list using [ClinGen](https://clinicalgenome.org/)**

**Gene selection**
- The gene name was queried and then a gene was selectet which matches unambiguously the query.
- Only genes were selected on ClinGen that are "protein-coding genes", "pseudogenes" were ignored.
- The disease was assessed by looking at the "Dosage Sensitivity" informations for each gene.

**Gene descriptions**
- Derived from the "Gene Facts" for each queried gene on ClinGen.

**Disease descriptions**
- Derived from [National Health Service](https://www.nhs.uk/conditions/), [MedlinePlus](https://medlineplus.gov/), and [Online Mendelian Inheritance in Man](https://www.omim.org/).

|Gene|Gene name|Chromosomal location|Gene product|Disease|Disease description|
|----|---------|--------------------|------------|-------|-------------------|
|CFTR|CF transmembrane conductance regulator|7q31.2|epithelial ion channel, transport of chloride ions across the cell membrane|Cystic fibrosis|genetic disorder characterized by the production of sweat with a high salt content and mucus secretions with an abnormal viscosity|
|CYBB|cytochrome b-245 beta chain|Xp21.1-p11.4|component of the membrane-bound oxidase of phagocytes that generates superoxide|granulomatous disease|genetic condition where leucocytes are unable to destroy potentially harmful bacteria and fungi|
|HJV|hemojuvelin BMP co-receptor|1q21.1|bone morphogenetic protein (BMP) coreceptor|hemochromatosis type 2A|inherited condition where iron levels in the body severely build up and lead to organ failure before 30 years of age|
|CDKN2A|cyclin dependent kinase inhibitor 2A|9p21.3|negative regulator of the proliferation of normal cells by interacting strongly with CDK4 and CDK6|melanoma-pancreatic cancer syndrome|inherited cancer predisposition syndrome in which mutation carriers have an increased risk of developing malignant melanoma and/or pancreatic cancer|
|KRAS|KRAS proto-oncogene, GTPase|12p12.1|Ras protein that binds GDP/GTP and possesses intrinsic GTPase activity|Noonan syndrome|dysmorphic syndrome characterized primarily by dysmorphic facial features, cardiac abnormalities, and short stature|
|TP53|tumor protein p53|17p13.1|multifunctional transcription factor that induces cell cycle arrest, DNA repair or apoptosis upon binding to its target DNA sequence|Li-Fraumeni syndrome|rare cancer predisposition syndrome characterized by the early-onset of multiple primary cancers|
|FMR1|fragile X messenger ribonucleoprotein 1|Xq27.3|multifunctional polyribosome-associated RNA-binding protein|Fragile X syndrome|genetic disorder characterized by mild-to-moderate intellectual disability|
