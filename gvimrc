" Vim behaviour
set gcr=n:blinkon0 " Turn off the blinking cursor in normal mode
set hidden         " hide buffers instead of closing them
set nowrap         " don't wrap lines
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set clipboard=unnamed
                  " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set pastetoggle=<F2>

filetype plugin indent on

" turn on line numbering
set number
set ruler

" Set color scheme!¬
colorscheme hemisu
set background=light

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
