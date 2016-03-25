#!/usr/bin/perl -w

print ".pl fasta_to_be_split number_of_sub_files
"if(@ARGV==0);

$fname = $ARGV[0];
open IN, $ARGV[0] or die;
$dir = $ARGV[0]."._";
mkdir $dir;
$size = $ARGV[1];

$i=0;
$section_count = 0;

while(<IN>)
{
        $section_count ++ if(/>/);
}

close IN;
open IN, $fname or die;

$every=int($section_count/$size);

$count_every=$every;

while(<IN>)
{
        if(/>/)
        {
                $count_every++;
                if($count_every > $every)
                {
                        close OUT;
                        $i++;
                        open OUT, ">$dir/$i.fa";
                        $count_every = 1;
                }
        }
        print OUT $_;
}