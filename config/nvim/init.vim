syntax enable
let mapleader = " "

call plug#begin('~/.vim/plugged')
  Plug 'atelierbram/vim-colors_atelier-schemes'
  Plug 'robertmeta/nofrils'
  Plug 'vim-test/vim-test'
  Plug 'hashivim/vim-terraform'
  Plug 'rmagatti/auto-session'
  Plug 'rmagatti/session-lens'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'ervandew/supertab'
  Plug 'preservim/nerdtree'
  Plug 'liuchengxu/space-vim-dark'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mhinz/vim-startify'
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'ap/vim-buftabline'
  Plug 'airblade/vim-gitgutter'
  Plug 'majutsushi/tagbar'
  Plug 'vim-airline/vim-airline'
  Plug 'enricobacis/vim-airline-clock'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'thoughtbot/vim-rspec'
  Plug 'voldikss/vim-floaterm'
  Plug 'fatih/vim-go'
  Plug 'folke/which-key.nvim'
  Plug 'whatyouhide/vim-gotham'
  Plug 'nanotech/jellybeans.vim'
  Plug 'sickill/vim-monokai'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'flebel/vim-mypy', { 'for': 'python', 'branch': 'bugfix/fast_parser_is_default_and_only_parser' }
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'psf/black', { 'branch': 'stable' }
  Plug 'gf3/peg.vim'
call plug#end()

lua << EOF
  require("which-key").setup {
  }
EOF

map <C-o> :NERDTreeToggle<CR>
map <Leader>v :WhichKey<CR>


set tabstop=2
set shell=/usr/local/bin/fish
set shiftwidth=2
set expandtab 
set hidden
set background=dark
set autoindent
set preserveindent
set copyindent
set mouse=

" Set Colors
if (has("termguicolors"))
 set termguicolors
endif
colorscheme Atelier_SulphurpoolDark
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

nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprev<CR>
nmap <leader>bq :bp <BAR> bd #<CR>

" Airline
let g:airline#extensions#clock#format = '%I:%M:%S %X'

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fa <cmd>Ag<cr>
" nnoremap <leader>ft <cmd>Telescope help_tags<cr>
"lua << EOF
"require('telescope').setup{
"   file_ignore_patterns = {"node_modules","./venv/"},
"}
"EOF

" RSpec.vim mappings
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" let g:python_host_prog = '~/.nvim.pythonenv2/bin/python'
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

" Floaterm
let g:floaterm_keymap_toggle = '<F9>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9


" Line Numbers
set number relativenumber " Turn line numbering on at startup
noremap <F1> :set invnumber invrelativenumber<CR>

"Tagbar
"
noremap <F8> :Tagbar<CR>
let g:tagbar_autofocus=1

" Session Lens
lua <<EOF
require('session-lens').setup {
    path_display={'shorten'},
}
EOF
noremap <F2> :SearchSession<CR>


" Syntax Colors
function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction


" TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {"vim", "c", "rust"},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

"Guten Tags
set statusline+=%{gutentags#statusline()}


" Indent Line
let g:indentLine_char = '│'


" GBrowse open current line
nnoremap <leader>gb :.GBrowse<CR>


" vim-test
nmap <silent> <leader>t. :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
let test#strategy = "neovim"

" Mypy
nmap <silent> <leader>mp :Mypy<CR>

