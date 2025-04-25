" An example for a gvimrc file.
" The commands in this are executed when the GUI is started, after the vimrc
" has been executed.
"
" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	2023 Aug 10
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>
"
" To use it, copy it to
"         for Unix:  ~/.gvimrc
"        for Amiga:  s:.gvimrc
"   for MS-Windows:  $VIM\_gvimrc
"        for Haiku:  ~/config/settings/vim/gvimrc
"      for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  highlight Normal guibg=grey90
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
  highlight NonText guibg=grey80
  highlight Constant gui=NONE guibg=grey95
  highlight Special gui=NONE guibg=grey95

endif

" Vim behaviour
set gcr=n:blinkon0 				" Turn off the blinking cursor in normal mode
set hidden         				" hide buffers instead of closing them
set nowrap         				" don't wrap lines
set showmatch     				" set show matching parenthesis
"set ignorecase    				" ignore case when searching
"set smartcase     				" ignore case if search pattern is all lowercase,
                  				"    case-sensitive otherwise
"set smarttab     		 		" insert tabs on the start of a line according to
                    			"    shiftwidth, not tabstop
set hlsearch      				" highlight search terms
set incsearch    				" show search matches as you type
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set clipboard=unnamed			" Use the OS clipboard by default (on versions compiled with `+clipboard`)
"set autoindent    				" always set autoindenting on
"set copyindent    				" copy the previous indentation on autoindenting
"set tabstop=4     				" a tab is four spaces
"set shiftwidth=4  				" number of spaces to use for autoindenting
"set shiftround    				" use multiple of shiftwidth when indenting with '<' and '>'
set visualbell           		" don't beep
set noerrorbells         		" don't beep
set nofoldenable  				" dont fold by default

set pastetoggle=<F2>

filetype plugin indent on

" turn on line numbering
set number
set ruler

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" To work with  Catppuccin for Vim theme
set termguicolors

" Set color scheme!¬
"set background=light
colorscheme catppuccin_latte
"set transparency=15

if has("gui_macvim")
    "set transparency=15
    set guifont=Inconsolata:h15
    set antialias
endif

" turn on our statusline.
"set statusline=[%n]\ %<" Buffer number, truncate here if too long.
"set statusline+=%F\ \ \ " Path to the file
"set statusline+=[%M%R%H%W%Y]" File Modified flag|Readonly flag|Help buffer flag|Preview window flag|Type of file in the buffer
"set statusline+=[%{&ff}]\ \ "
"set statusline+=%=\ " Switch to the right side
"set statusline+=line:%l/%L\ " Current line/Total Lines
"set statusline+=col:%c\ \ \ " Current column
"set statusline+=%p%%\ \ \ " Precentage thought file
"set statusline+=@%{strftime(\"%H:%M:%S\")} "Time in hours:minutes:seconds.

set laststatus=2