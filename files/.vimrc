set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" :Git command
Plugin 'tpope/vim-fugitive'

" reStructuredText support
Plugin 'Rykka/riv.vim'

" Support .editorconfig files (https://editorconfig.org/)
Plugin 'editorconfig/editorconfig-vim'

" Rust syntax highlighting
Plugin 'rust-lang/rust.vim'

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
