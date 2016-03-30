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
    my ($nam,$cmd)= split /\t/ ;
    print "$nam, " ;
    $cmd= "'$cmd'" unless $cmd =~ /^['"]/ ;
    say $CSHFILE "alias\t$nam\t$cmd" ;

    $cmd =~ s/\s+-c// if /ssh-ageng/ ;
    say $SHFILE "alias\t$nam=$cmd" ;
  }
  say " done."
}

&pub_alias ;
