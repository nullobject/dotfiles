call plug#begin('~/.local/share/nvim/plugged')

" editorconfig.org
Plug 'editorconfig/editorconfig-vim'

" Sensible defaults.
Plug 'tpope/vim-sensible'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Power substitution
Plug 'tpope/vim-abolish'

" Argument shifting
Plug 'PeterRincker/vim-argumentative'

" Power status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'dracula'

" Pair key mappings
Plug 'tpope/vim-unimpaired'

" Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
" Plug 'kana/vim-textobj-user'
" Plug 'nelstrom/vim-textobj-rubyblock'

" Power surrounding
Plug 'tpope/vim-surround'

" Power commenting
Plug 'tpope/vim-commentary'

" Merging tabs
Plug 'vim-scripts/Tabmerge'

" Find and replace
Plug 'brooth/far.vim'

" Finder
Plug 'ctrlpvim/ctrlp.vim'
set wildignore+=.DS_Store,tags,*/.git/*,*/dist/*,*/node_modules/*,public

" Ack
" Plug 'mileszs/ack.vim'
" if executable('rg')
"   let g:ackprg = 'rg --vimgrep'
" endif

" Async tasks
" Plug 'tpope/vim-dispatch'

" NERDTree
" Plug 'scrooloose/nerdtree'

" Power tab key
" Plug 'ervandew/supertab'

" Power text alignment
Plug 'junegunn/vim-easy-align'

" Colour schemes
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

" Syntax
Plug 'Cognoscan/vim-vhdl'
Plug 'cespare/vim-toml'
Plug 'derekwyatt/vim-scala'
Plug 'ekalinin/Dockerfile.vim'
Plug 'frigoeu/psc-ide-vim'
Plug 'hashivim/vim-terraform'
Plug 'lunaru/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'pearofducks/ansible-vim'
Plug 'raichoo/haskell-vim'
Plug 'raichoo/purescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'smerrill/vcl-vim-plugin'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-markdown'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'wizicer/vim-jison'

" Initialize plugin system
call plug#end()

filetype plugin indent on

set history=1000
set mouse=a " Enable mouse for scrolling and resizing
set visualbell " Flash screen instead of beeping on errors
set title " Set window's title to reflect the current file
set tabstop=2 " Show existing tab with 2 spaces
set shiftwidth=2 " Use 2 spaces when indenting
set expandtab
set smarttab
set autoindent " Newlines inherit indentation of previous lines
set backspace=indent,eol,start
set scrolloff=3 " Number of lines to keep above/below cursor
set number " Show line numbers
set relativenumber " Show relative line numbers
set laststatus=2 " Show the status line
set ruler " Show the cursor position
set autoread " Re-read files if they change outside vim
set showmatch

set incsearch " Highlight while searching
set hlsearch " Highlight search results
set ignorecase " Search should be case-insensitive by default
set smartcase " Search should be case-sensitive only if it contains upper-case characters

set wildmenu
set wildmode=longest,list
set pastetoggle=<F2>
set cursorline " Highlight current line
set winwidth=79
set hidden " Prevents losing undo history after save
set backupdir=~/tmp
set directory=~/tmp
set noswapfile
set nobackup
" set shortmess=atI
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

noremap - :Vex<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle comment for current line.
noremap <Leader>c :Commentary<CR>

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

" map <Leader>nn :NERDTreeToggle<CR>
" map <Leader>nf :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <Leader>tt :tabe<Space>%%<CR>
noremap <Leader>tc :tabc<CR>
noremap <Leader>tm :Tabmerge<CR>

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
" nnoremap <CR> :nohlsearch<CR>

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

" Sort the selection.
vmap <Leader>r :!sort<CR>

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

autocmd FileType javascript,ruby setlocal tw=80
autocmd FileType javascript,ruby setlocal fo=croq
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
autocmd FileType javascript,md,ruby,terraform autocmd BufWritePre * :%s/\t/  /eg

" Nuke lines containing only whitespace.
autocmd BufWritePre * :%s/\s\+$//eg

" Ensure makefiles use TAB characters.
autocmd FileType make setlocal noexpandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable true colours.
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
color dracula
syntax on " Enable syntax highlighting

let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
let g:netrw_winsize = 20
