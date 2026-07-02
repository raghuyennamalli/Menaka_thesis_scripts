Genome-wide Comparative Analysis to Identify Unique Innate Immune Signatures in Indicine Breeds

Overview

This repository contains the scripts and command files used in the thesis entitled "Genome-wide Comparative Analysis to Identify Unique Innate Immune Signatures in Indicine Breeds."

The primary objective of this study was to identify innate immune signatures uniquely present in indicine cattle breeds through comprehensive genome-wide comparative analysis with taurine and crossbred cattle. The study integrates multiple genomic and systems biology approaches, including genomic variant discovery, population genomic analyses, selective sweep detection, structural variant analysis, gene expression validation, and network-based systems biology to identify candidate immune markers.

The analyses performed in this study include:

- Genomic variant identification using GATK, FreeBayes, and DELLY
- Population differentiation analysis (FST and nucleotide diversity)
- Selective sweep detection using RAiSD
- Runs of Homozygosity (ROH) analysis
- Population structure analysis using PCA, Neighbor-Joining (NJ) Tree, and ADMIXTURE
- Functional annotation of genomic variants
- Correlation with gene expression profiles
- Network-based systems biology analysis for identification of hub genes and central regulators

---

Repository Contents

1. Admixture_Analysis.txt

Contains the commands used to perform ADMIXTURE analysis for estimating ancestry components and admixture proportions across samples using different K values ranging from 1 to 7.

2. Build_NJ_Tree.py

Python script used to construct a Neighbor-Joining (NJ) tree among indicine, taurine, and crossbred cattle breeds to study their evolutionary relationships.

3. Calling_Variant.sh

Automated shell script used for processing mapped sequencing reads, variant calling using GATK, and variant normalization using BCFtools.

4. DELLY_Analysis.sh

Shell script used for identifying structural variants (SVs) and copy number variants (CNVs) using the DELLY software.

5. DELLY_Map_file.sh

Shell script used to generate the reference genome map files required for DELLY analysis.

6. Eigenvalue_Calculation.py

Python script used to calculate eigenvalues from Principal Component Analysis (PCA) results.

7. Fetching_SRAID_SRA_Toolkit.sh

Shell script used to download sequencing data from the NCBI Sequence Read Archive (SRA) using the SRA Toolkit.

8. FreeBayes_Calling.sh

Shell script used for identifying small genomic variants using the FreeBayes variant caller.

9. Fst_Annotation.txt

Contains commands used for functional annotation of highly differentiated genomic regions identified through FST analysis.

10. Fst_pi_PCA_Analysis.txt

Contains commands used to perform:

- Population differentiation (FST)
- Nucleotide diversity (π)
- Principal Component Analysis (PCA)

using VCFtools and PLINK.

11. Mapping_Reads_Reference_Genome.sh

Shell script used for mapping processed sequencing reads to the reference genome using BWA-MEM, followed by sorting, duplicate marking, and indexing using SAMtools.

12. Network_Analysis.ipynb

Python notebook used for network-based systems biology analysis, including:

- Network preprocessing
- Identification of the largest connected component
- Degree distribution analysis
- Conversion of Protein-Protein Interaction (PPI) networks into Gene Regulatory Networks (GRNs)
- Identification of hub genes and central regulators

13. RAiSD_Analysis.txt

Contains commands used to identify genomic regions under positive selection using the RAiSD software.

14. ROH_Analysis.txt

Contains commands used for identifying Runs of Homozygosity (ROH) regions and ROH islands.

15. Reads_Preprocessing.sh

Shell script used for raw read quality assessment and adapter trimming using Fastp.

16. Reference_Quality_Check.txt

Contains commands used to evaluate the assembly statistics and quality of the reference genome using QUAST.

17. SnpEff_SnpSift_Annotation.txt

Contains commands used to annotate genomic variants identified using GATK, FreeBayes, and DELLY with SnpEff and SnpSift, and to extract variant-associated information.

18. rsID_Matching.txt

Contains commands used to map identified genomic variants to their corresponding rsIDs available in the dbSNP database.

---

Software and Tools Used

The analyses were performed using a combination of widely used bioinformatics software, including:

- GATK
- FreeBayes
- DELLY
- BCFtools
- SAMtools
- BWA-MEM
- Fastp
- VCFtools
- PLINK
- ADMIXTURE
- RAiSD
- SnpEff
- SnpSift
- SRA Toolkit
- Python
- Colab Notebook
- QUAST

---

Purpose of this Repository

This repository serves as a collection of all scripts and command files used throughout the study to ensure reproducibility and transparency of the computational analyses described in the thesis.

---

Contact

Dr. Ragothaman M. Yennamalli
Associate Professor
School of Biotechnology
Jawaharlal Nehru University (JNU), New Delhi, India
