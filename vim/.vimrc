" Set mapleader
let mapleader=","

" =========================== General vim settings =========================== "
" Use vim settings
set nocompatible

" Enable pathogen for plugins
call pathogen#infect()

" Enable backups and keep in common directory
set backupdir=~/.vim/backup
set backup

" Put swap files in common directory
set directory=~/.vim/tmp

" Set font
if has('macunix')
  set guifont=Inconsolata:h14
elseif has('unix')
  set guifont=Inconsolata\ 12
endif

" Do not redraw while running macros
set lazyredraw

" Always switch to the current file directory
"set autochdir

" All backspacing over everything in insert mode
set backspace=indent,eol,start

" Don't use a pop up menu for completions
set completeopt=

" Quick switching between current and last buffer
nnoremap <leader><leader> <C-^>

" Make it easy to edit vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Switch between .h / .cc / _.test.* (r prefix stands for related)
let pattern = '\(\(_test\)\?\.\(cc\|h\)\)$'
nmap <leader>rc :e <C-R>=substitute(expand("%"), pattern, ".cc", "")<CR><CR>
nmap <leader>rh :e <C-R>=substitute(expand("%"), pattern, ".h", "")<CR><CR>
nmap <leader>rt :e <C-R>=substitute(expand("%"), pattern, "_test.", "") . substitute(expand("%:e"), "h", "cc", "")<CR><CR>

" Some general settings
set encoding=utf-8
set scrolloff=3
set visualbell
set cursorline
set incsearch
set ruler
set shell=/bin/bash

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" Enable some helpful programming settings
syntax on
set shiftwidth=2
set softtabstop=2
set tabstop=8       " make sure hard tabs don't go unnoticed
set autoindent
set smartindent
set expandtab
set smarttab
set incsearch
set showmatch
set number

" Use tab to move between bracket pairs.
nnoremap <tab> %
vnoremap <tab> %

" Folding
set foldlevelstart=99
nnoremap <Space> za
vnoremap <Space> za
vnoremap <C-Space> zf

set foldmethod=manual

" Save on losing focus
au FocusLost * :silent! wall

" Resize splits when window is resized
au VimResized * exe "normal! \<c-w>="

" Fixes regex handling
nnoremap / /\v
vnoremap / /\v

" Set line wrap
set wm=2
set textwidth=78

" Formatting options (:help fo-table for info)
set formatoptions=tqrn1

" Change color scheme
set t_Co=256
set background=dark
let g:zenburn_high_Contrast = 1
colorscheme zenburn

" Change so that movement isn't constrained
set virtualedit+=block

" Open vertical splits on right instead of left and horizontal splits on 
" bottom instead of top
set splitright
set splitbelow

" Set k and j to move by displaylines instead of by actual lines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Make page up/down easier
nnoremap K <C-u>
vnoremap K <C-u>
nnoremap <leader>j J
nnoremap J <C-d>
vnoremap J <C-d>

" Make tab switching easier
nnoremap L gt
nnoremap H gT

" Make moving between splits easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remove MacVim UI stuff
if has('gui_running')
  set go-=T
  set go-=l
  set go-=L
  set go-=r
  set go-=R
endif

" Pretty much works everywhere. Might as well use it.
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
" ============================================================================ "

" ============================== LaTeX settings ============================== "
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Disable placeholders
let g:Imap_UsePlaceHolders=0
" ============================================================================ "
