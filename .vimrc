" Syntax highlight
syntax on

filetype on
filetype indent on
filetype plugin on

autocmd BufRead *.hx set filetype=actionscript

" This will allow paste'ing > 50 lines
set viminfo='100,<100,s10,h
" Fix backspace won't move from current line
set backspace=indent,eol,start
set tags=tags;/

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80

set ignorecase
set autoindent
set autoread
set smartindent
set expandtab
set number
set ruler

" Highlight word under cursor
highlight flicker cterm=bold ctermfg=green
au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'

" Jump to the last position when reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line,  character
set statusline+=%<%P                         " file position

" Keyboard shortcuts
map ,x :x<CR>
map ,q :q!<CR>
map ,n :set nonumber<CR>
map ,p :set paste<CR>i
map <F2> :retab <CR> :wq! <CR>
map <F3> :x<CR>
nmap ,l :set list!<CR>
