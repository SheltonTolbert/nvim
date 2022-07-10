"System dependencies
"brew install lua, ripgrep "

set exrc
set relativenumber
set nu
set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set signcolumn=yes
set hidden

call plug#begin('~/.vim.plugged')
"Telescope" 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Themes"
Plug 'markvincze/panda-vim'
Plug 'mhartington/oceanic-next'
"Syntax Highlighting"
Plug 'elixir-editors/vim-elixir'
"Utils"
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jiaoshijie/undotree'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-fugitive'
"LSP"
Plug 'neovim/nvim-lspconfig'
call plug#end()

syntax on 
filetype plugin indent on
colorscheme OceanicNext

"Modes"
let mapleader = " "

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>
