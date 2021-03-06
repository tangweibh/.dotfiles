""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      Filename: .vimrc                                                      "
"    Maintainer: Wei Tang <tangweibh@gmail.com>                              "
" Modified From: http://github.com/michaeljsmalley/dotfiles                  "
"                                                                            "
"                                                                            "
" Sections:                                                                  "
"   01. General ................. General Vim behavior                       "
"   02. Events .................. General autocmd events                     "
"   03. Theme/Colors ............ Colors, fonts, etc.                        "
"   04. Vim UI .................. User interface behavior                    "
"   05. Text Formatting/Layout .. Text, tab, indentation related             "
"   06. Custom Commands ......... Any custom command aliases                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Latex files, use <F5> to make 
autocmd FileType tex nnoremap <F5> :w <bar> !make <CR>
autocmd FileType tex nnoremap <F6> :w <bar> !make latex <CR>
autocmd FileType tex nnoremap <F7> :w <bar> !make bibtex <CR>
" In Latex files, auto pair $$
autocmd FileType tex inoremap $ $$<Esc>i
" In Latex files, set spell on 
autocmd FileType tex setlocal spell spelllang=en_us spellfile=en.utf-8.add
let g:tex_comment_nospell=1

" Hybrid line numbers
set number relativenumber
" Set or unset relativenumber based on some events. 
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,InsertLeave,WinEnter * set relativenumber
"   autocmd BufLeave,InsertEnter,WinLeave   * set norelativenumber
" augroup END

" In some files, set textwidth to 80 
autocmd BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp,*.py,*.tex setlocal tw=80
" In Python and Matlab files, use 4 spaces instead of 2 for tabs
autocmd BufNewFile,BufRead *.py,*.m setlocal sw=4 ts=4 sts=4

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
set ofu=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme default       " set colorscheme
set bg=dark
hi CursorLine cterm=NONE ctermbg=17 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cul                   " highlight current line
set laststatus=2
set hlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set smartcase             " Turn off ignorecase when seach with capital letters. 
set ruler                 " Always show info along bottom.
set showmatch
set visualbell
" Show command in the bottom-right corner
set showcmd
" set mouse=a
" search into subdirectories
set path+=**
" display all matching files when we tab complete
set wildmode=longest,list,full
set wildmenu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
" set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
set encoding=utf-8
" Fold
set foldmethod=indent
" Open all folders when editing a new buffer
set foldlevelstart=99
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Custom Commands                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Leader> to <Space>
let mapleader = ' '
" Map jj to <Esc> in insert mode
inoremap jj <Esc>

" Setting for netrw -- the default vim file explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
set hidden
" Simplify buffer switch
set wildcharm=<C-Z>
nnoremap <Leader>k :b <C-Z>
nnoremap <Leader>l :buffers<CR>:buffer<Space>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>j :b#<CR>
" Map ' to `
map ' `
" Speed up scroll up and down
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" Fast highlight and disable highlight
nnoremap <Leader>f :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <Leader>d :nohl<CR>
" Auto pair ( [ { " ' 
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
" Jump to tag in the alternative window
nnoremap <Leader>t "tyiw <C-w>w :tag <C-r>t <CR>
