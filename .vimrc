syntax on
filetype plugin indent on

set relativenumber

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

set showmatch                   " Show matching brackets.
set ruler                       " show the line number on the bar
set backspace=indent,eol,start 	" Enable backspacing over selected things
set nocompatible              	" vim, not vi
set scrolloff=5               	" keep at least 5 lines above/below
set sidescrolloff=5           	" keep at least 5 lines left/right
set history=1000                 " remember last 200 items
set nobackup                    " disable backup files
set noswapfile                  " disable swap files

set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set expandtab                   " expand <Tab>s with spaces; death to tabs!
set shiftwidth=2                " spaces for each step of (auto)indent
set softtabstop=2               " set virtual tab stop
set tabstop=2                   " render existing tabs as if spaces

set hlsearch                    " highlight current search
set incsearch                   " incremental search
set ignorecase                  " ignore case when searching
set smartcase                   " unless a capital letter is used
set ff=unix                     " end lines unix-style

" Turn off annoying error bells:
set noerrorbells
set visualbell
set t_vb=

if has("gui_running")
  " disable gui toolbars
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l  "remove left-hand scroll bar
  set guioptions-=L  "remove left hand scroll bar when in vsplit
  set guioptions+=c  "Using Vim warning style in gVim: http://stackoverflow.com/questions/4193654/using-vim-warning-style-in-gvim
  set guioptions-=e  "gui tabs rendered the same way as console tabs!
endif

if has("win32")
  set gfn=Lucida_Console:h12
elseif has("mac")
  set gfn=Menlo\ Regular:h14
endif

" make it easy to type vim commands (without need to press shift)
nnoremap ; :

" make it easy to switch tabs with left and right arrows in normal mode
nnoremap <left> :tabprev<cr>
nnoremap <right> :tabnext<cr>

" make it easy to edit vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" map jk as esc since its easier to reach
inoremap jk <esc>
inoremap <esc> <nop>
call pathogen#infect()
colorscheme solarized
set background=dark
