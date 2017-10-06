set nocompatible
let mapleader=","
filetype off

" =========================== Package installation =========================== "

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bogado/file-line'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'groenewege/vim-less'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/Mark--Karkat'
Plug 'vim-scripts/YankRing.vim'

" google/vim-codefmt and dependencies.
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()

" Must go after the plug#end() call.
call glaive#Install()

" ========================== Vim configuration ============================== "

" Enable backups and keep in common directory
set backupdir=~/.vim/backup
set backup

" Put swap files in common directory
set directory=~/.vim/tmp

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

" Enable some helpful programming settings
set textwidth=79
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent

set smartindent
set smarttab
set incsearch
set showmatch
set number

syntax enable

" Show tabs.
set list
set listchars=tab:▸\ 

" Highlight column after 80 chars.
set colorcolumn=81

" Set line wrap
set wm=2
set textwidth=0  " 78.

" Change so that movement isn't constrained
set virtualedit+=block

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Open vertical splits on right instead of left and horizontal splits on bottom
" instead of top
set splitright
set splitbelow

" Hide scrollbars in GUI vim.
set guioptions-=R
set guioptions-=L

" Do not redraw while running macros
set lazyredraw

" Don't use a pop up menu for completions
set completeopt=

" Enable use of the mouse.
set mouse=a

" Set font
if has('macunix')
  set guifont=Inconsolata:h14
elseif has('unix')
  set guifont=Inconsolata\ 12
endif

" Save on losing focus
au FocusLost * :silent! wall

" Resize splits when window is resized
au VimResized * exe "normal! \<c-w>="

" Formatting options (:help fo-table for info)
set formatoptions=tqron1

" Expand context in diff mode to avoid folding.
set diffopt+=context:99999

" ========================= Misc key bindings =============================== "

imap kj <Esc>

vnoremap <leader>ss :sort<cr>
" Format JSON.
vnoremap <silent> <leader>fj :!python -m json.tool<cr>

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Toggle for paste mode.
set pastetoggle=<F2>

" Quick switching between current and last buffer
nnoremap <leader><leader> <C-^>

" Make it easy to edit vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Explore the current file's directory.
nmap <leader>ee :Explore<CR>

" Center screen on current line.
nmap <leader>cc zz

nmap <leader>dd :r !date<CR>

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" Use tab to move between bracket pairs.
nnoremap <tab> %
vnoremap <tab> %

" Folding
set foldlevelstart=99
nnoremap <Space> za
vnoremap <Space> za
vnoremap <C-Space> zf
set foldmethod=manual

" Set k and j to move by displaylines instead of by actual lines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Make tab switching easier
nnoremap L gt
nnoremap H gT

" Make moving between splits easier. Uncomment if not using
" vim-tmux-naviagotor.
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Simple Emacs navigation in insert mode.
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

" ========================= Package configuration =========================== "

" Change color scheme.
" Solarized: don't forget to download and load the custom colors preset for
" your terminal emulator.
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" Yankring.
let g:yankring_history_dir = '~/.vim/'

" UltiSnips.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
nnoremap <leader>es :UltiSnipsEdit<cr>

" Code format.
nnoremap <leader>ff :FormatCode<CR>
vnoremap <leader>fl :FormatLines<CR>

" Markdown Vim Mode.
" Disable folding.
let g:vim_markdown_folding_disabled=1
" Refresh less.
let g:instant_markdown_slow = 1
" Don't auto-preview. Trigger with :InstantMarkdownPreview
let g:instant_markdown_autostart = 0

" YouCompleteMe.
" Remove default <TAB> bindings, which are used for snippets.
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_goto_buffer_command = 'new-tab'
nnoremap <silent> <leader>yd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <leader>yh :YcmCompleter GetDoc<CR>

" Syntastic.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

nnoremap <leader>sc :SyntasticCheck<CR>
nnoremap <leader>sl :Errors<CR>
nnoremap <leader>sr :SyntasticReset<CR>
nnoremap <leader>st :SyntasticToggle<CR>

" Checkers configuration.
" See https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_java_checkers=[]
let g:syntastic_javascript_checkers=['eslint']

" Fugitive.
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gg :Ggrep 
nnoremap <leader>gm :Gmove 
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gbrowse<CR>

" fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <leader>t :FzfFiles<CR>

" Tagbar.
let g:tagbar_width = 50
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
nmap <leader>vt :TagbarToggle<CR>

" NERDTree.
let g:NERDTreeWinSize = 50 
nmap <leader>vn :NERDTreeToggle<CR>

filetype plugin indent on
