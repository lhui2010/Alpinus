#Alpinus: A Genome Metaassembly & Polish Pipeline
=============================


##How does Alpinus work
------------------------------
1. Alpinus calls minimus2 to perform meta-assembly of existing assemblies
2. Alpinus calls Bowtie2 and GATK to polish meta-assembly result


##Using Alpinus
------------------------------
###Prerequisites
1. AMOS (>=3.0.1)(Meta-assembly step)
2. GATK (copy jar file to 02.GATK_polish_bundle/bin)
3. Bowtie2 
4. Picard (copy jar file to 02.GATK_polish_bundle/bin)
5. Samtools

###Run
1. Copy or link your contigs to 01.Minimus_merge_bundle/input
2. Replace fastq1, fastq2 in 02.GATK_polish_bundle/shell/run.sh with fastq files for polishing
2. Run Alpinus_run.sh
3. Fetch results in 02.GATK_polish_bundle/output

###Cautious
Alpha version of Alpinus was not tested :)


Change Log
——————————————————————————————————
03.25 Packaging Pipeline v0.1 alpha


