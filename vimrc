let mapleader = " " " the leader knows all and sees all

set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Sensible defaults
Plugin 'tpope/vim-sensible'
"
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

" syntastic - gutter syntax checking
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq=0

" Status line shininess
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:ttimeoutlen = 50
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme = 'base16_solarized'

"Plugin 'airblade/vim-gitgutter'

" NERDTree - left hand side directory tree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup=0
"autocmd vimenter * NERDTree " focus on tree at startup
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <silent> <Leader>n :NERDTreeToggle<CR>

Plugin 'terryma/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'

" Fuzzy file search
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

" Endwise - closing tag in ruby
Plugin 'tpope/vim-endwise'

" mustache and handlebars templates syntax
Plugin 'mustache/vim-mustache-handlebars'

" Rspec runner
Plugin 'thoughtbot/vim-rspec'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
let g:rspec_command = "!bundle exec rspec --format documentation --color {spec}"

" ag search from within vim, always search from project root
Plugin 'rking/ag.vim'
let g:ag_working_path_mode="r"

call vundle#end()
filetype plugin indent on

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" bindings
map <F2> :NERDTreeToggle<CR>
map <F3> :FufBuffer<CR>

set ts=2
set shiftwidth=2
set expandtab
set number
set backspace=indent,eol,start
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show
"let g:Powerline_symbols = 'fancy'

syntax enable
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
