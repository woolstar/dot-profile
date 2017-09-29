#!/usr/bin/perl -s

	use 5.012 ;

{
	my ($dest) = @ARGV ;

	my $FOUT ;
	if ( $dest ) { open $FOUT, '>', $dest || die "unable to open $dest" }
		else { $FOUT= *STDOUT }
	for ( map { m{([^/]++)/} }
			grep { !/automatic/ }
			grep { /installed/ }
			grep { m{.[^/]/\S} }
			split /\s*\n/, `apt list 2>/dev/null` ) { say $FOUT $_ }
}

