
setenv CPU `arch`

if ( $?prompt ) then
  source ~/.alias
  set prompt=`hostname`'% '
endif

