" auto indent
" auto write
" dark backgrounds
" shift 2, tab 8
" no-remap keys (for , -> ; | ; -> :)
set ai aw bg=dark sw=2 ts=8 noremap
set nobackup
syntax on
" kludge delete key
set t_kD=
" disable autoindent
set cinkeys=
" mouse just for jump/not select
set mouse=c
" shortcuts
map ; :
map , ;
map * :e#
map \i :set ai
map \I :set noai
map \y :set noai wm=24 
map  ZZ
map  ZZ
map  :w
map # :set sw=8 ts=8
