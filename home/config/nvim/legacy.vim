syntax enable
let mapleader = " "


set autoindentz
set preserveindent
set copyindent
set shell=~/.nix-profile/bin/fish

" Set Colors
if (has("termguicolors"))
 set termguicolors
endif
hi Comment cterm=italic

" Relative numbers and when not in buffer set absolute numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Disable EX Mode
map q: <Nop>
" Disable EX Mode
nnoremap Q <nop>


" Airline
let g:airline#extensions#clock#format = '%I:%M:%S %X'


" nnoremap <leader>ft <cmd>Telescope help_tags<cr>



" let g:python_host_prog = '~/.nvim.pythonenv2/bin/python'
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif


" Line Numbers
set number relativenumber " Turn line numbering on at startup
noremap <F1> :set invnumber invrelativenumber<CR>

"Tagbar
"


" Syntax Colors
function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction


" Guten Tags
" set statusline+=%{gutentags#statusline()}


" Indent Line
let g:indentLine_char = '│'


" vim-test
nmap <silent> <leader>t. :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
let test#strategy = "neovim"

" Mypy
nmap <silent> <leader>mp :Mypy<CR>

