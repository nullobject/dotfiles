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
map <leader>n :NERDTreeToggle<cr>

" Adding #{} to AutoClose Plugin and activating it for String interpolation.
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" leader shortcuts for Rails commands
map <leader>rm :Rmodel
map <leader>rc :Rcontroller
map <leader>rv :Rview
map <leader>ru :Runittest
map <leader>rf :Rfunctionaltest
map <leader>rtm :RTmodel
map <leader>rtc :RTcontroller
map <leader>rtv :RTview
map <leader>rtu :RTunittest
map <leader>rtf :RTfunctionaltest
map <leader>rsm :RSmodel
map <leader>rsc :RScontroller
map <leader>rsv :RSview
map <leader>rsu :RSunittest
map <leader>rsf :RSfunctionaltest
map <leader>rav :AV<cr><C-w>L

" Hide search highlighting
map <leader>h :set invhls<cr>

" Close tab
map <leader>tc :tabc<cr>

vmap <c-h> !format_hash.rb<cr>
vmap <c-m> !format_comment_block.rb<cr>

augroup mkd
  autocmd BufRead *.md,*.mkd,*.markdown set ft=mkd ai formatoptions=tcroqn2 comments=n:>
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

vmap o :s/^/# /<cr>
vmap i :s/^# \?//<cr>
nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>

autocmd BufWritePre * :%s/\t/  /eg  " nuke tabs
autocmd BufWritePre * :%s/\s\+$//eg " nuke lines containing only whitespace

" Edit factories
command! Rroutes      :Redit config/routes.rb
command! RTroutes     :RTedit config/routes.rb
command! Rblueprints  :Redit spec/blueprints.rb
command! RTblueprints :RTedit spec/blueprints.rb
