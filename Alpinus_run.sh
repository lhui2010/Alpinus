bash 01.Minimus_merge_bundle/shell/run.sh
echo "Genome Merge Finished!
Find results in 01.Minimus_merge_bundle/output/"

ln -s 01.Minimus_merge_bundle/output/concatenated.fasta 02.GATK_polish_bundle/input/concatenated.fasta
bash 02.GATK_polish_bundle/shell/run.sh
echo "Job Done
Find polished assebmly in 02.GATK_polish_bundle/output/"
