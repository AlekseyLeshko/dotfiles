set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" themes
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'ajh17/spacegray.vim'
" Plugin 'jnurmine/zenburn'
Plugin 'joshdick/onedark.vim'
" Plugin 'arcticicestudio/nord-vim'
" Plugin 'morhetz/gruvbox'
" Plugin 'w0ng/vim-hybrid'

" Vim usability
Plugin 'myusuf3/numbers.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" search
Plugin 'haya14busa/incsearch.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" file system
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Code
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/syntastic'
Plugin 'yggdroot/indentline'
Plugin 'tpope/vim-surround'
Plugin 'raimondi/delimitmate'
Plugin 'christoomey/vim-sort-motion'

" Comments
Plugin 'scrooloose/nerdcommenter'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
" Plugin 'airblade/vim-gitgutter'

" Snippets
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'justinj/vim-react-snippets'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'peitalin/vim-jsx-typescript'
" Plugin 'Shougo/vimproc.vim'

" ES6
Plugin 'jbgutierrez/vim-babel'
Plugin 'isruslan/vim-es6'

Plugin 'findango/vim-mdx'
Plugin 'suan/vim-instant-markdown'

Plugin 'elzr/vim-json'

call vundle#end()
filetype plugin indent on

" plugins settings
" theme
colorscheme onedark

" vim-easymotion
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-bd-f)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-bd-jk)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-bd-w)

" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" vim search
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" fzf
nnoremap <Leader>a :Ag<Space>
" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
 \ call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'cat {}']}, <bang>0)
map <C-p> :Files<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '.git[[dir]]', '\.hg', '\.svn', '\.bzr', '\.DS_Store', 'node_modules']
let NERDTreeShowHidden=1

" nerdtree-git-plugin
let g:NERDTreeShowIgnoredStatus = 1

" youcompleteme
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>']

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map={'mode': 'active'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = "☠"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "☢"
let g:syntastic_style_warning_symbol = "☹"

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint_d'


" let g:syntastic_aggregate_errors = 1
" let g:syntastic_typescript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['eslint', 'tsuquyomi']
let g:syntastic_typescript_eslint_exe = 'eslint_d'
" let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" eslint_d
" Autofix entire buffer with eslint_d:
nnoremap <leader>ef mF:%!eslint_d --stdin --fix-to-stdout<CR>`F
" Autofix visual selection with eslint_d:
vnoremap <leader>ef :!eslint_d --stdin --fix-to-stdout<CR>gv


nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

" indentline
let g:indentLine_char = '¦'

" nerdcommenter
let g:NERDSpaceDelims = 1

" vim-snippets
set runtimepath+=~/.vim/UltiSnips/

" vim-jsx
let g:jsx_ext_required = 0

" typescript-vim
" let g:typescript_compiler_binary = 'tsc'
" let g:typescript_compiler_options = ''
" let g:typescript_indent_disable = 0
" autocmd FileType typescript :set makeprg=tsc

" JSON
let g:vim_json_syntax_conceal = 0

" vim settings
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2
" set hlsearch
set ignorecase
set smartcase
set complete-=i
set lazyredraw
set display+=lastline
set encoding=utf8
set linebreak
set scrolloff=1
set sidescrolloff=5
syntax enable
syntax on
set wrap
set laststatus=2
set ruler
set wildmenu
set tabpagemax=50
set cursorline
set nu
set relativenumber
" set noerrorbells
" set visualbel
"set mouse=a
set title
" set foldmethod=indent
" set foldnestmax=3
" set nofoldenable
set autoread
set backspace=indent,eol,start
"set backupdir=~/.cache/vim
set confirm
set dir=~/.cache/vim
set formatoptions+=j
set hidden
set history=1000
set nomodeline
set noswapfile
set nrformats-=octal
"set shell=~/.zshrc
"set spell
set wildignore+=.pyc,.swp
"set paste
set showmatch
set ttyfast
set nobackup
set ts=2 sw=2 et
set fo=cq
set tw=78
set colorcolumn=100
"set t_Co=256
"set term=builtin_beos-ansi
"set term=xterm-256color

" split size
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Splits
set splitbelow
set splitright

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" folding
if has('folding')
 if has('windows')
  let &fillchars='vert: '
 endif
 set foldmethod=indent
 set foldlevelstart=99
endif


" leader shortcuts
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" nnoremap <leader>ss :mksession<CR>

nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
