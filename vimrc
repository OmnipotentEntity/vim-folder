" Configuration file for vim
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor
set autoindent		" always set autoindenting on
set autowrite		" Automatically save before commands like :next and :make
set cuc
set cul
set expandtab
set history=50		" keep 50 lines of command line history
set hls
set ignorecase		" Do case insensitive matching
set incsearch
set listchars+=precedes:<,extends:>
set mouse=a
set ruler		" show the cursor position all the time
set shiftwidth=2
set showcmd		" Show (partial) command in status line.
set showmatch
set sidescroll=5
set smartindent
set smarttab
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set t_Co=256
set tabstop=2
set tags=./tags;/
set textwidth=0		" Don't wrap lines by default
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
set visualbell
set wildmenu
set wildmode=longest,list,full
set wmh=0
set makeprg=nice\ make

au Bufenter *.hs compiler ghc

syntax on
filetype plugin on

colorscheme sorcerer

command Wq wq
command WQ wq
command W w
command Q q

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

inoremap kj <ESC>

nnoremap <C-h> :tabprevious <Return>
nnoremap <C-l> :tabnext <Return>
nnoremap <C-k> :close <Return>
nnoremap <C-j> :tab split <Return>

nnoremap <C-n> :next <Return>
nnoremap <C-p> :prev <Return>

nnoremap <leader>b :BuildBuddy<Return>

let g:SuperTabCrMapping = 0

" Handled within BuildBuddy
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wformat=2 -Wall -Wextra -Wuninitialized -Werror -Wno-format-nonliteral -Wno-non-template-friend -Wstrict-null-sentinel -Woverloaded-virtual -Wnoexcept -Wnon-virtual-dtor -Winit-self'

let g:ycm_extra_conf_globlist = ['~/work/*']

let g:syntastic_haskell_checkers = ['hdevtools', 'hlint', 'ghc_mod']

function! FindCabalSandboxRoot()
    return finddir('.cabal-sandbox', './;')
endfunction

function! FindCabalSandboxRootPackageConf()
    return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
endfunction

let g:hdevtools_options = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-db='.FindCabalSandboxRootPackageConf()
au Bufenter *.hs let b:ghc_staticoptions = '-ilib -isrc -i. -idist/build/autogen -Wall -package-db='.FindCabalSandboxRootPackageConf()

let g:haddock_browser = '/usr/bin/firefox'
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle.git'

Bundle 'ervandew/supertab.git'
Bundle 'tpope/vim-dispatch'
Bundle 'vim-scripts/AutoTag'
Bundle 'vim-scripts/Cpp11-Syntax-Support'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/reload.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'xolox/vim-misc'
Bundle 'wincent/Command-T'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'lukerandall/haskellmode-vim'

