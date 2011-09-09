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
  autocmd BufRead *.less set ft=less
augroup END

"Auto reload this file when editing it
au! BufWritePost .vimrc source %

vmap <c-o> :s/^/# /<cr>
vmap <c-i> :s/^# \?//<cr>
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
   let spec = "source ~/.rvm/scripts/rvm && bundle exec rspec --no-color --format=documentation"
 end
 let cmd = ":! " . spec . " " . a:args . " %"
 execute cmd
endfunction

" Mappings
" run one rspec example or describe block based on cursor position
map <leader>s :call RunSpec("--line_number=" . <c-r>=line('.')<cr>)<cr>
" run full rspec file
map <leader>S :call RunSpec("")<cr>
