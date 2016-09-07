set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'shougo/neocomplete.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mtth/scratch.vim'

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'mattreduce/vim-mix'
Plugin 'mmorearty/elixir-ctags'
nnoremap <leader>t :!mix test --no-color %<CR>
" Html
Plugin 'othree/html5.vim'

" Elm
Plugin 'lambdatoast/elm.vim'

" Javascript
Plugin 'othree/yajs.vim'

" CSS
Plugin 'hail2u/vim-css3-syntax'
au BufReadPost *.pcss set syntax=css

" Purescript
Plugin 'raichoo/purescript-vim'
Plugin 'frigoeu/psc-ide-vim'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Bpf
Plugin 'cgoboncan/bpf.vim'

" All of your Plugins must be added before the following line
Plugin 'sickill/vim-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'bcicen/vim-vice'
Plugin 'gmarik/ingretu'
Plugin 'wombat256.vim'
Plugin 'croaker/mustang-vim'
Plugin 'adlawson/vim-sorcerer'
Plugin 'vim-scripts/strange'
Plugin 'rcdilorenzo/vim-colors-pencil'

call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Automatically reload .vimrc on save
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set tabstop=2 expandtab shiftwidth=2 smarttab
set clipboard=unnamed

" Exit INSERT mode with jk
imap jk <Esc>

" Undo in INSERT mode
imap <c-z> <c-o>u

" Make tabbing in VISUAL mode keep highlighting
vmap <tab> >gv
vmap <s-tab> <gv

" Smart indentation
set autoindent
set smartindent
set showmatch

" Fix for delete button
set backspace=2

" Watch for file changes
set autoread

set number

" Remove delay when hitting escape
set timeoutlen=1000 ttimeoutlen=0

" Turn on statusbar
set ruler
set mouse=a

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()  abort "{{{
  let neocomplete = neocomplete#get_current_neocomplete()
  let neocomplete.lock = 1
endfunction"}}}"


" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()  abort "{{{
  let neocomplete = neocomplete#get_current_neocomplete()
  let neocomplete.lock = 0
endfunction"}}}

" Turn on omnicompletion
set omnifunc=syntaxcomplete#Complete

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"



" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au FileType purs setlocal omnifunc=PSCIDEomni

" Enable heavy omni completion.
let g:neocomplete#sources#omni#input_patterns = {}
let g:neocomplete#sources#omni#input_patterns.purescript = '[^. *\t]'
let g:neocomplete#sources#omni#input_patterns.haskell = '[^. *\t]'

" Hide Preview/Scratch window
set completeopt-=preview

" Allow hidden buffers
set hidden

" Config scratch.vim
let g:scratch_autohide = &hidden
let g:scratch_insert_autohide = 1
let g:scratch_filetype = "md"
let g:scratch_persistence_file = ".scratch.vim.md"

" Always show the statusline
set laststatus=2

augroup auto_comment
  au!
  au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

set background=dark
syntax enable

let g:airline_powerline_fonts = 1
let g:loaded_airline_themes = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1

colorscheme gruvbox

au FileType purescript nmap <leader>t :PSCIDEtype<CR>
au FileType purescript nmap <leader>s :PSCIDEapplySuggestion<CR>
au FileType purescript nmap <leader>a :PSCIDEaddTypeAnnotation<CR>
au FileType purescript nmap <leader>i :PSCIDEimportIdentifier<CR>
au FileType purescript nmap <leader>r :PSCIDEload<CR>
au FileType purescript nmap <leader>p :PSCIDEpursuit<CR>
au FileType purescript nmap <leader>c :PSCIDEcaseSplit<CR>
au FileType purescript nmap <leader>qd :PSCIDEremoveImportQualifications<CR>
au FileType purescript nmap <leader>qa :PSCIDEaddImportQualifications<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <c-t> :NERDTree<CR>
