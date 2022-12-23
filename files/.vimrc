set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE!
" When changing below, make sure to run the following in vim:
"     :PluginInstall
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" :Git command
Plugin 'tpope/vim-fugitive'

" Keep ctags updated
Plugin 'ludovicchabant/vim-gutentags'

" reStructuredText support
Plugin 'habamax/vim-rst'

" Support .editorconfig files (https://editorconfig.org/)
Plugin 'editorconfig/editorconfig-vim'

" Rust syntax highlighting
Plugin 'rust-lang/rust.vim'

" Nerdtree sidebar file browser
" :NERDTree
Plugin 'preservim/nerdtree'

" Add git status markers on files in NERDTree
Plugin 'xuyuanp/nerdtree-git-plugin'

" Show vim undo changes as a tree structure in a sidebar
" :UndootreeToogle
Plugin 'mbbill/undotree'

" Browse source tags in a sidebar
" :help tagbar
Plugin 'preservim/tagbar'

" Manage NERDTree, undotree and tagbar
Plugin 'zhaosheng-pan/vim-sidebar-manager'

" Dissable editorconfig for Fugitive (Git) and remove (SCP) files
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Make sure we get syntax highlightning
syntax on

" Activate moduleine
set modeline

" make backspace behave like normal again
set bs=2

filetype plugin indent on

" Start with everything unfolded
set foldlevel=99

" Colors
set background=dark
colorscheme moonfly
hi Normal ctermbg=16 guibg=#000000
hi LineNr ctermbg=16 guibg=#000000

" Make VIM silent
set visualbell

" Make sure white-space characters are visible
set listchars=tab:>·,trail:~
set list

" TAB handling
set tabstop=4 expandtab shiftwidth=4

" Setup sidebar manager
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 80
let g:NERDTreeQuitOnOpen = 0
let g:tagbar_left = 1
let g:tagbar_width = 80
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth = 80

let g:sidebars = {
  \ 'nerdtree': {
  \     'position': 'left',
  \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'nerdtree'},
  \     'open': 'NERDTree',
  \     'close': 'NERDTreeClose'
  \ },
  \ 'tagbar': {
  \     'position': 'left',
  \     'check_win': {nr -> bufname(winbufnr(nr)) =~ '__Tagbar__'},
  \     'open': 'TagbarOpen',
  \     'close': 'TagbarClose'
  \ },
  \ 'undotree': {
  \     'position': 'left',
  \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'undotree'},
  \     'open': 'UndotreeShow',
  \     'close': 'UndotreeHide'
  \ }
  \ }
noremap <silent> <f1> :call sidebar#toggle('nerdtree')<CR>
noremap <silent> <f2> :call sidebar#toggle('tagbar')<CR>
noremap <silent> <f3> :call sidebar#toggle('undotree')<CR>

let g:startify_session_before_save = ['call sidebar#close_all()']

" buftabs short-cuts
noremap <silent> <c-j> :bprev<cr>
noremap <silent> <c-k> :bnext<cr>
