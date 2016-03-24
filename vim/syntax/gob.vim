"   __________________________________________
"  /                                          \
" {         GObject Syntax Highlighting        }
"  \__________________________________________/
"

" Base this on C
runtime! syntax/c.vim

syntax keyword gobStructure         class
syntax keyword gobType              property INT BOOLEAN STRING
syntax keyword gobAccess            private public property

highlight link gobAccess            Statement
highlight link gobType              Type
highlight link gobStructure         Structure
