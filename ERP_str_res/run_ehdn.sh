#!/bin/bash

REF=../../ref/Mus_musculus.GRCm39.dna_sm.toplevel.fa

for BAM in $(ls *bam | egrep -v '(dis|split)') ; do

  BASE=$(echo $BAM | sed 's/.bam//')

  ExpansionHunterDenovo profile --reads $BAM \
  --reference $REF \
  --output-prefix $BASE --min-anchor-mapq 50 --max-irr-mapq 40

done

ExpansionHunterDenovo merge \
  --reference $REF \
  --manifest manifest.tsv \
  --output-prefix ERP011529_merge

casecontrol.py locus \
  --manifest manifest.tsv \
  --multisample-profile ERP011529_merge.multisample_profile.json \
  --output ERP011529_dataset.casecontrol_locus.tsv

outlier.py locus \
        --manifest manifest.tsv \
        --multisample-profile ERP011529_merge.multisample_profile.json \
        --output ERP011529_merge.outlier_locus.tsv
