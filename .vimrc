" based on github.com/hukl/dotfiles

" Pathogen Plugin
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Backspace
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on
filetype plugin indent on

" add support for color
color smyck

" line numbers
set number
set ruler

" set encoding
set encoding=utf-8

" whitespace and tab
set nowrap
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" show trailing spaces and highlight hard tabs
set list listchars=tab:«·,trail:·

" strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l,c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" searching
set incsearch
set hlsearch

" map ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Highlight characters behind the 80 chars margin
:au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)

" disable colde folding
set nofoldenable

" set filetypes
au FileType make set noexpandtab
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.cl set ft=c
au BufNewFile,BufRead *.cu set ft=cpp
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
" (taken from hukl) make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" OS X Clipboard support
set clipboard=unnamed
map <F2> :.w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>

" syntastic setup
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" off by default
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': [] }
" Ctrl-w + e -> Check
" Ctrl-w + f -> Disable
noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>f :SyntasticToggleMode<CR>

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


