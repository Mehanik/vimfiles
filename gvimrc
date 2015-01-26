color wombat
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
"autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
":set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands
if has("win32") || has("win16")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10:cDEFAULT
else
 set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

highlight SignColumn guibg=#000000

highlight link SignifySignAdd DiffAdd
highlight link SignifySignChange DiffChange
highlight link SignifySignDelete DiffDelete

" highlight lines in Sy and vimdiff etc.)
highlight DiffAdd guifg=#95e454     guibg=#000000 gui=Bold
highlight DiffDelete guifg=#df5f00  guibg=#000000 gui=Bold
highlight DiffChange guifg=yellow    guibg=#000000 gui=Bold
