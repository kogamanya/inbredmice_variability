# Structural and Short Tandem Repeat Variation in Inbred Mice.

This repository comprises of all codes and scripts used to perform the screening of Structural Variation and Short Tandem Repeats among inbred mice of Study SRP199233 and Study ERP011529.

### SRP199233_Lumpy_GRCm39_Analysis.Rmd

This codes contains the Structural Variation analysis of study SRP199233

### SRP199233_Str_Analysis.Rmd

This codes contains the Short Tandem repeats analysis of study SRP199233

### ERP011529_Lumpy_GRCm39_Analysis.Rmd

This codes contains the Structural Variation analysis of study ERP011529

### ERP011529_Str_Analysis.Rmd

This codes contains the Short Tandem repeats analysis of study ERP011529

## run_lumpy.sh

This script contains codes use to run the LUMPY analysis for SV

## ERP_str_res

This folder contains the script of ExpansionHunter Denovo (EHdn) tool, version 0.9.0, with codes used for STR analysis

## How to run the codes

1. Data obtained from a public source

2. For structural variation (SV), the LUMPY Express pipeline is used with VCF as output. The VCF file is read into R with Variant Annotation package and then basic R codes and packages was used for filtering of structural variants base on quality score threshold. 

3. ExpansionHunter Denovo (EHdn) tool, is used to screen for short tandem repeats the output files from the tool is filtered with basic R coding to determine for inter-individual variabilities

## My Details 
* Name: Kingsley Isaac Ogamanya

