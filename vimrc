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
set ofu=syntaxcomplete#Complete
set helplang=ru

"set autochdir " always switch to the current file directory
set hidden " you can change buffers without saving
"set autowrite		" Automatically save before commands like :next and :make
"set visualbell
"au FocusLost * :wa

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

"if $COLORTERM == 'gnome-terminal'
"set t_Co=256
"color wombat256
"endif

" Arduino Syntax highlighting
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" SPICE Syntax highlighting
au BufRead,BufNewFile *.cir set filetype=spice
au BufRead,BufNewFile *.mod set filetype=spice

if has("win32") || has("win16")
  set encoding=utf-8
  set fileencodings=utf-8

  " Отображение кириллицы во внутренних сообщениях программы
  lan mes ru_RU.UTF-8

  " Отображение кириллицы в меню
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ru_RU.UTF-8
  source $VIMRUNTIME/menu.vim
endif

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=0
hi IndentGuidesEven ctermbg=0

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1

" Jedi-vim options
let g:jedi#show_call_signatures=0
let g:jedi#popup_on_dot=0
let g:jedi#popup_select_first=0

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

let g:signify_vcs_list = ['hg', 'git']
let g:signify_update_on_bufenter = 0

" quick directory change
nnoremap <leader>cd :cd %:p:h<CR>

" clang
let g:clang_library_path="/usr/lib/llvm-3.4/lib/"

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
