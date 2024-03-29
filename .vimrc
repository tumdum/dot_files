set nocompatible               " be iMproved
filetype off

set shell=/bin/bash

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" Github:
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'drmikehenry/vim-headerguard'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'wlangstroth/vim-racket'
Plugin 'easymotion/vim-easymotion'
" == Go
Plugin 'fatih/vim-go'
" == Clojure
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-surround'
" == Rust
Plugin 'rust-lang/rust.vim'
" == Lisp
Plugin 'kovisoft/slimv'

" Vim.org:
Plugin 'L9'
Plugin 'Mark'
" == Clojure
Plugin 'paredit.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

let g:mapleader = ","

filetype plugin indent on
syntax on

set relativenumber
set number

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
" make it easy to switch tabs with left and right arrows in normal mode
nnoremap <left> :tabprev<cr>
nnoremap <right> :tabnext<cr>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" navigate splits
nnoremap <c-up> <c-w>k
nnoremap <c-down> <c-w>j
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l

nnoremap j gj
nnoremap k gk

set showmatch                   " Show matching brackets.
set ruler                       " show the line number on the bar
set backspace=indent,eol,start 	" Enable backspacing over selected things
set laststatus=2                " always display status line
set colorcolumn=80
set scrolloff=5               	" keep at least 5 lines above/below
set sidescrolloff=5           	" keep at least 5 lines left/right
set history=1000
set nobackup                    " disable backup files
set noswapfile                  " disable swap files
set undofile
set undodir=~/.vim/undo

set nowrap                      " dont wrap lines
set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set expandtab                   " expand <Tab>s with spaces; death to tabs!
set shiftwidth=4                " spaces for each step of (auto)indent
set softtabstop=4               " set virtual tab stop
set tabstop=4                   " render existing tabs as if spaces

set hlsearch                    " highlight current search
set incsearch                   " incremental search
set ignorecase                  " ignore case when searching
set smartcase                   " unless a capital letter is used
set mouse=a                     " enable mousek
if !has('nvim')
    set ttymouse=xterm2             " enable mouse tracking via xterm
endif
set ff=unix                     " end lines unix-style

" Turn off annoying error bells:
set noerrorbells
set visualbell
set t_vb=

colorscheme desert
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

set listchars=trail:·,precedes:«,extends:»,tab:▸▸

set gfn=Go\ Mono\ 12
if has("win32")
  set gfn=Lucida_Console:h12
elseif has("mac")
  set gfn=Menlo\ Regular:h14
endif

" make it easy to type vim commands (without need to press shift)
nnoremap ; :

" make it easy to edit vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" map jk as esc since its easier to reach
inoremap jk <esc>
inoremap hh <esc>
inoremap <esc> <nop>
if has('nvim')
    tnoremap jj <C-\><C-n>          " exit terminal mode 
endif

nnoremap <F1> :CtrlP .<cr>
nnoremap <F2> :tabprev<cr>
nnoremap <F3> :tabnext<cr>
nnoremap <F4> :tabnew<cr>
nnoremap <F5> :GundoToggle<CR>

" save all when we lost focus
:au FocusLost * silent! wa

" Search for test that contains '/' wihout escaping it, taken from
" http://vim.wikia.com/wiki/Searching_for_expressions_which_include_slashes
command! -nargs=1 Ss let @/ = escape(<q-args>, '/')|normal! /<C-R>/<CR>

function! g:HeaderguardName()
    return substitute(toupper(expand('%')), '[/.]', '_', 'g') . '_'
endfunction

function! g:HeaderguardLine3()
    return '#endif  // ' . g:HeaderguardName()
endfunction

let g:paredit_leader = '\'

let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwDefaultHighlightingNum = 20

let g:simple_bookmarks_filename = ''

if executable('rg')
    set grepprg=rg\ --vimgrep
else
    set grepprg=grep\ -srnI
endif

" make it easy to type vim commands (without need to press shift)
nnoremap s :

" make it easy to switch tabs with left and right arrows in normal mode
" nnoremap <left> :tabprev<cr>
" nnoremap <right> :tabnext<cr>

nnoremap <a-h> :tabnext<cr>
nnoremap <a-t> :tabprev<cr>

" navigate splits
" c-h produces in terminals backspace...
nnoremap <bs> <c-w>j
nnoremap <c-t> <c-w>k
nnoremap <c-n> <c-w>l
nnoremap <c-d> <c-w>h

" dvorak ...
noremap d h
noremap h j
noremap t k
noremap n l

nnoremap ee dd
nnoremap m n
