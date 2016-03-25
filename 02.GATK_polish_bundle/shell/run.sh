#run_gatk.sh

fastq1=../input/fastq1
fastq2=../input/fastq2

REF=`ls ../input/*`

#step1 mapping
bowtie2  \
 -x $REF \
 -1 $fastq1 \
 -2 $fastq2 \


#step2 polishing

samtools view -bS $REF.bowtie2.sam >$REF.bowtie2.bam

java -jar ../bin/picard.jar CreateSequenceDictionary REFERENCE=$REF OUTPUT=$REF.dict

java -Xmx50g -jar ../bin/picard.jar SortSam I=$REF.bowtie2.bam O=$REF.bowtie2.picard_sort.bam SO=coordinate
java -Xmx50g -jar ../bin/picard.jar MarkDuplicates I=$REF.bowtie2.picard_sort.bam  O=$REF.bowtie2.picard_sort.dedup.bam METRICS_FILE=metrics.txt MAX_FILE_HANDLES=1000
java -Xmx50g -jar ../bin/picard.jar AddOrReplaceReadGroups I=$REF.bowtie2.picard_sort.dedup.bam  O=$REF.bowtie2.picard_sort.dedup.addrgp.bam  RGID=group1 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=sample1


BAM=$REF.bowtie2.picard_sort.dedup.addrgp.bam

java -Xmx50g -jar ../bin/picard.jar BuildBamIndex INPUT=$BAM

samtools faidx concatenated.fasta

java -Xmx50g -jar ../bin/GenomeAnalysisTK.jar -R $REF -T HaplotypeCaller -I $BAM -o $REF.gatk.haplo.vcf
java -Xmx50g -jar ../bin/GenomeAnalysisTK.jar -R $REF -T FastaAlternateReferenceMaker -o $REF.gatk.haplo.fa --variant $REF.gatk.haplo.vcf

mkdir ../output
mv $REF.gatk.haplo.fa ../output/
