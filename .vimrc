set nocompatible               " be iMproved
filetype off
syntax on

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
set laststatus=2                " always display status line
set colorcolumn=80
set scrolloff=5               	" keep at least 5 lines above/below
set sidescrolloff=5           	" keep at least 5 lines left/right
set history=1000
set nobackup                    " disable backup files
set noswapfile                  " disable swap files
set undofile
set undodir=~/.vim/undo

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
set ttymouse=xterm2             " enable mouse tracking via xterm
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

nnoremap <F1> :CtrlP .<cr>
nnoremap <F2> :tabprev<cr>
nnoremap <F3> :tabnext<cr>
nnoremap <F4> :tabnew<cr>
nnoremap <F5> :GundoToggle<CR>

" save all when we lost focus
:au FocusLost * silent! wa

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Github:
Bundle 'Blackrush/vim-gocode'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'drmikehenry/vim-headerguard'
Bundle 'ervandew/supertab'
Bundle 'funorpain/vim-cpplint'
Bundle 'justinmk/vim-sneak'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/vitality.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'
Bundle 'majutsushi/tagbar'

" Vim.org:
Bundle 'L9'
Bundle 'taglist.vim'

filetype plugin indent on

let g:ctrlp_max_files = 0 " no limit on number of files
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_always_populate_location_list = 1

" super tab should travers completion list from top to bottom:
let g:SuperTabDefaultCompletionType = "<c-n>"
" fix auto complete menu behaviuour:
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! g:HeaderguardName()
    return substitute(toupper(expand('%')), '[/.]', '_', 'g') . '_'
endfunction
