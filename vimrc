" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

set nocompatible              " be iMproved, required
filetype off                  " required

Plug 'flazz/vim-colorschemes'

" Cursor movement
Plug 'easymotion/vim-easymotion'
Plug 'chaoren/vim-wordmotion'

" File display and navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

" Autocompletion
Plug 'Valloric/YouCompleteMe'
Plug 'zxqfl/tabnine-vim'

"Plug 'zxqfl/tabnine-vim'
Plug 'majutsushi/tagbar'

" Comment
Plug 'scrooloose/nerdcommenter'
" Code snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-endwise'

" Git diff
Plug 'mhinz/vim-signify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/a.vim'

" Text object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

" Select closest text object, e.g., selection in parenthesis ((xxx, xxx))
Plug 'gcmt/wildfire.vim'

Plug 'junegunn/vim-easy-align'

" Code formatting
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'

Plug 'nathanaelkane/vim-indent-guides'
"Plug 'elzr/vim-json'

" Project directory
Plug 'airblade/vim-rooter'

" GLSL shading language
Plug 'tikhomirov/vim-glsl'

" Initialize plugin system
call plug#end()

filetype on
filetype plugin indent on    " required

colorscheme jelleybeans

" OSX backspace fix
set backspace=indent,eol,start

" Change leader to ;
let g:mapleader=";"

" ================ General Config ====================
"set t_Co=256 "Set 256 colors
set title "Change the terminal's title
set number "Line numbers
set textwidth=80
set formatoptions+=t
set guifont=Liberation\ Mono\ Powerline:h13 "make sure to escape the spaces in the name properly
set nohlsearch
set ignorecase
set wildmenu
" Disable cursor blinking
set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T
set laststatus=2
set wrap lbr
" Allows loading local .vimrc
set exrc
set secure

syntax enable
syntax on

" ================ Indentation ======================
set shiftwidth=2
set tabstop=2
set expandtab

" ================ Auto commands ======================
autocmd BufEnter * silent! :lcd%:p:h

" Easy-align mapping
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Vim airline
let g:airline_powerline_fonts=1
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#tabline#enabled = 1

" Vim rooter
let g:rooter_patterns = ['Rakefile', '.git/', '.vimrc']
let g:rooter_silent_chdir = 1

" Auto code formatting
let g:clang_format#code_style = "google"
let g:clang_format#detect_style_file = 1

" map to <Leader>cf in C++ code
nnoremap <Leader>cf :<C-u>FormatCode<CR>
vnoremap <Leader>cf :FormatCode<CR>

" Nerdtree tabs
map <C-n> :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_smart_startup_focus=1
let g:nerdtree_tabs_autoclose=1
let g:nerdtree_tabs_autofind=1

" wildfire
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" Ctags configuration
set tags=./.tags;,.tags

" tab conflict between ultisnips and youcompleteme
"let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" Setup YouCompleteMe
imap '<SPACE> <C-SPACE>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
set tags+=./.tags
inoremap <Leader>; <C-x><C-o>
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_show_diagnostics_ui = 0

" For echodoc. Showing function argument hint
set noshowmode
let g:echodoc#enable_at_startup = 1

" Switch between cc and h
nmap <Leader>ch :A<CR>
nmap <Leader>sch :AS<CR>

" Vim indent
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_compact=1

" Rainbow parenthesis
let g:rainbow_active = 1

noremap  k gk
noremap  j gj
noremap  ^ g^
noremap  0 g0
noremap  $ g$

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>

nnoremap <Leader>l <C-W>l
nnoremap <Leader>h <C-W>h
nnoremap <Leader>k <C-W>k
nnoremap <Leader>j <C-W>j
nnoremap <Leader>u <C-W>R

" Check spelling
setlocal spell spelllang=en_us
set spell
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight SpellBad term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Map ESC
inoremap jk <Esc>
inoremap kj <Esc>

" Remove trailing space
autocmd BufWritePre * :%s/\s\+$//e
set clipboard=unnamed
set pastetoggle=<F10>

" Vim easymotion
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
"nmap <C-s> <Plug>(easymotion-s)
"let g:EasyMotion_smartcase = 1
map <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer autopep8
augroup END
