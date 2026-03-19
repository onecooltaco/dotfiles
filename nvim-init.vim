" ================================
" Basic Settings
" ================================

" Clipboard integration
set clipboard=unnamedplus   " using system clipboard

" Completion menu behavior
set completeopt=noinsert,menuone,noselect

" Visual enhancements
set cc=80                   " set an 80 column border for good coding style
set cursorline              " Highlight current line
set number                  " Show line numbers
set title                   " Show file title in terminal

" Editing behavior
set autoindent              " Auto-indent new lines
" set backupdir=~/.cache/vim " Directory to store backup files.
set hidden                  " Allow switching buffers without saving
set hlsearch                " highlight search 
set ignorecase              " case insensitiv
set inccommand=split        " Show live preview of substitutions
" set incsearch               " incremental search
set mouse=a                 " Enable mouse support
set nocompatible            " disable compatibility to old-time vi
" set noswapfile            " disable creating swap file
set showmatch               " show matching 

" Window behavior
set splitbelow splitright   " More natural split directions

" Performance
set ttyfast                 " Faster scrolling

" File type detection
filetype plugin indent on
syntax on

" Interface enhancements
set wildmenu               " Enhanced command completion
" set wildmode=longest,list   " get bash-like tab completions 
" set spell                  " Enable spell checking

" ================================
" Plugin Management
" ================================

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Color scheme
Plug 'catppuccin/nvim', { 'branch': 'vim', 'as': 'catppuccin' }

" Status line and interface
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'

" File management
Plug 'scrooloose/nerdtree'

" Code editing
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'

" Code intelligence
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git integration
Plug 'tpope/vim-fugitive'

call plug#end()

" ================================
" Plugin Configuration
" ================================

" Color scheme
colorscheme catppuccin-nvim " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd.colorscheme "catppuccin-nvim"

" NERDTree configuration
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
