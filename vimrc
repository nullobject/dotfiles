set nocompatible

set vb
set tabstop=2
set backspace=2
set shiftwidth=2
set expandtab
set number " show line numbers
set laststatus=2 " show the status line
set ruler " show the cursor position
set hlsearch "highlight search results
set incsearch
set wildmode=longest,list
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

filetype plugin indent on

syntax on
colorscheme molokai

let mapleader = ";" " set leader key

" NERDTree
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
map <leader>n :NERDTreeToggle<CR>

" Adding #{} to AutoClose Plugin and activating it for String interpolation.
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" Leader shortcuts for Rails commands
map <Leader>rm :Rmodel
map <Leader>rc :Rcontroller
map <Leader>rv :Rview
map <Leader>ru :Runittest
map <Leader>rf :Rfunctionaltest
map <Leader>rtm :RTmodel
map <Leader>rtc :RTcontroller
map <Leader>rtv :RTview
map <Leader>rtu :RTunittest
map <Leader>rtf :RTfunctionaltest
map <Leader>rsm :RSmodel
map <Leader>rsc :RScontroller
map <Leader>rsv :RSview
map <Leader>rsu :RSunittest
map <Leader>rsf :RSfunctionaltest
map <Leader>rav :AV<CR><C-w>L

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Close tab
map <Leader>tc :tabc <CR>

vmap <c-h> !format_hash.rb<CR>
vmap <c-m> !format_comment_block.rb<CR>

augroup mkd
  autocmd BufRead *.md,*.mkd,*.markdown set ai formatoptions=tcroqn2 comments=n:>
augroup END

augroup ruby
  autocmd BufRead *.thor,Thorfile set ft=ruby
  autocmd BufRead Gemfile set ft=ruby
augroup END

augroup less
  autocmd BufRead *.less set ft=css
augroup END

"Auto reload this file when editing it
au! BufWritePost .vimrc source %

vmap o :s/^/# /<CR>
vmap i :s/^# //<CR>
nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>

autocmd BufWritePre * :%s/\t/  /e
autocmd BufWritePre * :%s/\s\+$//e

" Edit factories
command! Rroutes :Redit config/routes.rb
command! RTroutes :RTedit config/routes.rb
command! Rblueprints :Redit spec/blueprints.rb
command! RTblueprints :RTedit spec/blueprints.rb
