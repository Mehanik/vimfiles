" Vim syntax file
" Language:	Sigrok annotations
" Maintainer:	Eugene Mikhantiev <mikhantiev@gmail.com>
" Last Change:  2018 Aug 29

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
syn case ignore

syn keyword sigrokSpecial operations
syn keyword sigrokLabel	addr

syn keyword sigrokFunction	sequential random read write access

syn keyword sigrokSpecial byte bytes

syn match  sigrokNumber		"\<[0-9a-f]\{2\}\>"
syn match  sigrokNumber		"\<\d\+\>"

syn region  sigrokLineNumber	start="^\d" end="\s"

syn match   sigrokMathsOperator "[<>+\*^/\\=-]"

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link sigrokLabel		Label
hi def link sigrokLineNumber	Comment
hi def link sigrokNumber		Number
hi def link sigrokComment		Comment
hi def link sigrokSpecial		Special
hi def link sigrokTodo		Todo
hi def link sigrokFunction		Identifier
hi def link sigrokTypeSpecifier Type


let b:current_syntax = "sigrok"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
