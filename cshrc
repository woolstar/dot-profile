
setenv CPU `arch`

if ( $?prompt ) then
  source ~/.alias.csh
  set prompt=`hostname`'% '
endif

