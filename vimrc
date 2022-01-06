set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" colorscheme darcula

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" air-line
" let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
     let g:airline_symbols = {}
endif

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Themes

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" git support
Plugin 'tpope/vim-fugitive'
" nice directory view
Plugin 'scrooloose/nerdtree'
" quoting/parenthesizing
Plugin 'tpope/vim-surround'
" Status-bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Fuzzy search
Plugin 'junegunn/fzf'
" Easy folding
Plugin 'tmhedberg/SimpylFold'
" Improved python indentation
Plugin 'vim-scripts/indentpython.vim'
" Syntax checking
Plugin 'vim-syntastic/syntastic'
" Improved commenting
Plugin 'tpope/vim-commentary'
" Aligning text
Plugin 'godlygeek/tabular'
" Static syntax checker for python, press F7 in a python file to run
Plugin 'nvie/vim-flake8'
" Markdown support
Bundle 'gabrielelana/vim-markdown'
" Color schemes
Plugin 'badacadabra/vim-archery'
Plugin 'reedes/vim-colors-pencil'


" Disable YCM by default as it is a super heavy dependency to carry around
" Bundle 'Valloric/YouCompleteMe'

call vundle#end()


" Python config
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" PEP8 Compliance
au BufNewFile,BufRead *.py,*.c,*.h set tabstop=4
au BufNewFile,BufRead *.py,*.c,*.h set softtabstop=4
au BufNewFile,BufRead *.py,*.c,*.h set shiftwidth=4
au BufNewFile,BufRead *.py,*.c,*.h set textwidth=79
au BufNewFile,BufRead *.py,*.c,*.h set expandtab
au BufNewFile,BufRead *.py,*.c,*.h set autoindent
au BufNewFile,BufRead *.py,*.c,*.h set fileformat=unix

" Syntastic 
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Flag whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

" Autocomplete for python
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Syntax highlighting/checking
let python_highlight_all=1
syntax on

" Line nos
set number

set t_Co=256
" let g:airline_theme='luna'
let g:airline_theme='pencil'
colorscheme lucario

filetype plugin indent on

