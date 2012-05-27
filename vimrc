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
set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters
set incsearch
set wildmode=longest,list
set pastetoggle=<F2>
set shell=bash
set cursorline " highlight current line

" Set leader key.
let mapleader = ";"

" Adding #{} to AutoClose Plugin and activating it for String interpolation.
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/.git/*,*/node_modules/*,*/tmp/*,.DS_Store,*.so,*.swp
map <Leader>f :CtrlP<CR>
map <Leader>fb :CtrlPBuffer<CR>
map <Leader>fr :CtrlPMRU<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>c \\\

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rails
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>rav :AV<CR><C-w>L
command! Rroutes :Redit config/routes.rb
command! RTroutes :RTedit config/routes.rb
command! Rblueprints :Redit spec/blueprints.rb
command! RTblueprints :RTedit spec/blueprints.rb

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Expand current directory.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Clear the search buffer when hitting return.
:nnoremap <CR> :nohlsearch<CR>

" Toggle between files
nnoremap <Leader><Leader> <c-^>

" Close tab.
map <Leader>tc :tabc<CR>

" Cycle through buffers.
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>

vmap <c-h> !~/bin/format_hash.rb<CR>
vmap <c-m> !~/bin/format_comment_block.rb<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
function! RunSpec(args)
 if exists("b:rails_root") && filereadable(b:rails_root . "/script/spec")
   let spec = b:rails_root . "/script/spec"
 else
   let spec = "bundle exec rspec --no-color --format=documentation"
 end
 let cmd = ":!" . spec . " " . a:args . " %"
 execute cmd
endfunction

" Run one rspec example or describe block based on cursor position.
map <Leader>s :call RunSpec("--line_number=" . <c-r>=line('.')<CR>)<CR>

" Run full rspec file.
map <Leader>S :call RunSpec("")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
color tomorrow-night-bright
