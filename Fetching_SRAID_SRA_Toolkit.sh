!/bin/bash

echo "Breed name:Kangayam" &&

echo "Sample SRA ID:SRR22024843" &&

echo "Prefetching SRR22024843"&&
prefetch SRR22024843 --max-size 30G &&

#Set the path to dump the fastqc file
cd /home/ragothaman/cattle_genomics/Gir_Kangayam_Variant/Kangayam &&

echo "Fastq-dump:SRA --> .fastqc.gz" &&
fastq-dump --split-files --gzip /home/ragothaman/cattle_genomics/Gir_Kangayam_Variant/data1/sra_temp/sra/SRR22024843.sra &&

echo "Completed fetching"