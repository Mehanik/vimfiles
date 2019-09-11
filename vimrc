" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor
set history=500		" keep 500 lines of command line history
"set ruler		" show the cursor position all the time

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
"set background=dark

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
set helplang=en

"set autochdir " always switch to the current file directory
set hidden " you can change buffers without saving
"set autowrite		" Automatically save before commands like :next and :make
"set visualbell
"au FocusLost * :wa
"

if !has("gui_running")
  set t_Co=256
  color wombat256
  hi Pmenu      ctermfg=10 ctermbg=Darkgray cterm=None
  hi PmenuSel   ctermfg=White   ctermbg=Darkgray cterm=Bold
  hi PmenuSbar  ctermbg=Cyan    guibg=Cyan
  hi PmenuThumb ctermfg=White   guifg=White
else
  color wombat
endif

if exists('+colorcolumn')
  set colorcolumn=120
  highlight ColorColumn ctermbg=236
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
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=236
highlight SignColumn guibg=#000000

" highlight
highlight SignColumn ctermbg=16

highlight link SignifySignAdd DiffAdd
highlight link SignifySignChange DiffChange
highlight link SignifySignDelete DiffDelete

" highlight lines in Sy and vimdiff etc.)
highlight DiffAdd ctermbg=34
highlight DiffDelete ctermbg=196
highlight DiffChange ctermbg=220
"

highlight link SignifySignAdd DiffAdd
highlight link SignifySignChange DiffChange
highlight link SignifySignDelete DiffDelete

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1

" Always show statusline
"if has("gui_running")
let g:airline_powerline_fonts = 1
"endif
set laststatus=2
set noshowmode
set ttimeout
set ttimeoutlen=50

if has("win32") || has("win16")
  set noswapfile
endif

" quick directory change
nnoremap <leader>cd :cd %:p:h<CR>

"au FileType python setl shiftwidth=2 tabstop=2

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
autocmd FileType c,cpp,java,php,arduino,python autocmd BufWritePre <buffer> %s/\s\+$//e

" Disable automatically commetn insertion
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" C++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let c_no_curly_error = 1

" Vim autoformat
let g:autoformat_remove_trailing_spaces = 0
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:formatters_python = ['yapf']

" YCM
let g:ycm_use_ultisnips_completer = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string


" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['yapf']
let g:ale_set_highlights = 0
" workaround for cursor disappear
let g:ale_echo_cursor = 0

"NERDcommenter
let NERDDefaultAlign="left"

" highlight a word with * without moving cursor
nnoremap * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>

" scroll offset
set scrolloff=10

" turn relative line numbers on 
set relativenumber

