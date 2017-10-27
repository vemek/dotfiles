" vemek - .vimrc
"

" Vim Plug {{{
call plug#begin('~/.vim/plugged')

" colour scheme
Plug 'altercation/vim-colors-solarized'
let g:solarized_termtrans=1
let g:solarized_termcolors=256

" sensible defaults
Plug 'tpope/vim-sensible'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git gutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 1

" Git commands
Plug 'tpope/vim-fugitive'

" Key binding pairs
Plug 'tpope/vim-unimpaired'

" Codebase search
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep --smart-case'

" Automatically close blocks
Plug 'tpope/vim-endwise'

" Language packs
Plug 'sheerun/vim-polyglot'

" Syntax checker
Plug 'w0rp/ale'

" Multiple cursors with Ctrl-n
Plug 'terryma/vim-multiple-cursors'

" Better line numbering
"Plug 'myusuf3/numbers.vim'

" Autocompletion
Plug 'valloric/youcompleteme'

" Rspec runner
Plug 'thoughtbot/vim-rspec'
let g:rspec_command = "!bundle exec rspec --format documentation --color {spec}"

" Org Mode
Plug 'jceb/vim-orgmode'

call plug#end()
" }}}

" Spaces & Tabs {{{
set tabstop=2
set expandtab " use spaces for tabs
set softtabstop=2 " 4 space tab
set shiftwidth=2
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}

" Colours {{{
syntax enable
set background=dark
colorscheme solarized
" Highlight extra whitespace in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}}

" Key bindings {{{
let mapleader = " " " the leader knows all and sees all
let maplocalleader = "\\"
nnoremap Q <nop>
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
" Search for current word in codebase
nmap <M-k>    :Ack! "\b<cword>\b" <CR>
nmap <Esc>k   :Ack! "\b<cword>\b" <CR>
" Close quickfix window
nmap \x :cclose <CR>
" Run Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
" }}}

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
