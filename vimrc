let mapleader = " " " the leader knows all and sees all

set nocompatible
filetype off
set background=dark

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Sensible defaults
Plugin 'tpope/vim-sensible'

Plugin 'gmarik/vundle'
"Plugin 'mattn/calendar-vim'
Plugin 'ervandew/supertab'
"Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
"Plugin 'taglist.vim'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'Twinside/vim-hoogle'
"Plugin 'tpope/vim-rails'

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
let g:airline_theme = 'base16'

"Plugin 'airblade/vim-gitgutter'

" NERDTree - left hand side directory tree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup=0
"autocmd vimenter * NERDTree " focus on tree at startup
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <silent> <Leader>n :NERDTreeToggle<CR>

"Plugin 'L9'
"Plugin 'FuzzyFinder'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'Shougo/neocomplcache.vim'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'vim-scripts/gnupg.vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

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

" Remove distractions
"Plugin 'junegunn/goyo.vim'
"Plugin 'junegunn/limelight.vim'

" Rspec runner
Plugin 'thoughtbot/vim-rspec'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
let g:rspec_command = "!bundle exec rspec --format documentation --color {spec}"

" Zoom into panes
Plugin 'vim-scripts/ZoomWin'

function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  NERDTreeClose
  Limelight
endfunction

" Scala autocomplete + SortScalaImports
Plugin 'derekwyatt/vim-scala'

" ag search from within vim, always search from project root
Plugin 'rking/ag.vim'
let g:ag_working_path_mode="r"

autocmd! User GoyoEnter
autocmd  User GoyoEnter nested call <SID>goyo_enter()

call vundle#end()
syntax on
"set foldmethod=syntax
"set foldlevelstart=20
filetype plugin indent on

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if filereadable("~/.neocomplcacherc")
  source ~/.neocomplcacherc
endif

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
set background=dark
colorscheme solarized
"let g:UltiSnips={}
"let g:UltiSnips.always_use_first_snippet=1

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
