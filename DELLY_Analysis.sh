#!/bin/bash

echo "Sample name:KangayamL1"&&

echo "delly calling:Calling structural varaint"&&

delly call -g GCF_002263795.3_ARS-UCD2.0_genomic.fna -o /yennamalli2/Indigenous_Cow_Genomes/Redcliffe_NGSdata_analysis/delly_analysis/KangayamL1.bcf /yennamalli3/backup/yennamalli2/Indigenous_Cow_Genomes/Redcliffe_NGSdata_analysis/kangeyam/kang_mapped_reads/KangayamL1_markdup.bam &&

echo "bcftools view"&&

bcftools view /yennamalli2/Indigenous_Cow_Genomes/Redcliffe_NGSdata_analysis/delly_analysis/KangayamL1.bcf > /yennamalli2/Indigenous_Cow_Genomes/Redcliffe_NGSdata_analysis/delly_analysis/KangayamL1.vcf &&

echo "Calling Copy number variant" &&

delly cnv -g GCF_002263795.3_ARS-UCD2.0_genomic.fna -m tau_map.fa.gz -c KangayamL1_out.cov.gz -o KangayamL1.bcf /yennamalli3/backup/yennamalli2/Indigenous_Cow_Genomes/Redcliffe_NGSdata_analysis/kangeyam/kang_mapped_reads/Kangl1_dedup.bam &&

bcftools view KangayamL1.bcf > KangayamL1.vcf &&

