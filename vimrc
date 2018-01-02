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
" In Python files, use 4 spaces instead of 2 for tabs
autocmd FileType python setlocal sw=4 ts=4 sts=4

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
set ofu=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
"colorscheme molokai       " set colorscheme

" Prettify Markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
" if exists('+colorcolumn')
"   set colorcolumn=81
"   highlight ColorColumn ctermbg=red
" else
"   highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"   match OverLength /\%81v.\+/
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set number                " show line numbers
" Hybrid line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,InsertLeave,WinEnter * set relativenumber
  autocmd BufLeave,InsertEnter,WinLeave   * set norelativenumber
augroup END
" set numberwidth=6         " make the number gutter 6 characters wide
set cul                   " highlight current line
" hi CursorLine ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
" set laststatus=2          " last window always has a statusline
set hlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
" set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set laststatus=2
set visualbell
" set mouse=a
" search into subdirectories
set path+=**
" display all matching files when we tab complete
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
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
" set nowrap                " don't wrap text
set encoding=utf-8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Custom Commands                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Leader> to <Space>
let mapleader = ' '
" Map jj to <Esc> in insert mode
inoremap jj <Esc>
" Prettify JSON files making them easier to read
" command PrettyJSON %!python -m json.tool
" Setting for netrw -- the default vim file explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
" Uncomment the following 4 lines to have netrw when launching VIM
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
" Enable unsaved buffer
set hidden
" Simplify buffer switch
set wildcharm=<C-Z>
nnoremap <Leader>k :b <C-Z>
nnoremap <Leader>l :buffers<CR>:buffer<Space>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>j :b#<CR>
" Speed up scroll up and down
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" Fast highlight and disable highlight
" nnoremap <Leader>f :let @/=expand('<cword>')<CR> :set hls<CR>
nnoremap <Leader>f :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <Leader>d :nohl<CR>
" Fold
set foldmethod=indent
" Open all folders when editing a new buffer
set foldlevelstart=99
" Show command in the bottom-right corner
set showcmd
" Auto pair ( [ { " ' 
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
