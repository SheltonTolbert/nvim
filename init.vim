"===================================================================================="
"System dependencies
"===================================================================================="

"brew install lua, ripgrep"
"
"i'm relying on a global installation of prettier here. might want to
"reconsider this. maybe we can look for local prettier.rc and default to
"global if needed.
"
"npm install -g prettier

"powerline font:

"brew tap homebrew/cask-fonts &&
"brew install --cask font-<FONT NAME>-nerd-font

"===================================================================================="
"Settings
"===================================================================================="

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
set nospell

"===================================================================================="
"Plugins
"===================================================================================="

call plug#begin('~/.vim.plugged')
"Telescope" 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
"Themes"
Plug 'markvincze/panda-vim'
Plug 'mhartington/oceanic-next'
"Syntax Highlighting"
Plug 'elixir-editors/vim-elixir'
"Utils"
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jiaoshijie/undotree'
Plug 'tpope/vim-fugitive'
"LSP"
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/typescript.nvim'
"File Tree"
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
"Fonts"
Plug 'powerline/powerline-fonts'
"fzf"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Diff Gutter"
Plug 'airblade/vim-gitgutter'
"Spell Check"
Plug 'kamykn/spelunker.vim'
"Prettier"
Plug 'sbdchd/neoformat'
"Elixir Formatter"
Plug 'mhinz/vim-mix-format'
call plug#end()

"===================================================================================="
"Post-Plugin Settings"
"===================================================================================="

syntax on 
filetype plugin indent on
colorscheme OceanicNext

let g:neoformat_try_node_exe = 1

"===================================================================================="
"Key Bindings"
"===================================================================================="

let mapleader = " "

nnoremap <leader>p :Files<CR>
nnoremap <leader>v :vsp<CR>
nnoremap <leader>h :sp<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>


"===================================================================================="
"LSP config"
"===================================================================================="

lua << EOF

local lspconfig = require("lspconfig")
require("ss_swizzle")

EOF

"File tree setup"

lua << EOF

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

EOF

"===================================================================================="
"Auto Commands"
"===================================================================================="
"
autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js Neoformat

autocmd BufWritePost *.ex,*.exs :MixFormat

