" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time

" modelines have historically been a source of security/resource
" vulnerabilities -- disable by default, even when 'nocompatible' is set
set nomodeline

execute pathogen#infect()
"
" Enable matchit macros
runtime macros/matchit.vim

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.hex,.eep,.elf

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch
set mouse=a		" Enable mouse usage (all modes)
nnoremap <leader><space> :noh<cr>

"set cursorcolumn " highlight the current column
"set cursorline " highlight current line
set smartindent
set cindent
set cinoptions=g1,h1,N-s,(0,W4,l1
set expandtab
set smarttab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set nu!
"set ofu=syntaxcomplete#Complete
set helplang=en

"set autochdir " always switch to the current file directory
set hidden " you can change buffers without saving
"set autowrite		" Automatically save before commands like :next and :make
"set visualbell
"au FocusLost * :wa
"
set t_Co=256
color wombat256

if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=0
endif

if !has("gui_running")
  hi Pmenu      ctermfg=10 ctermbg=Darkgray cterm=None
  hi PmenuSel   ctermfg=White   ctermbg=Darkgray cterm=Bold
  hi PmenuSbar  ctermbg=Cyan    guibg=Cyan
  hi PmenuThumb ctermfg=White   guifg=White
endif

" Arduino Syntax highlighting
augroup filetypedetect
  au BufRead,BufNewFile *.pde set filetype=arduino
  au BufRead,BufNewFile *.ino set filetype=arduino
augroup END

" SPICE Syntax highlighting
augroup filetypedetect
  au BufRead,BufNewFile *.cir set filetype=spice
  au BufRead,BufNewFile *.mod set filetype=spice
augroup END

if has("win32") || has("win16")
  set encoding=utf-8
  set fileencodings=utf-8

  " Отображение кириллицы во внутренних сообщениях программы
  lan mes ru_RU.UTF-8

  " Отображение кириллицы в меню
  source $VIMRUNTIME/delmenu.vim
  set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
  source $VIMRUNTIME/menu.vim
endif

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=0
hi IndentGuidesEven ctermbg=0

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1

" Always show statusline
if has("gui_running")
  let g:airline_powerline_fonts = 1
endif
set laststatus=2
set noshowmode
set ttimeout
set ttimeoutlen=50

if has("win32") || has("win16")
  set noswapfile
endif

" quick directory change
nnoremap <leader>cd :cd %:p:h<CR>

" Easy-align
let g:easy_align_delimiters = {
      \ '>': { 'pattern': '>>\|=>\|>' },
      \ '/': { 'pattern': '//\+\|/\*\|\*/', 'ignore_groups': ['String'], 'ignore_unmatched': 0 },
      \ '#': { 'pattern': '#\+', 'ignore_groups': ['String'], 'delimiter_align': 'l', 'ignore_unmatched': 0 },
      \ ']': {
      \     'pattern':       '[[\]]',
      \     'left_margin':   0,
      \     'right_margin':  0,
      \     'stick_to_left': 0
      \   },
      \ ')': {
      \     'pattern':       '[()]',
      \     'left_margin':   0,
      \     'right_margin':  0,
      \     'stick_to_left': 0
      \   },
      \ 'd': {
      \     'pattern': ' \(\S\+\s*[;=]\)\@=',
      \     'left_margin': 0,
      \     'right_margin': 0
      \   }
      \ }

" Start interactive EasyAlign with a Vim movement
vmap <Leader>a <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

"au FileType python setl shiftwidth=2 tabstop=2

" YCM
let g:ycm_key_list_select_completion=['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']
nnoremap <C-]> :YcmCompleter GoTo<CR>
let g:ycm_extra_conf_globlist=['C:\eugene\splitted_projects\*']
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_show_diagnostics_ui=1
let g:ycm_enable_diagnostic_signs=0
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_auto_trigger=1
let g:ycm_max_diagnostics_to_display = 300

" Unisnip
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Completion menu options
set completeopt=longest,menuone

" wildmenu
set wildmenu
set wildmode=list:longest,full

"CamelCaseMotion
call camelcasemotion#CreateMotionMappings('<leader>')

"vim-session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
set sessionoptions+=resize,winpos

" Automatically removing all trailing whitespace
 autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e

" GitGutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=250

" Disable automatically commetn insertion
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
