execute pathogen#infect()
call pathogen#helptags()

" Make Vim more useful
set nocompatible  " We don't want vi compatibility.

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Set color scheme!¬
colorscheme neon

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

filetype plugin on

" turn on line numbering
set number

" turn on our statusline.
set statusline=[%n]\ %<" Buffer number, truncate here if too long.
set statusline+=%F\ \ \ " Path to the file
set statusline+=[%M%R%H%W%Y]" File Modified flag|Readonly flag|Help buffer flag|Preview window flag|Type of file in the buffer
set statusline+=[%{&ff}]\ \ "
set statusline+=%=\ " Switch to the right side
set statusline+=line:%l/%L\ " Current line/Total Lines
set statusline+=col:%c\ \ \ " Current column
set statusline+=%p%%\ \ \ " Precentage thought file
set statusline+=@%{strftime(\"%H:%M:%S\")} "Time in hours:minutes:seconds.

set laststatus=2
  
