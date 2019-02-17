set number relativenumber
set smartindent
set tabstop=4
set shiftwidth=4
set nocompatible	" be iMproved, required
set encoding=utf-8
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'broesler/jupyter-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'vimspell'
Plugin 'Valloric/YouCompleteMe', 
Plugin 'Sirver/ultisnips'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'universal-ctags/ctags'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'lervag/vimtex'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'benmills/vimux'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'jansenm/vim-cmake'
Plugin 'wincent/terminus'
Plugin 'jiangmiao/auto-pairs'
Plugin 'petrbroz/vim-glsl'
Plugin 'rhysd/vim-clang-format'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'CoatiSoftware/vim-sourcetrail'
Plugin 'petRUShka/vim-opencl'
Plugin 'google/vim-maktaba'
Plugin 'shime/vim-livedown'
Plugin 'google/vim-codefmt'
"Plugin 'ternjs/tern_for_vim', {'for': 'javascript'}
Plugin 'honza/vim-snippets'
Plugin 'leafgarland/typescript-vim'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ivanov/vim-ipython'
Plugin 'szymonmaszke/vimpyter'
"Plugin 'ervandew/supertab'
"Plugin 'svermeulen/vim-easyclip'
Plugin 'tpope/vim-repeat'

call vundle#end()			" required
filetype plugin indent on	" required

augroup numbertoggle
 autocmd!
 autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
 autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

"autocmd VimResized * wincmd =
let mapleader = "\<Space>"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_global_ycm_extra_conf.py'
let g:ycm_semantic_triggers =  { 'cpp,cuda,objcpp' : ['->', '.', '::', 're!gl'] }
let g:ycm_always_populate_location_list = 1

" Syntax highlighter for handlebars
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

set hlsearch
set incsearch
set splitbelow
set splitright
syn on se title
set background=dark
let g:solarized_termcolors=16
syntax enable
colorscheme PaperColor
"setting statusline theme
let g:airline_theme = 'powerlineish'

" Disable Arrow keys in Escape mode
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarOpen j<CR>
nmap <F2> :NERDTreeToggle<CR>
"nmap // <leader>c<space>
"vmap // <leader>cs
map <F3> :call CurtineIncSw()<CR>
noremap <leader>gD :YcmCompleter GoToDefinition<CR>
noremap <leader>gd :YcmCompleter GoToDeclaration<CR>
noremap <leader>gi :YcmCompleter GoToInclude<CR>
noremap <leader>gr :YcmCompleter GoToReferences<CR>
noremap <leader>gI :YcmCompleter GoToImplementation<CR>
"noremap <silent> <up> :exe "resize +1" <CR>
"noremap <silent> <down> :exe "resize -1" <CR>
"noremap <silent> <left> :exe "vertical resize +1" <CR>
"noremap <silent> <right> :exe "vertical resize -1" <CR>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[5 q'" 

let g:ycm_python_binary_path = 'python'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" enhance YCM JS completion with tern's smarts
"autocmd FileType javascript setlocal omnifunc=tern#Complete

map <C-t>h :tabr<cr>

map <C-t>l :tabl<cr>
map <C-t>p :tabp<cr>

map <C-t>n :tabn<cr>
map <C-t>t :tabnew<cr>


set clipboard=unnamed

nnoremap <leader>gf :YcmCompleter FixIt <CR>
nnoremap <leader>gm :YcmCompleter GetDoc <CR>
nnoremap <leader>gt :YcmCompleter GetType <CR>
nnoremap <leader>cf :ClangFormat <CR>
vmap <leader>cf : ClangFormat <CR>

let g:clang_format#style_options = { 
			\ "Standard" : "C++11",
            \ "IndentWidth" : 4,
            \ "UseTab" : "false",
            \ "AccessModifierOffset" : -2,
            \ "ColumnLimit" : 80 }

"let vim_markdown_preview_toggle=2
"let vim_markdown_preview_hotkey='<C-m>'
nmap <leader><C-m> :LivedownToggle<CR>
"let g:livedown_autorun = 1
let g:livedown_browser = "firefox"
"autocmd FileType javascript setlocal omnifunc=tern#Complete
"autocmd FileType typescript setlocal omnifunc=tern#Complete
set completeopt-=preview



let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']

 "YouCompleteMe and UltiSnips compatibility.
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

 "Additional UltiSnips config.
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

 "Additional YouCompleteMe config.
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1

" Same as default, but with "markdown" and "text" removed.
let g:ycm_filetype_blacklist = {
      \   'notes': 1,
      \   'unite': 1,
      \   'tagbar': 1,
      \   'pandoc': 1,
      \   'qf': 1,
      \   'vimwiki': 1,
      \   'infolog': 1,
      \   'mail': 1
\ }
let g:UltiSnipsListSnippets="<C-0>"
let g:ycm_add_preview_to_completeopt = 1

vmap <leader>ld :Linediff<C-m>

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf8
let g:airline_powerline_fonts = 1


autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>


if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

"call AirlineTheme('powerlineish')
