set t_Co=256

filetype off
call pathogen#infect()
filetype plugin indent on

syntax on

set nocompatible
set vb
set tabstop=2
set backspace=2
set shiftwidth=2
set expandtab
set number " show line numbers
set laststatus=2 " show the status line
set ruler " show the cursor position
set hlsearch " highlight search results
set incsearch
set wildmode=longest,list
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set pastetoggle=<F2>
" set mouse=a

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
  autocmd BufRead *.md,*.mkd,*.markdown set ft=markdown
augroup END

augroup ruby
  autocmd BufRead *.thor,Thorfile set ft=ruby
  autocmd BufRead Gemfile set ft=ruby
augroup END

augroup less
  autocmd BufRead *.less set ft=less
augroup END

"Auto reload this file when editing it
au! BufWritePost .vimrc source %

nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>

autocmd BufWritePre * :%s/\t/  /eg  " nuke tabs
autocmd BufWritePre * :%s/\s\+$//eg " nuke lines containing only whitespace

" Edit factories
command! Rroutes      :Redit config/routes.rb
command! RTroutes     :RTedit config/routes.rb
command! Rblueprints  :Redit spec/blueprints.rb
command! RTblueprints :RTedit spec/blueprints.rb

" Execute open rspec buffer
function! RunSpec(args)
 if exists("b:rails_root") && filereadable(b:rails_root . "/script/spec")
   let spec = b:rails_root . "/script/spec"
 else
   let spec = "bundle exec rspec --no-color --format=documentation"
 end
 let cmd = ":!" . spec . " " . a:args . " %"
 execute cmd
endfunction

" Mappings
" run one rspec example or describe block based on cursor position
map <leader>s :call RunSpec("--line_number=" . <c-r>=line('.')<cr>)<cr>
" run full rspec file
map <leader>S :call RunSpec("")<cr>

" Command-Shift-F for Ack
map <D-F> :Ack<space>

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Command-][ to increase/decrease indentation
vmap <D-]> >gv
vmap <D-[> <gv

" Map Command-# to switch tabs
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt

" Command-Option-ArrowKey to switch viewports
map <D-M-Up> <C-w>k
imap <D-M-Up> <Esc> <C-w>k
map <D-M-Down> <C-w>j
imap <D-M-Down> <Esc> <C-w>j
map <D-M-Right> <C-w>l
imap <D-M-Right> <Esc> <C-w>l
map <D-M-Left> <C-w>h
imap <D-M-Left> <C-w>h

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

" Bubble single lines
nmap <D-M-Up> [e
nmap <D-M-Down> ]e

" Bubble multiple lines
vmap <D-M-Up> [egv
vmap <D-M-Down> ]egv

" Default gui color scheme
color molokai
