#!/bin/bash

echo "Breed name:Kangayam" &&

echo "Sample Name: Kangayam43" &&

echo "Adding readgroup into the mapped files" &&
gatk AddOrReplaceReadGroups -I SRR22024843_markdup.bam -O Kangayam43_RG.bam -RGID 9 -RGLB lib9 -RGPL illumina -RGPU unit9 -RGSM Kangayam43 --VALIDATION_STRINGENCY LENIENT &&

samtools index Kangayam43_RG.bam &&

#Calling variants with GATK HaplotypeCaller

echo "Calling Variant:GATK HaplotypeCaller" &&
gatk HaplotypeCaller -R GCF_002263795.3_ARS-UCD2.0_genomic.fna -I Kangayam43_RG.bam -O Kangayam43.vcf --output-mode EMIT_VARIANTS_ONLY --sample-ploidy 2 --native-pair-hmm-threads 8 --minimum-mapping-quality 30 --min-base-quality-score 20 &&

echo "Separate SNPs" &&
gatk SelectVariants -R GCF_002263795.3_ARS-UCD2.0_genomic.fna -V Kangayam43.vcf --select-type-to-include SNP -O Kangayam43_SNPs.vcf &&

echo "Separate INDEL" &&
gatk SelectVariants -R GCF_002263795.3_ARS-UCD2.0_genomic.fna -V Kangayam43.vcf --select-type-to-include INDEL -O Kangayam43_Indels.vcf &&

echo "Filter SNPs based on GATK Best Practices" &&
gatk VariantFiltration -R GCF_002263795.3_ARS-UCD2.0_genomic.fna -V Kangayam43_SNPs.vcf -O Kangayam43_SNPs_filt.vcf --filter-expression "QD < 2.0" --filter-name "LowQD" --filter-expression "FS > 60.0" --filter-name "HighFS" --filter-expression "MQ < 40.0" --filter-name "LowMQ" --filter-expression "SOR > 3.0" --filter-name "HighSOR" --filter-expression "MQRankSum < -12.5" --filter-name "LowMQRankSum" --filter-expression "ReadPosRankSum < -8.0" --filter-name "LowReadPosRankSum" &&

echo "Filter INDEL based on GATK Best Practices" &&
gatk VariantFiltration -R GCF_002263795.3_ARS-UCD2.0_genomic.fna -V Kangayam43_Indels.vcf -O Kangayam43_Indels_filt.vcf --filter-expression "QD < 2.0" --filter-name "LowQD" --filter-expression "FS > 200.0" --filter-name "HighFS" --filter-expression "SOR > 10.0" --filter-name "HighSOR" --filter-expression "ReadPosRankSum < -20.0" --filter-name "LowReadPosRankSum" &&

echo "Select SNP-filtered variants" &&
gatk SelectVariants -R GCF_002263795.3_ARS-UCD2.0_genomic.fna -V Kangayam43_SNPs_filt.vcf --exclude-filtered -O Kangayam43_SNPs_PASS.vcf &&

echo "Select INDEL-filtered variants" &&
gatk SelectVariants -R GCF_002263795.3_ARS-UCD2.0_genomic.fna -V Kangayam43_Indels_filt.vcf --exclude-filtered -O Kangayam43_Indels_PASS.vcf &&

echo "Normalization with bcftools - SNP" &&
bcftools norm -c s -m -any -f GCF_002263795.3_ARS-UCD2.0_genomic.fna Kangayam43_SNPs_PASS.vcf -o Kangayam43_SNPs_norm.vcf &&
 
echo "Normalization with bcftools - INDEL" &&
bcftools norm -c s -m -any -f GCF_002263795.3_ARS-UCD2.0_genomic.fna Kangayam43_Indels_PASS.vcf -o Kangayam43_Indels_norm.vcf &&

echo "Complete the variant calling"