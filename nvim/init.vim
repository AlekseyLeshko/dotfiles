call plug#begin()
" vim
Plug 'nvim-lualine/lualine.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'akinsho/bufferline.nvim'

" icons
Plug 'nvim-tree/nvim-web-devicons'

" Comment
Plug 'tpope/vim-commentary'

" TypeScript
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind.nvim'

" JaveScript
Plug 'David-Kunz/cmp-npm'

" Beautifying
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'HiPhish/rainbow-delimiters.nvim'
Plug 'folke/twilight.nvim'

" tools
Plug 'nvim-lua/plenary.nvim'
Plug 'FelipeLema/cmp-async-path'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'pteroctopus/faster.nvim'

"
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" https://github.com/andymass/vim-matchup/pull/338 I have an error in TS with
" the freash version
" Plug 'andymass/vim-matchup', { 'commit': 'e2cca1747ab175b8d839a5d28679427564643a57' }

" Search
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" MD
Plug 'ellisonleao/glow.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'

" theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" experimental plugins
Plug 'ziontee113/syntax-tree-surfer'
Plug 'mhinz/vim-startify'
call plug#end()


" vim config
syntax enable
set termguicolors
filetype plugin indent on
set shiftwidth=2
set softtabstop=2
set number
set relativenumber
" set nocompatible
" indention options
" set autoindent
" set cindent
" set expandtab
" performance options
" set complete-=i
" set lazyredraw
" text rendering options
" set display+=lastline
" set encoding=utf-8
" set linebreak
" set scrolloff=5
" set wrap
" syntax on
" user interface options
" set laststatus=2
" set ruler
" set wildmenu
" set tabpagemax=50
" set cursorline
" set noerrorbells
" set mouse=a
" set title

" vim config shortcuts
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" vim-commentary
nnoremap ? :Commentary<CR>
xmap ? :Commentary<CR>
nmap ? :Commentary<CR>
omap ? :Commentary<CR>
" theme
colorscheme catppuccin-mocha
set noswapfile
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML
" folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.

" set spell
" set spell spelllang=en_us
" setlocal spell spelllang=en_us

lua << EOF
vim.opt.termguicolors = true
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
servers = {
  'pyright',
  'ts_ls',
  'lua_ls'
}


require('glow').setup()
require("bufferline").setup{}
require('lualine').setup()
require('faster').setup()
-- require("nvim-autopairs").setup {}

require('telescope-config')
require('treesitter-config')
require('lsp-config')
require('cmp-config')
require('syntax-tree-surfer-config')
require('personal-config')
require('gitsigns-config')
require('prettier-config')
require('null-ls-config')
EOF
