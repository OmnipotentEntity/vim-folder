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

syntax on

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

nnoremap <leader>b :BuildBuddy -j8<Return>

let g:SuperTabCrMapping = 0

" Handled within BuildBuddy
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wformat=2 -Wall -Wextra -Wuninitialized -Werror -Wno-format-nonliteral -Wno-non-template-friend -Wstrict-null-sentinel -Woverloaded-virtual -Wnoexcept -Wnon-virtual-dtor -Winit-self'

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
