" Vim indent file
" Language:	Arduino
" Maintainer:	Kevin Sjöberg <kev.sjoberg@gmail.com>
" Last Change:	2014 Feb 28

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

let b:indent_block_start='{'
let b:indent_block_end='}'

runtime indent/genindent.vim

set indentexpr=GenericIndent(v:lnum)
