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

" FuzzyFinderTextMate
map <Leader>f :FuzzyFinderTextMate<CR>
map <F5> :ruby finder.rescan!<CR>
let g:fuzzy_ceiling = 50000

let g:fuzzy_ignore = "*.svn"
let g:fuzzy_ignore = "*.swp"
let g:fuzzy_ignore = "*.jpg"
let g:fuzzy_ignore = "*.gif"
let g:fuzzy_ignore = "*~"

augroup mkd
  autocmd BufRead *.mkd,*.markdown set ai formatoptions=tcroqn2 comments=n:>
augroup END

augroup ruby
  autocmd BufRead *.thor,Thorfile set ft=ruby
augroup END

"Auto reload this file when editing it
au! BufWritePost .vimrc source %

map <F3> :w<CR>:!osascript -e 'tell application "Safari" to do JavaScript "window.location.reload()" in front document'<CR>

vmap o :s/^/# /<CR>
vmap i :s/^# //<CR>
nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>

autocmd BufWritePre * :%s/\s\+$//e
