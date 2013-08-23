set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Git wrapper
Bundle 'tpope/vim-fugitive'

" Power substitution
Bundle 'tpope/vim-abolish'

" Power matching with % key
Bundle 'tsaleh/vim-matchit'

" Ruby block selecting
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Power status line
Bundle 'bling/vim-airline'
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

" Multiple cursors
Bundle 'terryma/vim-multiple-cursors'

" Rails
Bundle 'tpope/vim-rails'

" Autocomplete ruby blocks
Bundle 'tpope/vim-endwise'

" Cuke
Bundle 'tpope/vim-cucumber'

" Markdown
Bundle 'tpope/vim-markdown'

" CoffeeScript
Bundle "kchmck/vim-coffee-script"

" LESS
Bundle "lunaru/vim-less"

" RSpec
Bundle "thoughtbot/vim-rspec"

" Power surrounding
Bundle 'tpope/vim-surround'

" Power HTML tags
Bundle 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1

" Power repeating
Bundle 'tpope/vim-repeat'

" Power commenting
Bundle 'tpope/vim-commentary'

" Finder
Bundle "kien/ctrlp.vim"
set wildignore+=.DS_Store,tags,*/.git/*,*/dist/*,*/node_modules/*,*/public/*,*/target/*

" NERDTree
Bundle "scrooloose/nerdtree"

" Solarized colour scheme
Bundle "altercation/vim-colors-solarized"

" Power tab key
Bundle "ervandew/supertab"

" Power text alignment
Bundle "godlygeek/tabular"

" The Silver Searcher wrapper
Bundle "rking/ag.vim"

" Async tasks
Bundle "tpope/vim-dispatch"

" Puppet
Bundle "rodjek/vim-puppet"

filetype plugin indent on

set mouse=a
set visualbell
set title
set tabstop=2
set backspace=indent,eol,start
set shiftwidth=2
set scrolloff=3
set expandtab
set relativenumber " Show relative line numbers.
set laststatus=2 " show the status line
set ruler " show the cursor position
set autoread " Re-read files if they change outside vim.
set smarttab
set autoindent
set showmatch

set incsearch  " Highlight while searching
set hlsearch   " Highlight search results
set ignorecase " Search should be case-insensitive by default
set smartcase  " Search should be case-sensitive only if it contains upper-case characters

set wildmode=longest,list
set pastetoggle=<F2>
set cursorline " highlight current line
set winwidth=79
set hidden " prevents losing undo history after save
set backupdir=~/tmp
set directory=~/tmp
set noswapfile
set shortmess=atI
set shell=bash

" Don't wait so long for the next keypress (useful for ambiguous leader keys).
set timeoutlen=500

" Set leader key.
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>c \\\

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabularize
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CustomTabularPatterns()
  if exists('g:tabular_loaded')
    AddTabularPattern! colon  /:\zs/l1r0
    AddTabularPattern! equal  /^[^=]*\zs=/
    AddTabularPattern! rocket /^[^=]*\zs=>/

    vmap <Leader>a: :Tab colon<CR>
    vmap <Leader>a= :Tab equal<CR>
    vmap <Leader>a> :Tab rocket<CR>
  endif
endfunction
autocmd VimEnter * call CustomTabularPatterns()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>nn :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>tt :tabe<Space>%%
map <Leader>tc :tabc<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rails
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Rroutes :Redit config/routes.rb
command! RTroutes :RTedit config/routes.rb

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Expand current directory.
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Stop highlighting the search.
nnoremap <CR> :nohlsearch<CR>

" Toggle between files.
nnoremap <Leader><Leader> <C-^>

" Refresh tags.
map <F3> :!ctags -R --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor *<CR>

" Re-indent the buffer.
map <Leader>i mmgg=G`m<CR>

" Put the text in the * register in paste mode.
map <Leader>p :set paste<CR>o<Esc>"*]p:set nopaste<CR>

" Yank the buffer to the * register.
" map <Leader>y ggVG"*y

map <Leader>r :!sort<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open the command-line with an empty search string.
nmap <Leader>ff :Ag ""<Left>

" Search for the selected text.
vmap <Leader>ff yy:Ag ""<Left><C-R>"<CR>

nmap <Leader>fc :cclose<CR>
nmap <Leader>fo :copen<CR>
nmap <Tab> :cnext<CR>
nmap <S-Tab> :cprevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>gc :Gcommit -m ""<Left>
map <Leader>gac :Gcommit -a -m ""<Left>
map <Leader>gs :Gstatus<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup less
  autocmd BufRead *.less set ft=less
augroup END

augroup mkd
  autocmd BufRead *.md,*.mkd,*.markdown set ft=markdown
augroup END

augroup ruby
  autocmd BufRead Gemfile set ft=ruby
  autocmd BufRead *.thor,Thorfile set ft=ruby
augroup END

au FileType coffee,ruby set tw=80
au FileType coffee,ruby set fo=croq

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nuke tabs.
autocmd BufWritePre * :%s/\t/  /eg

" Nuke lines containing only whitespace.
autocmd BufWritePre * :%s/\s\+$//eg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RSpec
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>st :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
color solarized
syntax on
