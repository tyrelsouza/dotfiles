" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
execute pathogen#infect()

syntax on
set noshowmode
set mouse-=a
syntax enable
colorscheme solarized

" Leader
let mapleader = " "

set hidden " allow buffers to be hidden
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 shiftround " Softtabs, 4 spaces
set textwidth=80 " Make it obvious where 80 characters is
set colorcolumn=+1
set autoindent
set preserveindent
set copyindent

" Numbers
set number
set numberwidth=4
" Allow pasting and not auto formatting
set paste

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Easier tab changing
nnoremap rr :bprevious<CR>
nnoremap tt :bnext<CR>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" Fix for airline fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
let g:tmuxline_powerline_separators = 0
let g:airline#extensions#tabline#fnamemod = ':t'


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ackprg = 'ag --vimgrep'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>pb :CtrlPBuffer<cr>
nmap <S-t> :CtrlPBuffer<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F7> :CtrlPTag<CR>


" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" FUCK EX MODE
map q: <Nop>
nnoremap Q <nop>


" Toggle line numbers with F1 - no more stupid help!
"nmap <silent> <F1> :set invnumber<CR>
nmap <silent> <F1> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
autocmd StdinReadPre * let s:std_in=1
hi Normal ctermbg=none
" Local config
let g:go_fmt_command = "goimports"
nnoremap <leader><tab> :buffers<CR>:buffer<Space>
set background=dark
let vim_markdown_preview_hotkey='<S-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Set the ctags file name
set tags=./.tags;
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:session_autoload = 'no'

let g:airline#extensions#tabline#fnamemod = ':.'


