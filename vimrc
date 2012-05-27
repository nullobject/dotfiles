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

let mapleader = ";" " set leader key

" ctrlp
set wildignore+=*/.git/*,*/node_modules/*,*/tmp/*,.DS_Store,*.so,*.swp

" Adding #{} to AutoClose Plugin and activating it for String interpolation.
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" Rails plugin tweaks
map <Leader>rav :AV<CR><C-w>L
command! Rroutes :Redit config/routes.rb
command! RTroutes :RTedit config/routes.rb
command! Rblueprints :Redit spec/blueprints.rb
command! RTblueprints :RTedit spec/blueprints.rb

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<CR>

" Toggle between files
nnoremap <Leader><Leader> <c-^>

" Hide search highlighting
map <Leader>h :set invhls<CR>

" Close tab
map <Leader>tc :tabc<CR>

vmap <c-h> !~/bin/format_hash.rb<CR>
vmap <c-m> !~/bin/format_comment_block.rb<CR>

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

" Auto reload this file when editing it
au! BufWritePost .vimrc source %

nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>

autocmd BufWritePre * :%s/\t/  /eg  " nuke tabs
autocmd BufWritePre * :%s/\s\+$//eg " nuke lines containing only whitespace

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
map <Leader>s :call RunSpec("--line_number=" . <c-r>=line('.')<CR>)<CR>
" run full rspec file
map <Leader>S :call RunSpec("")<CR>

" Toggle comments
map <Leader>c <plug>NERDCommenterToggle<CR>
imap <Leader>c <esc><plug>NERDCommenterToggle<CR>i

" Default gui color scheme
set t_Co=256
color tomorrow-night-bright
