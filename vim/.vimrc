" TODO(dlsmith): This needs to be organized.

set nocompatible
let mapleader=","

" ================================== Vundle ================================== "
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Plugin 'davidhalter/jedi-vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bogado/file-line'
Plugin 'gmarik/vundle'
Plugin 'groenewege/vim-less'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'
Plugin 'mhinz/vim-startify'
Plugin 'mileszs/ack.vim'
Plugin 'mtth/scratch.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'suan/vim-instant-markdown'
Plugin 'tommcdo/vim-fubitive'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/Mark--Karkat'
Plugin 'vim-scripts/YankRing.vim'

call vundle#end()
" ============================================================================ "

" =========================== General vim settings =========================== "

" Yankring.
let g:yankring_history_dir = '~/.vim/'

" UltiSnips.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
nnoremap <leader>es :UltiSnipsEdit<cr>

" Vim Jedi.
" let g:jedi#goto_command = "<leader>jd"
" let g:jedi#goto_assignments_command = "<leader>jg"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "<leader>jh"
" let g:jedi#usages_command = "<leader>ju"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>jr"
" let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0
" let g:jedi#show_call_signatures = "2"

" Markdown Vim Mode.
" Disable folding.
let g:vim_markdown_folding_disabled=1

" YouCompleteMe.
" Remove default <TAB> bindings, which are used for snippets.
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
nnoremap <silent> <leader>jd :YcmCompleter GoTo<CR>

" Syntastic.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkerss = ['pylint']

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
" TODO: Selectively disable the checkers instead of turning everything off.
let g:syntastic_java_checkers=[]
let g:syntastic_javascript_checkers=['jscs']
" let g:syntastic_javascript_checkers=['jshint']

" Fugitive.
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
" TODO: Figure out how to insert visual selection.
nnoremap <leader>gg :Ggrep 
nnoremap <leader>gm :Gmove 
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gbrowse<CR>

" Ctrl-P.
:let g:ctrlp_map = '<leader>t'
:let g:ctrlp_match_window_bottom = 1
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

" Show tabs.
set list
set listchars=tab:▸\ 
" To show eol as well
"   set listchars=tab:▸\ ,eol:¬

vnoremap <leader>ss :sort<cr>
vnoremap <silent> <leader>fj :!python -m json.tool<cr>

nnoremap <leader>qs :mks! .vim-session<CR> :wqa<CR>

" Tagbar.
let g:tagbar_width = 50
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
nmap <leader>vt :TagbarToggle<CR>

" NERDTree.
let g:NERDTreeWinSize = 50 
nmap <leader>vn :NERDTreeToggle<CR>

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

" Hide scrollbars in GUI vim.
set guioptions-=R
set guioptions-=L

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
" set t_Co=256
" let g:zenburn_high_Contrast = 1
" colorscheme zenburn
syntax enable
" Solarized: don't forget to download and load the custom colors preset for
" your terminal emulator.
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" Highlight column after 80 chars.
" set colorcolumn=81
" highlight ColorColumn ctermbg=darkgrey

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
