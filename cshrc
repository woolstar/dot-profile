
setenv CPU `arch`

setenv PREFIX ''
setenv PROJ "~/proj"
setenv SSHKEY "~/.ssh/id_rsa"

if ( $?prompt ) then
  source ~/.alias.csh
  set prompt=`hostname`'% '
endif

