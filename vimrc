"
" File: .vimrc
" Created by: Robert Górczyński on 05/02/2016
" URL: https://github.com/gorczynski/dotfiles
"

" Begin settings for Vundle
" Taken from https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" End settings for Vundle

" General
set encoding=utf-8
set laststatus=2    " Show statusline all the time
let g:airline_powerline_fonts = 1  " For Powerline fonts

" Editing settings
syntax enable
set number
set numberwidth=4
set cursorline
set scrolloff=6
set tabstop=4

" Search settings
set hlsearch
set showmatch
set incsearch

" UI settings
colorscheme Tomorrow-Night
set t_Co=256
set ruler

" Select font depending on the OS
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    "set guifont=Menlo\ Regular:h13
    set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h13
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" For Python
let python_highlight_all=1

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" For web development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
