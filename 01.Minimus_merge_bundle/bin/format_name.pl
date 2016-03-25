
my $trail = 1;
while(<>)
{
		if (substr($_,0,1) eq ">")
		{
				print ">$trail\n";
				$trail ++;
		}
		else
		{
				print;
		}
}
