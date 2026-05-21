----------------------------------------------------
-- Basic Settings
----------------------------------------------------

-- Clipboard integration
vim.o.clipboard = "unnamedplus"      -- using system clipboard

-- Completion menu behavior
vim.o.completeopt = "noinsert,menuone,noselect"

-- Visual enhancements
vim.o.cc = "80"                      -- set an 80 column border for good coding style
vim.o.cursorline = true              -- Highlight current line
vim.o.number = true                  -- Show line numbers
vim.o.title = true                   -- Show file title in terminal

-- Editing behavior
vim.o.autoindent = true              -- Auto-indent new lines
-- vim.o.backupdir = "~/.cache/vim"  -- Directory to store backup files.
vim.o.hidden = true                  -- Allow switching buffers without saving
vim.o.hlsearch = true                -- highlight search 
vim.o.ignorecase = true              -- case insensitiv
vim.o.inccommand = "split"           -- Show live preview of substitutions
-- vim.o.incsearch = true            -- incremental search
vim.o.mouse = "a"                    -- Enable mouse support
vim.o.compatible = false             -- disable compatibility to old-time vi
-- vim.o.swapfile = false            -- disable creating swap file
vim.o.showmatch = true               -- show matching 

-- Window behavior
vim.o.splitbelow = true              -- More natural split directions
vim.o.splitright = true

-- Performance
vim.o.ttyfast = true                 -- Faster scrolling

-- Syntax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- Interface enhancements
vim.o.wildmenu = true                -- Enhanced command completion
-- vim.o.wildmode = "longest,list"   -- get bash-like tab completions 
-- vim.o.spell = true                -- Enable spell checking

----------------------------------------------------
-- Plugin Management
----------------------------------------------------

vim.pack.add({
  -- Color scheme
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  -- Status line and interface
  'https://github.com/ryanoasis/vim-devicons',
  'https://github.com/mhinz/vim-startify',
  -- File management
--  'https://github.com/scrooloose/nerdtree',
  -- Code editing
--  'https://github.com/scrooloose/nerdcommenter',
  'https://github.com/sheerun/vim-polyglot',
  -- Git integration
  'https://github.com/tpope/vim-fugitive',
  -- Code intelligence
  {
    src = 'https://github.com/neoclide/coc.nvim',
    version = 'release',
  },
})

----------------------------------------------------
-- Plugin Configuration
----------------------------------------------------

-- Color scheme
vim.cmd.colorscheme "catppuccin-nvim" --  catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha