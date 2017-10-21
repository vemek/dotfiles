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

" Key binding pairs
Plug 'tpope/vim-unimpaired'

" Codebase search
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep --smart-case'

call plug#end()
" }}}

" Colours {{{
syntax enable
set background=dark
colorscheme solarized
" }}}

" Key bindings {{{
let mapleader = " " " the leader knows all and sees all
nnoremap Q <nop>
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
" Search for current word in codebase
nmap <M-k>    :Ack! "\b<cword>\b" <CR>
nmap <Esc>k   :Ack! "\b<cword>\b" <CR>
" Close quickfix window
nmap \x :cclose <CR>
" }}}
