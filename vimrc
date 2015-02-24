" This must be first, because it changes other options as side effect
set nocompatible  " We don't want vi compatibility.

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
execute pathogen#infect()
call pathogen#helptags()

" Vim behaviour

" Optimize for fast terminal connections
set ttyfast


" change the mapleader from \ to ,
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
        set undodir=~/.vim/undo
endif

set viminfo+=! " make sure vim history works

set modelines=0

filetype plugin on

