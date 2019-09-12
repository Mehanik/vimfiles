" Maintainer:	Lars H. Nielsen (dengmao@gmail.com)
" Last Change:	January 22 2007

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#2d2d2d
  hi CursorColumn guibg=#2d2d2d
  "hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi MatchParen guifg=NONE guibg=#444444
  hi Pmenu 		guifg=#f6f3e8 guibg=#444444
  hi PmenuSel 	guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor               guifg=Black         guibg=White
hi iCursor              guifg=Black         guibg=White 
hi Normal 		guifg=#f6f3e8 guibg=#242424 gui=bold
hi NonText 		guifg=#808080 guibg=#303030 gui=bold
hi LineNr 		guifg=#857b6f guibg=#000000 gui=bold
hi CursorLineNr	 guibg=#000000 gui=bold
hi StatusLine 	guifg=#f6f3e8 guibg=#444444 gui=italic
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=bold
hi VertSplit 	guifg=#444444 guibg=#444444 gui=bold
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=bold
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=bold
hi SpecialKey	guifg=#808080 guibg=#343434 gui=bold

" Syntax highlighting
hi Comment 		guifg=#99968b gui=italic
hi Todo 		guifg=#8f8f8f gui=italic
hi Constant 	guifg=#e5786d gui=bold
hi String 		guifg=#95e454 gui=italic
hi Identifier 	guifg=#cae682 gui=bold
hi Function 	guifg=#cae682 gui=bold
hi Type 		guifg=#cae682 gui=bold
hi Statement 	guifg=#8ac6f2 gui=bold
hi Keyword		guifg=#8ac6f2 gui=bold
hi PreProc 		guifg=#e5786d gui=bold
hi Number		guifg=#e5786d gui=bold
hi Special		guifg=#e7f6da gui=bold

hi ColorColumn guifg=#f6f3e8 guibg=#303030 gui=bold

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guifg=#808080 guibg=#303030 
hi IndentGuidesEven guifg=#808080 guibg=#303030 

" highlight lines in Sy and vimdiff etc.)
highlight DiffAdd guifg=#009900 guibg=Black
highlight DiffDelete guifg=#bbbb00 guibg=Black
highlight DiffChange guifg=#ff2222 guibg=Black

highlight link GitGutterAdd    DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
