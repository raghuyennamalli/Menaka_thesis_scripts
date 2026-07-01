#step 1:
dicey chop GCF_002263795.3_ARS-UCD2.0_genomic.fna
#step 2a:if not use nohup 
bwa mem GCF_002263795.3_ARS-UCD2.0_genomic.fna tau_read1.fq.gz tau_read2.fq.gz | samtools sort -@ 8 -o tau_read_srt.bam -

#step 2b:if use nohup
nohup bash -c 'bwa mem GCF_002263795.3_ARS-UCD2.0_genomic.fna tau_read1.fq.gz tau_read2.fq.gz | samtools sort -@ 8 -o tau_read_srt.bam -' > tau_read.log 2>&1 & --Raise an error:Too many open files

#step2c: Generate bam files
nohup bash -c 'bwa mem GCF_002263795.3_ARS-UCD2.0_genomic.fna tau_read1.fq.gz tau_read2.fq.gz | samtools view -Sb -o tau_read.bam ' > tau_read_srt.log 2>&1 &

#step 3: sorting with samtools with minimum temporary files
nohup samtools sort -@ 8 -m 2G -o tau_read_srt.bam tau_read.bam > tau_read_srt1.log 2>&1 &

#step 3a: indexing the .bam file
samtools index tau_read_srt.bam 

#step 4: Mappability with dicey 
nohup dicey mappability2 tau_read_srt.bam &

#step 5: Compress the map files
gunzip map.fa.gz && bgzip map.fa && samtools faidx map.fa.gz 

