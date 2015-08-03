set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle plugin manager
Plugin 'gmarik/vundle'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Power substitution
Plugin 'tpope/vim-abolish'

" Power matching with % key
Plugin 'matchit.zip'

" Ruby block selecting
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Power status line
Plugin 'bling/vim-airline'
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Pair key mappings
Plugin 'tpope/vim-unimpaired'

" Rails
Plugin 'tpope/vim-rails'

" Autocomplete ruby blocks
Plugin 'tpope/vim-endwise'

" Cucumber
Plugin 'tpope/vim-cucumber'

" Markdown
Plugin 'tpope/vim-markdown'

" CoffeeScript
Plugin 'kchmck/vim-coffee-script'
Plugin 'mintplant/vim-literate-coffeescript'

" LESS
Plugin 'lunaru/vim-less'

" RSpec
Plugin 'thoughtbot/vim-rspec'

" Power surrounding
Plugin 'tpope/vim-surround'

" Power HTML tags
Plugin 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1

" Power repeating
Plugin 'tpope/vim-repeat'

" Power commenting
Plugin 'tpope/vim-commentary'

" Finder
Plugin 'kien/ctrlp.vim'
set wildignore+=.DS_Store,tags,*/.git/*,*/dist/*,*/node_modules/*,*/public/*,*/target/*

" NERDTree
Plugin 'scrooloose/nerdtree'

" Solarized colour scheme
Plugin 'altercation/vim-colors-solarized'

" Power tab key
Plugin 'ervandew/supertab'

" Power text alignment
Plugin 'godlygeek/tabular'

" Silver Searcher wrapper
Plugin 'rking/ag.vim'

" Async tasks
Plugin 'tpope/vim-dispatch'

" Puppet
Plugin 'rodjek/vim-puppet'

" Objective-C
Plugin 'msanders/cocoa.vim'

" Action Script
Plugin 'jeroenbourgois/vim-actionscript'

" Haskell
Plugin 'raichoo/haskell-vim'

" Syntax checking
Plugin 'scrooloose/syntastic'

" PureScript
Plugin 'raichoo/purescript-vim'

" Swift
Plugin 'Keithbsmiley/swift.vim'

" HTML + JS
Plugin 'othree/yajs.vim'
Plugin 'othree/html5.vim'

" Scala
Plugin 'derekwyatt/vim-scala'

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

" Ensure new splits are opened below the current window.
set splitbelow

" Ensure new vsplits are opened to the right of the current window.
set splitright

" Don't wait so long for the next keypress (useful for ambiguous leader keys).
set timeoutlen=500

" Set leader key.
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Explore
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map - :Explore<CR>

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
" nnoremap <CR> :nohlsearch<CR>

" Toggle between files.
nnoremap <Leader><Leader> <C-^>

" Refresh tags.
map <F3> :!ctags -R --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor *<CR>

" Re-indent the buffer.
map <Leader>i mmgg=G`m<CR>

" Put the text in the * register in paste mode.
map <Leader>p :set paste<CR>o<Esc>"*]p:set nopaste<CR>

" Yank the buffer to the * register.
map <Leader>y ggVG"*y

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
  " Set markdown format.
  autocmd BufRead,BufNewFile *.md set ft=markdown

  " Enable spellchecking for markdown.
  autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

augroup ruby
  autocmd BufRead Gemfile set ft=ruby
  autocmd BufRead *.thor,Thorfile set ft=ruby
augroup END

augroup coffee
  autocmd BufRead,BufNewFile *.cjsx set ft=coffee
augroup END

augroup purescript
  " Add comment format for commentary plugin.
  autocmd FileType purescript set commentstring=--\ %s
augroup END

autocmd FileType coffee,ruby setlocal tw=80
autocmd FileType coffee,ruby setlocal fo=croq

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Paths
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nuke tabs.
autocmd FileType coffee,ruby autocmd BufWritePre * :%s/\t/  /eg

" Nuke lines containing only whitespace.
autocmd BufWritePre * :%s/\s\+$//eg

" Ensure makefiles use TAB characters.
autocmd FileType make setlocal noexpandtab

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
