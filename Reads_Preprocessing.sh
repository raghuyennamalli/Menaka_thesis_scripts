#!/bin/bash

#Check the quality of the sequence reads
echo "FastQC:Quality check" &&
fastqc SRR22024843_1.fastqc.gz SRR22024843_2.fastqc.gz &&

#Triming adapter content and low quality bases
echo "Fastp:Improving the quality of reads - .fastg.gz --> clean.fastq.gz" &&
fastp -i SRR22024843.fastq.gz -I SRR22024843_2.fastq.gz -o SRR22024843_clean_R1.fastq.gz -O SRR22024843_clean_R2.fastq.gz --cut_front --cut_tail --cut_mean_quality 20 --qualified_quality_phred 20 --unqualified_percent_limit 30 --length_required 25 --n_base_limit 10 --detect_adapter_for_pe --thread 8 --html SRR22024843_fastp_rpt.html --json SRR22024843_fastp_rpt.json &&

echo "FastQC:Quality check for the cleaned reads" &&
fastqc SRR22024843_clean_R1.fastq.gz SRR22024843_clean_R2.fastq.gz &&

echo "Complete the reads processing"