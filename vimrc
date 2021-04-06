runtime! debian.vim

set nocompatible     "This must be first, because it changes other options as a side effect.
set backspace=indent,eol,start   "Allow backspace over everything in insert mode.

"Enable syntax highlighting by default. 

if has("syntax")
  syntax on
endif

set number
set relativenumber
set shortmess+=I
set hlsearch
let python_highlight_all = 1

if has('termguicolors')
  set termguicolors
endif

set background=dark  "A dark background within the editing area and default on syntax highlighting
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set showcmd		" For showing command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching.
set smartcase		" Do smart case matching.
set incsearch		" Incremental search.
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned.
set mouse=a		" Enable mouse usage (all modes).
set encoding=UTF-8      " Set the default file encoding to UTF-8
set autoread            " Automatically read a file that has been changed.
set foldmethod=syntax   " Fold code by define syntax.
set ruler               " show the cursor position all the time
set autoindent          " Indent as with previous line
set smartindent         " Be smart about autoindent
set wildmenu            " Allow tab completion of vim options
set wildmode=full       " Complete the next full match

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.
Plugin 'gridley/serpent2vimsyntax'
Plugin 'jlconlin/ENDF.vim'
Plugin 'morhetz/gruvbox'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
" PATH
set path+=/path/to/

colorscheme gruvbox
set background=dark

let g:ycm_key_list_accept_completion = ['<C-y>']


" Syntastic settings.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ycm_collect_identifiers_from_tags_files = 1
