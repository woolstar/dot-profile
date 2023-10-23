#!/opt/bb/bin/perl -s

  use 5.012 ;

sub find_branch
{
  my ( $txt )= `git status -b` ;
  my ( $branch ) = $txt =~ /On branch (\w+\S*)/ ;

  return $branch ;
}

sub update
{
  system('git checkout master') ;
  system('git pull --rebase') ;
}

# sub dev
# {
#   system("git checkout master") ;
#   system("git push origin master" ) ;
#   system("git checkout dev-master") ;
#   system("git rebase master") ;
#   system("git push origin dev-master" ) ;
#   system("git push up dev-master" ) ;
# } 

sub process
{
  my ($target)= @_ ;

  my $b= find_branch() ;

  die "on same branch as target $b" if $target eq $b ;

  system("git checkout $target") ;
  system("git rebase $b") ;
  system("git checkout $b") ;
  system("git branch -d $target") ;
}

{
  if ( @ARGV ) { for (@ARGV) { process( $_ ) ; } }
  else
  {
    my $b= find_branch() ;
    exit( 0) if $b eq 'master' ;
    update() ;
    process($b) ;
  }
}
