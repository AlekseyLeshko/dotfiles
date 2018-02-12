let g:onedark_termcolors = 16
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Vim
Plugin 'elzr/vim-json'
Plugin 'myusuf3/numbers.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" file system
Plugin 'scrooloose/nerdtree'
" https://github.com/vim-syntastic/syntastic/issues/1391#issuecomment-97310854
" https://github.com/Xuyuanp/nerdtree-git-plugin/issues/6
" Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'

" search
Plugin 'mileszs/ack.vim'
Plugin 'haya14busa/incsearch.vim'

" themes
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'ajh17/spacegray.vim'
" Plugin 'jnurmine/zenburn'
Plugin 'joshdick/onedark.vim'
" Plugin 'arcticicestudio/nord-vim'
" Plugin 'morhetz/gruvbox'
" Plugin 'w0ng/vim-hybrid'

" Code
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/syntastic'
Plugin 'yggdroot/indentline'
Plugin 'tpope/vim-surround'
Plugin 'marijnh/tern_for_vim'
Plugin 'raimondi/delimitmate'

" tab
Plugin 'ervandew/supertab'

" JS
Plugin 'mitermayer/vim-prettier', { 'do': 'yarn install' }
" Plugin 'w0rp/ale'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'editorconfig/editorconfig-vim'

" Comments
Plugin 'scrooloose/nerdcommenter'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
" Plugin 'airblade/vim-gitgutter'

" Css
Plugin 'mattn/emmet-vim'

" Snippets
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'justinj/vim-react-snippets'

" JS highlighting
Plugin 'pangloss/vim-javascript'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'

" ES6
Plugin 'jbgutierrez/vim-babel'
Plugin 'mattn/webapi-vim'
Plugin 'isruslan/vim-es6'
Plugin 'ruanyl/vim-sort-imports'

" Plugin 'majutsushi/tagbar'
" Plugin 'universal-ctags/ctags'
" Plugin 'mtscout6/vim-tagbar-css'
" Plugin 'ramitos/jsctags'
" Plugin 'maksimr/vim-jsbeautify'

" MD
Plugin 'suan/vim-instant-markdown'

" Testing
Plugin 'ahmedelgabri/vim-ava-snippets'

call vundle#end()
filetype plugin indent on

" NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '.git[[dir]]', '\.hg', '\.svn', '\.bzr', '\.DS_Store', 'node_modules']
let NERDTreeShowHidden=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

autocmd VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')

" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

syntax enable
" Vim-colors-solarized
" set background=light
" colorscheme solarized

" spacegray
" colorscheme spacegray
" let g:spacegray_underline_search = 1

" colors zenburn
" syntax on
colorscheme onedark
" colorscheme nord
" colorscheme gruvbox
" set background=dark
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
" colorscheme hybrid

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map={'mode': 'active'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint_d'
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

" Tern
" enable keyboard shortcuts
let g:tern_map_keys=1
" show argument hints
let g:tern_show_argument_hints='on_hold'

" Vim settings
set t_Co=256
syntax on
set nu
set encoding=utf8

set nobackup
set noswapfile

" Autoindent with two spaces, always expand tabs
set tabstop=2
set shiftwidth=2
set expandtab


" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules'
  \ }

" Emmet
" let g:user_emmet_mode='a'
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
"
"

" JsBeatifify
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" autocmd FileType *css noremap <buffer> <c-f> :call CSSBeautify()<cr>


" vim-snippets
" let g:UltiSnipsExpandTrigger="<c-j>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" let g:SuperTabDefaultCompletionType    = '<C-n>'
" let g:SuperTabCrMapping                = 0
" let g:UltiSnipsExpandTrigger           = '<tab>'
" let g:UltiSnipsJumpForwardTrigger      = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
" let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = '<C-n>'
" let g:ycm_key_list_previous_completion = '<C-p>'
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']


set runtimepath+=~/.vim/UltiSnips/
" let g:UltiSnipsSnippetsDir='~/.vim/'
" let g:UltiSnipsSnippetDirectories=["snippets"]

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" nerdcommenter
let g:NERDSpaceDelims = 1


" vim-easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)



" tagbar
" nmap <F8> :TagbarToggle<CR>
" let g:tagbar_type_css = {
  " \ 'ctagtype' : 'Css',
  " \ 'kinds'     : [
    " \ 'c:classes',
    " \ 's:selectors',
    " \ 'i:identities'
  " \ ]
" \ }

" Tabs
nmap <C-t> a<C-t><Esc>
nmap <C-d> a<C-d><Esc>
vmap <C-t> :><CR>gv
vmap <C-d> :<<CR>gv

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Splits
set splitbelow
set splitright


" folding
if has('folding')
  if has('windows')
    let &fillchars='vert: '
  endif
  set foldmethod=indent
  set foldlevelstart=99
endif

" autmformat
" noremap <c-f> :Autoformat<CR>

set ts=2 sw=2 et

"vim-bable
map  <Leader>js :Babel vert<Enter>
nmap <Leader>js :Babel vert<Enter>


" JSON
" au! BufRead,BufNewFile *.json set filetype=json
let g:vim_json_syntax_conceal = 1
let g:vim_json_warnings = 1
setlocal conceallevel=1

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" vim-jsx
let g:jsx_ext_required = 0

" vim serach
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'

" youcompliteme
" imap <C-J> <Plug>snipMateNextOrTrigger
" smap <C-J> <Plug>snipMateNextOrTrigger

" in insert mode, ctrl-c add spliting line 
imap <C-c> <CR><Esc>O

" let g:ackprg = "ag --vimgrep"
" let g:ackprg = 'ag --nogroup --nocolor --column'

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
noremap <Leader>aw :Ack! <cword><cr>
nnoremap <Leader>ab :Ack!  %<Left><Left>

set tw=78
set fo=cq
set colorcolumn=80

" vim-sort-imports
nnoremap <Leader>s :SortImport<Enter>

" Vim settings
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" vim-prettier
let g:prettier#exec_cmd_async = 1

" indentline
let g:indentLine_char = '¦'

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
