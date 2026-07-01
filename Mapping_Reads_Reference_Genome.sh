#!/bin/bash

echo "Breed name:Kangayam" &&

echo "Mapping with taurine reference genome using Bwa-mem: clean.fastq.gz --> .bam " &&
bwa mem -t 64 GCF_002263795.3_ARS-UCD2.0_genomic.fna SRR22024843_clean_R1.fastq.gz SRR22024843_clean_R2.fastq.gz | samtools view -Sb -o SRR22024843.bam &&

echo "Alignment Statistics..." &&
samtools stats SRR22024843.bam > SRR22024843_stats.txt &&

echo "Running Post-Alignment Processing:... " &&

echo "Sorting by name..." &&
samtools sort -n -o SRR22024843_sort.bam SRR22024843.bam &&

echo "Fixing mate information..." &&
samtools fixmate -rpcmu SRR22024843_sort.bam SRR22024843_fixmate.bam &&

echo "Sorting by coordinate..." &&
samtools sort -o SRR22024843_fixmate_sort.bam SRR22024843_fixmate.bam &&

echo "Indexing BAM file..." &&
samtools index SRR22024843_fixmate_sort.bam &&

echo "Marking duplicates and removing duplicates" &&
samtools markdup -s SRR22024843_fixmate_sort.bam SRR22024843_markdup.bam &&

echo "Indexing dedup_BAM file..." &&
samtools index SRR22024843_markdup.bam &&

echo "Post-Alignment Statistics..." &&
samtools stats SRR22024843_markdup.bam > SRR22024843_markdup_stats.txt &&

echo "Completed the mapping reads with reference genome"