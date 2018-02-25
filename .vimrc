set number relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'vimspell'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Sirver/ultisnips'
Plugin 'tmhedberg/matchit'
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-fugitive'
Plugin 'universal-ctags/ctags'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'lervag/vimtex'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()			" required
filetype plugin indent on	" required

augroup numbertoggle
 autocmd!
 autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
 autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

"autocmd VimResized * wincmd =
let mapleader = "\<Space>"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl'] }
let g:ycm_always_populate_location_list = 1

" Syntax highlighter for handlebars
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
set tabstop=4
set shiftwidth=4
set hlsearch
set incsearch
set splitbelow
set splitright
syn on se title
set background=dark
let g:solarized_termcolors=16
syntax enable
colorscheme PaperColor

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarOpen j<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap // <leader>c<space>
vmap // <leader>cs
map <F3> :call CurtineIncSw()<CR>
noremap <leader>gD :YcmCompleter GoToDefinition<CR>
noremap <leader>gd :YcmCompleter GoToDeclaration<CR>
noremap <leader>gi :YcmCompleter GoToInclude<CR>
noremap <silent> <up> :exe "resize +1" <CR>
noremap <silent> <down> :exe "resize -1" <CR>
noremap <silent> <left> :exe "vertical resize +1" <CR>
noremap <silent> <right> :exe "vertical resize -1" <CR>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Remap jj to <ESC>
inoremap jj <ESC>

nnoremap <leader>ls :!tmux run-shell -t 2 "ls"<CR><C-L>
