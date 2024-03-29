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

" Autoload file syntax highlightning, support numerous languages
Plugin 'sheerun/vim-polyglot'

" Code formatter, supports format at save or with keystrokes
" For keystrokes: noremap <F3> :Autoformat<CR>
" When saving: au BufWrite * :Autoformat
" Note: The format binary must be installed, e.g. clang-format
"       for C/C++. See following URL for more information:
"       https://github.com/vim-autoformat/vim-autoformat#default-formatprograms
Plugin 'vim-autoformat/vim-autoformat'

" :Git command
Plugin 'tpope/vim-fugitive'

" Keep ctags updated
"Plugin 'ludovicchabant/vim-gutentags'

" reStructuredText support
"Plugin 'habamax/vim-rst'

" Support .editorconfig files (https://editorconfig.org/)
Plugin 'editorconfig/editorconfig-vim'

" Run build commands and parse output
Plugin 'tpope/vim-dispatch'

" Add useful key mappings, e.g. ]l and [l for next/prev error with make
" dispatch
Plugin 'tpope/vim-unimpaired'

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

" Make files deemed to belong to Linux kernel to adhere to Linux indentation
" style.
" Example to adjust what files are deemde to belong to Linux kernel:
" let g:linuxsty_patterns = [ "/usr/src/", "/linux" ]
Plugin 'vivien/vim-linux-coding-style'

" GitHub Co-Pilot, requires subscription
" Use ':Copilot setup' to get started
Plugin 'github/copilot.vim'

" ALE interactive linter
" Supported languages:
"     https://github.com/dense-analysis/ale/blob/master/supported-tools.md
" For language servers:
"     https://langserver.org/
" Some language servers:
"     https://github.com/rcjsuen/dockerfile-language-server
"     https://github.com/python-lsp/python-lsp-server
"     https://github.com/artempyanykh/marksman (should work with Ale out of
"         the box)
"Plugin 'dense-analysis/ale'

" Read gradle.build and setup accordingly
Plugin 'hsanson/vim-android'

" Language server protocol (replaces most of ALE)
Plugin 'prabirshrestha/vim-lsp'

" Setup vim-lsp for most common language servers
Plugin 'mattn/vim-lsp-settings'

" Handle auto completion
Plugin 'prabirshrestha/asyncomplete.vim'

" Tie vim-lsp and asyncomplete.vim together
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

let g:linuxsty_patterns = [ "/usr/src/", "/linux" ]

" Dissable editorconfig for Fugitive (Git) and remove (SCP) files
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" In case asynccomplete.vim suggestion popups are too slow, uncomment the
" following line:
" let g:asyncomplete_auto_popup = 0

" C-n and C-p normally selects next/previous completion, use tab for it too:
" This is for asynccomplete.vim plugin.
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

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
