" In particular we want to hide the tab character, but since golang takes care
" of formatting for us, we don't need to pay so much attention to other
" listchars either.
set nolist

" No line length limits in Go.
set colorcolumn=

" vim-go
nmap <leader>gb :GoBuild<CR>
nmap <leader>gr :GoRun<CR>
nmap <leader>gt :GoTest<CR>
nmap <leader>gf :GoFmt<CR>
nmap <leader>gl :GoLint<CR>
nmap <leader>gd :GoDoc<CR>
nmap <leader>gi :GoImports<CR>
