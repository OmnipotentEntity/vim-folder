set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle.git'

Bundle 'Valloric/YouCompleteMe'
Bundle 'dense-analysis/ale'
Bundle 'ervandew/supertab.git'
Bundle 'godlygeek/tabular'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'rust-lang/rust.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/AutoTag'
Bundle 'vim-scripts/Cpp11-Syntax-Support'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/reload.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'wincent/Command-T'
Bundle 'xolox/vim-misc'
Bundle 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

let g:airline_powerline_fonts=1

set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor
set autoindent		" always set autoindenting on
set autowrite		" Automatically save before commands like :next and :make
set completeopt=longest,menuone
set cuc
set cul
set encoding=utf-8
set expandtab
set formatoptions=q
set history=1000		" keep 50 lines of command line history
set hls
set ignorecase		" Do case insensitive matching
set incsearch
set lazyredraw
set listchars+=precedes:<,extends:>
set mouse=a
set nostartofline
set report=0
set ruler		" show the cursor position all the time
set shiftwidth=2
set shortmess=aOstT
set showcmd		" Show (partial) command in status line.
set showmatch
set sidescroll=5
set smartindent
set smarttab
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set t_Co=256
set tabstop=2
set tags=./tags;/
set textwidth=80		" Don't wrap lines by default
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
set visualbell
set wildmenu
set wildmode=longest,list,full
set wmh=0

set cpoptions=aABceFsmq

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set laststatus=2

au Bufenter *.hs compiler ghc

au BufNewFile,BufRead *.hsc    set filetype=haskell
au BufNewFile,BufRead *.rbi    set filetype=ruby
au BufNewFile,BufRead *.rs    set filetype=rust

set colorcolumn=80
au BufNewFile,BufRead *.rs setlocal colorcolumn=100

" Make editing this file nice
autocmd Filetype vim set foldmarker={,} foldlevel=0 foldmethod=marker expandtab shiftwidth=4 tabstop=4

autocmd Filetype ruby          set shiftwidth=2 tabstop=2 expandtab
autocmd Filetype ruby          map <Leader>T :call system("tmux splitw -v 'rake test;read';tmux last-pane")<cr>
autocmd Filetype javascript    set shiftwidth=2 tabstop=2 expandtab
autocmd Filetype erlang        set shiftwidth=4 tabstop=4 expandtab
autocmd Filetype python        set shiftwidth=4 tabstop=4 expandtab
autocmd Filetype c,cpp         set shiftwidth=2 tabstop=2 foldlevel=100
autocmd Filetype rust          set shiftwidth=4 tabstop=4 expandtab colorcolumn=100 textwidth=100 foldlevel=100
autocmd Filetype html,xml      set shiftwidth=1 tabstop=1 expandtab
autocmd Filetype eruby         set shiftwidth=1 tabstop=1 expandtab
autocmd Filetype tex,plaintex  set shiftwidth=2 tabstop=2 expandtab wrap lbr
autocmd Filetype yaml          set shiftwidth=2 tabstop=2 expandtab
autocmd Filetype haskell,cabal set shiftwidth=4 tabstop=4 shiftwidth=4 expandtab shiftround
autocmd Filetype vim           set shiftwidth=4 tabstop=4 shiftwidth=4 textwidth& colorcolumn&

syntax on
filetype plugin indent on

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
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

set statusline+=%#warningmsg#
set statusline+=%*

let g:ycm_extra_conf_globlist = ['~/work/*']

function! FindCabalSandboxRoot()
    return finddir('.cabal-sandbox', './;')
endfunction

function! FindCabalSandboxRootPackageConf()
    return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
endfunction

au Bufenter *.hs let b:ghc_staticoptions = '-ilib -isrc -i. -idist/build/autogen -Wall -package-db='.FindCabalSandboxRootPackageConf()

let g:haddock_browser = '/usr/bin/firefox'
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:haddock_docdir = '/usr/share/haddock-2.13.2/html'

syntax on
hi ColorColumn ctermbg=DarkBlue
