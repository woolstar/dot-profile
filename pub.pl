#!/usr/bin/env perl -s

use 5.016 ;

sub pub_alias
{
  open my $SRC, '<', 'alias' or return ;
  open my $SHFILE, '>', 'alias.sh' or die "alias bash" ;
  open my $CSHFILE, '>', 'alias.csh' or die 'alias csh' ;

  while (<$SRC>)
  {
    chomp ;
    my ($nam,$cmd)= split /\t+/ ;
    next unless $nam && $cmd ;

    my $ex ;

    if ( $nam =~ /\.(?<ext>\w+)$/ ) {
      $ex= $+{ext} ;
      $nam =~ s/\.\w+$// ;
    }

    print "$nam, " ;
    $cmd= "'$cmd'" unless $cmd =~ /^['"]/ ;
    say $CSHFILE "alias\t$nam\t$cmd" unless $ex && $ex ne 'csh' ;
    say $SHFILE "alias\t$nam=$cmd" unless $ex && $ex ne 'sh' ;
  }
  say " done."
}

&pub_alias ;
