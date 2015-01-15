" Make Vim more useful
set nocompatible  " We don't want vi compatibility.

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Set color scheme!¬
colorscheme candy

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
        set undodir=~/.vim/undo
endif

set viminfo+=! " make sure vim history works

" Disable error bells
set noerrorbells

set modelines=0

execute pathogen#infect()

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
