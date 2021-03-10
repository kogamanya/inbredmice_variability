#!/bin/bash

# this script is designed to identify SV in inbred mice.
# data from input chip-seq samples

set -x

mkdir lumpy
cd lumpy
ln ../*fastq.gz .

PATH=$PATH:/mnt/md0/inbred_models/sw/speedseq/bin

for FQZ1 in *1.fastq.gz ; do

  FQZ2=$(echo $FQZ1 | sed 's/_1/_2/')

  PFX=$(echo $FQZ1 | cut -d '_' -f1)

  BAM=$PFX.bam

  REF=/mnt/md0/inbred_models/ref/Mus_musculus.GRCm38.dna_sm.toplevel.fa

  if [ ! -r $BAM ] ; then

    speedseq align -t 8 -R "@RG\tID:id\tSM:sample\tLB:lib" $REF $FQZ1 $FQZ2
    rename 's/_1.fastq.gz//' *.bam*

  if
done

for DISCORDANTS in *discordants.bam ; do

  PFX=$(echo $DISCORDANTS | cut -d '.' -f1)
  BAMS=$PFX.bam
  SPLITTERS=$PFX.splitters.bam
  lumpyexpress -P -B $BAMS -S $SPLITTERS -D $DISCORDANTS -o $PFX.vcf

done

rm -rf *vcf.*

DISCORDANTS=$(ls *discordants.bam | paste -s -d ',')
SPLITTERS=$(ls *splitters.bam | paste -s -d ',')
BAMS=$(ls *splitters.bam | sed 's/.splitters//' | paste -s -d ',')
lumpyexpress -P -B $BAMS -D $DISCORDANTS -S $SPLITTERS -o lumpy_multisample.vcf

for BAM in $(ls *bam | grep -v discord | grep -v splitter) ; do
  PFX=$(echo $BAM | cut -d '.' -f1)
  svtyper -i lumpy_multisample.vcf  -o ${PFX}_svtyper.vcf  -B $BAM
done
