filetype off
call pathogen#infect()
call pathogen#helptags()
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
set winwidth=79

" Set leader key.
let mapleader = ","

" Adding #{} to AutoClose Plugin and activating it for String interpolation.
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/.git/*,*/node_modules/*,*/target/*,*/tmp/*,.DS_Store,*.so,*.swp,tags
map <Leader>ff :CtrlP<CR>
map <Leader>fb :CtrlPBuffer<CR>
map <Leader>fr :CtrlPMRU<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cycle through tags.
nmap <Tab> :tn<CR>
nmap <S-Tab> :tp<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>c \\\

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabularize
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CustomTabularPatterns()
  if exists('g:tabular_loaded')
    AddTabularPattern! equal /^[^=]*\zs=/
    AddTabularPattern! comma /,\zs/l1r0
    AddTabularPattern! colon /:\zs/l1r0

    nmap <Leader>a= :Tab equal<CR>
    vmap <Leader>a= :Tab equal<CR>
    nmap <Leader>a: :Tab colon<CR>
    vmap <Leader>a: :Tab colon<CR>
    nmap <Leader>a, :Tab comma<CR>
    vmap <Leader>a, :Tab comma<CR>
  endif
endfunction
autocmd VimEnter * call CustomTabularPatterns()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>nn :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rails
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>rav :AV<CR><C-w>l
command! Rroutes :Redit config/routes.rb
command! RTroutes :RTedit config/routes.rb
command! Rblueprints :Redit spec/support/blueprints.rb
command! RTblueprints :RTedit spec/support/blueprints.rb

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Expand current directory.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Clear the search buffer when hitting return.
nnoremap <CR> :nohlsearch<CR>

" Toggle between files.
nnoremap <Leader><Leader> <c-^>

" Refresh tags.
map <F3> :!ctags -R --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor *<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>tn :tabnew<CR>
nmap <Leader>tc :tabclose<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup less
  autocmd BufRead *.less set ft=less
augroup END

augroup mkd
  autocmd BufRead *.md,*.mkd,*.markdown set ft=markdown
augroup END

augroup ruby
  autocmd BufRead Gemfile set ft=ruby
  autocmd BufRead *.thor,Thorfile set ft=ruby
augroup END

au FileType coffee,ruby set tw=80
au FileType coffee,ruby set fo=croq

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
function! RunTests(args)
  if match(expand("%"), '\(_test.coffee\)$') != -1
    let spec = "NODE_ENV=test mocha --reporter spec"
  else
    if exists("b:rails_root") && filereadable(b:rails_root . "/script/spec")
      let spec = b:rails_root . "/script/spec"
    else
      let spec = "bundle exec rspec --color --format=documentation"
    end
  end
  let cmd = ":!" . spec . " " . a:args . " %"
  execute cmd
endfunction

" Run one rspec example or describe block based on cursor position.
map <Leader>ss :call RunTests("--line_number=" . <c-r>=line('.')<CR>)<CR>

" Run full rspec file.
map <Leader>sa :call RunTests("")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
color solarized
