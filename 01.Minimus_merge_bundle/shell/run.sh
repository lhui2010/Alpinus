
PARTITION=10

INPUT=../input/input_contig.fa

perl ../bin/format_name.pl ../input/* >$INPUT

perl ../bin/split_fasta.pl $INPUT $PARTITION


for i in ${INPUT}._/*.fa;
 do
	 nucmer -p $i $i ${INPUT} 
 done
 
toAmos -s ${INPUT} -o ../input/concatenated.afg
minimus2  ../input/concatenated |tee out.log

mkdir ../output/
mv ../input/concatenated.fasta ../output/
