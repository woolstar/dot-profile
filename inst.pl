#!/usr/bin/perl -s

	use 5.012 ;

{
	my ($dest) = @ARGV ;

	my $FOUT ;
	if ( $dest ) { open $FOUT, '>', $dest || die "unable to open $dest" }
		else { $FOUT= *STDOUT }

	my $uname= `uname` ;
	if ( $uname =~ /CYGWIN/ )
	{
		for ( map { /^(\S+)/ } 
			grep { /^\S++\s++\S++\s++OK$/ }
			split /\s*\n/, `cygcheck -c` ) { say $FOUT $_ }
	}
	else
	{
		for ( map { m{([^/]++)/} }
			grep { !/automatic/ }
			grep { /installed/ }
			grep { m{.[^/]/\S} }
			split /\s*\n/, `apt list 2>/dev/null` ) { say $FOUT $_ }
	}
}

