let mapleader = "," " Set leader key.

set ts=2
set bs=2
set shiftwidth=2
set expandtab
set number " Show line numbers.
set nocompatible
filetype plugin indent on

syntax on
colorscheme molokai

" NERDTree
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
map <leader>n :NERDTreeToggle<cr>

" Adding #{} to AutoClose Plugin and activating it for String interpolation.
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" Cheat!
command! -complete=file -nargs=+ Cheat call Cheat(<q-args>)
function! Cheat(command)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  execute 'silent $read !cheat '.escape(a:command,'%#')
  setlocal nomodifiable
  1
endfunction
