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
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" file system
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'

" Code
Plugin 'luochen1990/rainbow'

" JS

" TS
Plugin 'Quramy/tsuquyomi'

call vundle#end()
filetype plugin indent on

" plugins settings

" nerdtree-git-plugin
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeIndicatorMapCustom = {
  \ 'Ignored': '.',
\ }

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
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" incsearch
" vim search
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" incsearch-fuzzy.vim
map / <Plug>(incsearch-fuzzy-/)
map ? <Plug>(incsearch-fuzzy-?)
map / <Plug>(incsearch-fuzzy-stay)

" incsearch-easymotion.vim + incsearch-fuzzy.vim
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" fzf
nnoremap <Leader>a :Ag<Space>
" Likewise, Files command with preview window
" command! -bang -nargs=? -complete=dir Files
 " \ call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'cat {}']}, <bang>0)
map <C-p> :Files<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" How can I open a NERDTree automatically when vim starts up?
autocmd vimenter * NERDTree
" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Jump to the main window.
autocmd VimEnter * wincmd p

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" How can I make sure vim does not open files and other buffers on NerdTree window?
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
" fix ^G in a filename
let g:NERDTreeNodeDelimiter = "\u00a0"
" show hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr', '\.DS_Store', 'node_modules']
let g:NERDTreeShowLineNumbers=1
autocmd BufEnter NERD_* setlocal relativenumber

" rainbow
" let g:rainbow_active = 1
let g:rainbow_active = 1

" tsuquyomi
autocmd FileType typescript nmap <Leader>d <Plug>(TsuquyomiDefinition)
autocmd FileType typescript nmap <Leader>i <Plug>(TsuImport)
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)

" VIM config
"set encoding=utf8
set autoindent
set ignorecase
set smartcase
set hlsearch
set encoding=UTF-8
syntax enable
syntax on
set nu
set ts=2 sw=2 et
set cursorline

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

" Mappings to move lines
" Iterm2 Settings
" [34~ = Option + j
" [33~ = Option + k
nnoremap [34~ :m .+1<CR>==
nnoremap [33~ :m .-2<CR>==
inoremap [34~ <Esc>:m .+1<CR>==gi
inoremap [33~ <Esc>:m .-2<CR>==gi
vnoremap <Esc>[34~ :m '>+1<CR>gv=gv
vnoremap <Esc>[33~ :m '<-2<CR>gv=gv
