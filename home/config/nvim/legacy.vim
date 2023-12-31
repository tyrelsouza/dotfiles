syntax enable
let mapleader = " "


set autoindentz
set preserveindent
set copyindent
set shell=zsh

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


" Rust tags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!


highlight Cursor guibg=#5f87af ctermbg=67
highlight iCursor guibg=#ffffaf ctermbg=229
highlight rCursor guibg=#d70000 ctermbg=124

set guicursor=n-v-c:block-Cursor/lCursor
            \,i-ci-ve:ver100-iCursor
            \,r-cr:block-rCursor
            \,o:hor50-Cursor/lCursor
            \,sm:block-iCursor
            \,a:blinkwait1000-blinkon500-blinkoff250
