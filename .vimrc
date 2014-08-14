" based on github.com/hukl/dotfiles

" Backspace
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on
filetype plugin indent on

" add support for color

" line numbers
set number
set ruler

" set encoding
set encoding=utf-8

" whitespace and tab
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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

" disable colde folding
set nofoldenable

" set filetypes
au FileType make set noexpandtab
au BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufRead,BufNewFile *.txt call s:setupWrapping()

" OS X Clipboard support
set clipboard=unnamed
map <F2> :.w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>


