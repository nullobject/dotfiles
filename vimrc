call plug#begin('~/.vim/plugged')

" editorconfig.org
Plug 'editorconfig/editorconfig-vim'

" Sensible defaults.
Plug 'tpope/vim-sensible'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Power substitution
Plug 'tpope/vim-abolish'

" Power matching with % key
Plug 'vim-scripts/matchit.zip'

" Ruby block selecting
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" Power status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'molokai'

" Multiple cursors
" Plug 'terryma/vim-multiple-cursors'

" Pair key mappings
Plug 'tpope/vim-unimpaired'

" Rails
Plug 'tpope/vim-rails'

" Autocomplete ruby blocks
Plug 'tpope/vim-endwise'

" Cucumber
Plug 'tpope/vim-cucumber'

" Markdown
Plug 'tpope/vim-markdown'

" CoffeeScript
Plug 'kchmck/vim-coffee-script'

" LESS
Plug 'lunaru/vim-less'

" RSpec
Plug 'thoughtbot/vim-rspec'

" Power surrounding
Plug 'tpope/vim-surround'

" Power HTML tags
Plug 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1

" Power repeating
Plug 'tpope/vim-repeat'

" Power commenting
Plug 'tpope/vim-commentary'

" Finder
Plug 'ctrlpvim/ctrlp.vim'
set wildignore+=.DS_Store,tags,*/.git/*,*/dist/*,*/node_modules/*,public

" NERDTree
Plug 'scrooloose/nerdtree'

" Colour schemes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" Power tab key
Plug 'ervandew/supertab'

" Power text alignment
" Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'

" Ack
" Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" Find and replace
Plug 'brooth/far.vim'

" Async tasks
Plug 'tpope/vim-dispatch'

" Objective-C
" Plug 'msanders/cocoa.vim'

" Action Script
" Plug 'jeroenbourgois/vim-actionscript'

" Haskell
Plug 'raichoo/haskell-vim'

" Syntax checking
" Plug 'scrooloose/syntastic'

" PureScript
Plug 'raichoo/purescript-vim'

" Swift
" Plug 'Keithbsmiley/swift.vim'

" HTML + JS
Plug 'pangloss/vim-javascript'

" Scala
Plug 'derekwyatt/vim-scala'

" Argument shifting
Plug 'PeterRincker/vim-argumentative'

Plug 'vim-scripts/Tabmerge'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

Plug 'Cognoscan/vim-vhdl'
Plug 'vhda/verilog_systemverilog.vim'

Plug 'hashivim/vim-terraform'

Plug 'ekalinin/Dockerfile.vim'

Plug 'pearofducks/ansible-vim'

" Varnish
Plug 'smerrill/vcl-vim-plugin'

" Linting
Plug 'w0rp/ale'
let g:ale_linters = {
\  'javascript': ['standard'],
\  'ruby': ['rubocop']
\}
let g:ale_fixers = {
\  'javascript': ['standard'],
\  'ruby': ['rubocop']
\}
let g:ale_pattern_options = {
\ 'node_modules': {'ale_linters': [], 'ale_fixers': []}
\}
let g:ale_pattern_options_enabled = 1
nmap <F8> <Plug>(ale_fix)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Initialize plugin system
call plug#end()

filetype plugin indent on

set mouse=a
set visualbell
set title
set tabstop=2
set backspace=indent,eol,start
set shiftwidth=2
set scrolloff=3
set expandtab
set number " Show line numbers
set laststatus=2 " Show the status line
set ruler " Show the cursor position
set autoread " Re-read files if they change outside vim
set smarttab
set autoindent
set showmatch

set incsearch  " Highlight while searching
set hlsearch   " Highlight search results
" set ignorecase " Search should be case-insensitive by default
" set smartcase  " Search should be case-sensitive only if it contains upper-case characters

set wildmode=longest,list
set pastetoggle=<F2>
set cursorline " Highlight current line
set winwidth=79
set hidden " Prevents losing undo history after save
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
map <Leader>c :Commentary<CR>

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
" Easy Align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
map <Leader>p :set paste<CR>"*p:set nopaste<CR>

" Yank the entire buffer to the * register.
nmap <Leader>y ggVG"*y

" Yank the selection to the * register.
vmap <Leader>y "*y

map <Leader>r :!sort<CR>

" Select the pasted text.
nnoremap gp `[v`]

" Terminal mappings.
if has('nvim')
  set shell=zsh

  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l

  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l

  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l

  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open the command-line with an empty search string.
nmap <Leader>ff :Ack ""<Left>

" Search for the selected text.
vmap <Leader>ff yy:Ack ""<Left><C-R>"<CR>

nmap <Leader>fc :cclose<CR>
nmap <Leader>fo :copen<CR>

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

augroup purescript
  " Add comment format for commentary plugin.
  autocmd FileType purescript set commentstring=--\ %s
augroup END

augroup vhdl
  " Add comment format for commentary plugin.
  autocmd FileType vhdl setlocal commentstring=--\ %s
augroup END

augroup terraform
  " Add comment format for commentary plugin.
  autocmd FileType terraform setlocal commentstring=#\ %s
augroup END

autocmd FileType coffee,ruby setlocal tw=80
autocmd FileType coffee,ruby setlocal fo=croq
autocmd FileType gitcommit setlocal tw=0

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
autocmd FileType coffee,md,ruby,terraform autocmd BufWritePre * :%s/\t/  /eg

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
color molokai
syntax on
