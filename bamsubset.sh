#!/bin/bash

cut -f-3 vardf.tsv | sed 1d \
| awk '{OFS="\t"} {print $1,$2-10000,$3+10000}' > vardf.bed

for BAM in $(find bam | grep ".bam$" | grep -v subset ) ; do
  NAME=$(echo $BAM | sed 's/.bam/_subset.bam/')
  samtools view -h $BAM -L vardf.bed | samtools view -uSh - | samtools sort -o $NAME -
  samtools index $NAME
done
