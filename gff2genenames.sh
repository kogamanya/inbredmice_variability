#!/bin/bash
awk '$3=="gene"' Mus_musculus.GRCm38.98.gff3 \
| cut -f9 | cut -d ';' -f-2 | cut -d ':' -f2- \
| sed 's/;Name=/\t/'  > Mus_musculus.GRCm38.98.gff3.genenames.tsv



awk '$3=="gene"' Mus_musculus.GRCm39.104.gff3.gz \
| cut -f9 | cut -d ';' -f-2 | cut -d ':' -f2- \
| sed 's/;Name=/\t/'  > Mus_musculus.GRCm39.104.gff3.genenames.tsv
