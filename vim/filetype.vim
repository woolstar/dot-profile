"   __________________________________________
"  /                                          \
" {               Extra File Types             }
"  \__________________________________________/
"

augroup filetypedetect
au BufNewFile,BufRead *.gob     setf gob
au BufNewFile,BufRead *.csc2    setf csc2
augroup END
