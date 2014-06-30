" TODO(dlsmith): This needs to be organized.

set nocompatible
let mapleader=","

" ================================== Vundle ================================== "
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'SirVer/ultisnips'
Plugin 'altercation/vim-colors-solarized'
Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/Mark--Karkat'
Plugin 'vim-scripts/YankRing.vim'

if filereadable(expand('~/.google-specific.vim'))
  source ~/.google-specific.vim
endif

" Put errors in the location list automatically.
let g:syntastic_always_populate_loc_list = 1
" Java checking doesn't seem to work correctly.
let g:syntastic_java_checkers=[]

call vundle#end()
" ============================================================================ "

" =========================== General vim settings =========================== "

" UltiSnips.
let g:UltiSnipsEditSnips="vertical"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
nnoremap <leader>es :UltiSnipsEdit<cr>

" Markdown Vim Mode.
" Disable folding.
let g:vim_markdown_folding_disabled=1

" YouCompleteMe.
" Remove default <TAB> bindings, which are used for snippets.
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>

" Ctrl-P.
:let g:ctrlp_map = '<leader>t'
:let g:ctrlp_match_window_bottom = 1
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

vnoremap <leader>ss :sort<cr>

nnoremap <leader>qs :mks! vim-session<CR> :wqa<CR>

" Tagbar.
let g:tagbar_width = 50
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
nmap <leader>vt :TagbarToggle<CR>

" NERDTree.
nmap <leader>vn :NERDTreeToggle<CR>

" Scratch settings.
nnoremap <silent> <leader>sc :Scratch<cr>

" Enable backups and keep in common directory
set backupdir=~/.vim/backup
set backup

" Put swap files in common directory
set directory=~/.vim/tmp

" Enable use of the mouse.
set mouse=a

" Set font
if has('macunix')
  set guifont=Inconsolata:h14
elseif has('unix')
  set guifont=Inconsolata\ 12
endif

" Assorted function key bindings.
set pastetoggle=<F2>

" Do not redraw while running macros
set lazyredraw

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Don't use a pop up menu for completions
set completeopt=

" Quick switching between current and last buffer
nnoremap <leader><leader> <C-^>

" Make it easy to edit vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Explore the current file's directory.
nmap <leader>ee :Explore<CR>
nmap <leader>eE :Texplore<CR>

" Center screen on current line.
nmap <leader>cc zz

nmap <leader>dd :r !date<CR>

" Some general settings
set encoding=utf-8
set scrolloff=3
set visualbell
set cursorline
set incsearch
set ignorecase
set smartcase
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

" Formatting options (:help fo-table for info)
set formatoptions=tqron1

" Change color scheme.
set t_Co=256
set background=dark
let g:zenburn_high_Contrast = 1
colorscheme zenburn

" Highlight column after 80 chars.
set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey

" Set line wrap
set wm=2
set textwidth=0  " 78.

" Change so that movement isn't constrained
set virtualedit+=block

" Open vertical splits on right instead of left and horizontal splits on bottom
" instead of top
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
nnoremap <leader>jj J
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

" Pretty much works everywhere. Might as well use it.
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-k> <Esc><Right>DA

" Command mode mappings.
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" Expand context in diff mode to avoid folding.
set diffopt+=context:99999
" ============================================================================ "

filetype plugin indent on
