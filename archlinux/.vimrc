colorscheme apprentice " dracula darcula mustang
set nu

" True Color terminal emulators
" set termguicolors

" optional if console only supports 256 bit color
set t_Co=256

" enable syntax highligting
syntax on

" display whitespace when using 'set list'
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" System clipboard
set clipboard=unnamed

" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"

set nocompatible              " required
filetype off                  " required

" Split
set splitbelow
set splitright

"split navigations with keyboard; no mouse needed
" Ctrl-j move to the split below
nnoremap <C-J> <C-W><C-J>
" Ctrl-k move to the split above
nnoremap <C-K> <C-W><C-K>
" Ctrl-l move to the split to the right
nnoremap <C-L> <C-W><C-L>
" Ctrl-h move to the split to the left
nnoremap <C-H> <C-W><C-H>

" Set Ctrl-c equal to escape
inoremap <C-c> <Esc>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Folding
Plugin 'tmhedberg/SimpylFold'

" PEP8
Plugin 'vim-scripts/indentpython.vim'

" Auto-complete
Bundle 'Valloric/YouCompleteMe'

map <F9> :YcmCompleter FixIt<CR>

" Syntax check on save
Plugin 'scrooloose/syntastic'

" PEP8 Syntax check on save
Plugin 'nvie/vim-flake8'

" If you want a proper file tree then NERDTree is the way to go.
Plugin 'scrooloose/nerdtree'

" And if you want to use tabs, utilize vim-nerdtree-tabs:
Plugin 'jistr/vim-nerdtree-tabs'

" Want to search for basically anything from VIM? Check out ctrlP:
Plugin 'kien/ctrlp.vim'

" Git integration
Plugin 'tpope/vim-fugitive'

" status bar that displays things like the current virtualenv, git branch, files being edited, etc
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Want to see the docstrings for folded code?
let g:SimpylFold_docstring_preview=1

" Python : PEP8
au BufNewFile,BufRead *.py :
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css : 
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2 |

au BufNewFile,BufRead *.h, *.c, *.cpp, *.hpp :
			\ set tabstop=8  |
			\ set softtabstop=0  |
			\ set expandtab  |
			\ set shiftwidth=3 | 
			\ set smarttab

highlight BadWhitespace ctermbg=red guibg=darkred

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h :
			\ match BadWhitespace /\s\+$/

autocmd BufRead,BufNewFile /home/knut.andersen/devel/optee* : 
			\ let g:syntastic_c_include_dirs=[ '../ta/include', 
			\ '../../optee_client/out/export/include', '../../optee_client/public', 
			\ '../../optee_os/lib/libutee/include', '../../optee_os/lib/libutils/ext/include'] 

" map the return key to Ctrl+Y when using the pop-up menu for auto-completion
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV'] 
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" UTF-8 support
set encoding=utf-8

" ensures that the autocomplete window goes away when you’re done with it, and the latter defines a shortcut for goto definition
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Want to hide .pyc files? Then add the following line (requires NERDTree):
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" global config file for OP-TEE specific C projects
let g:ycm_global_ycm_extra_conf='/home/knut.andersen/.vim/.ycm_extra_conf.py'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

