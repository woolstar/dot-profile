"------------------------------------------------------------------------------
" $Id: csc2.vim 1568 2013-04-08 09:47:52Z cteubner $
" $URL: svn+ssh://devsvn/package-management/trunk/vim/plugin/syntax/csc2.vim $
"------------------------------------------------------------------------------
" 
" VIM Plugin for BPKG
"
" .csc2 syntax highlighting
"
"------------------------------------------------------------------------------

if exists("b:current_syntax")
    finish
endif

syntax match csc2Comment "//.*$" oneline
syntax region csc2String start='"' end='"'
syntax region csc2Size start='\[' end='\]'

syntax keyword csc2DataTypes 
      \ cstring int longlong vutf8 blob 
      \ u_short u_int u_longlong
      \ float double byte
      \ datetime intervalym intervalds
      \ decimal32 decimal64 decimal128

syntax keyword csc2Keywords
      \ tag keys constraints

syntax keyword csc2Modifiers
      \ dup DESCEND ASCEND null dbpad dbstore dbload

highlight link csc2Comment Comment
highlight link csc2String String
highlight link csc2Size Number
highlight link csc2DataTypes Identifier
highlight link csc2Keywords Keyword
highlight link csc2Modifiers Type

" Match section names - which begin with a full stop and must be UPPERCASE
" (can include underscores).  pkgcfgBadSectionName is for use in unrecognised
" sections so we can highlight them as errors.
"syntax match csc2SectionName "^\s*\.[A-Z_]\+\>" oneline contained
"syntax match csc2BadSectionName "^\s*\.[A-Z_]\+\>" oneline contained

" Recognise any generic section.  This must come before the rules for the
" sections that we do recgonise, as that is how vim works.
" Note that all section rules use 'me=s-1' for the end match, so that the next
" section name doesn't get swallowed.
"syntax region csc2UnknownSection
"    \ start="\v^\s*\.[A-Z_]+.*$"
"    \ end="^\s*\.[A-Z]"me=s-1 
"    \ contains=csc2BadSectionName,csc2Comment


" syntax region csc2TagLine
"    \ start="^\s*tag\>"
"    \ end ="$"
"    \ oneline
"    \ contains=csc2TagName

"syntax keyword csc2TagName ondisk contained
"
"syntax region csc2Keys
"    \ start="^\s*keys\>"
"    \ end ="$"
"    \ oneline contained
"
"syntax region csc2Constraints
"    \ start="^\s*constraints\>"
"    \ end ="$"
"    \ oneline contained
"
"
""highlight link csc2SectionName Type
""highlight link csc2BadSectionName Error
"
"highlight link csc2TagLine Statement
"highlight link csc2TagName Identifier
"
"highlight link csc2Keys Statement
"highlight link csc2Constraints Statement

let b:current_syntax = "csc2"
