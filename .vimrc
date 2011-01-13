syntax on

" this will allow paste'ing > 50 lines
set viminfo='100,<100,s10,h

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80

set ignorecase
set autoindent
set smartindent
set expandtab
set number

set tags=tags;/
" fix backspace won't move from current line
set backspace=indent,eol,start

filetype on
filetype indent on
filetype plugin on
autocmd BufRead *.hx set filetype=actionscript

" http://stackoverflow.com/questions/164847/what-is-in-your-vimrc
" highlight word under cursor
highlight flicker cterm=bold ctermfg=green
au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'

" Uncomment the following to have Vim jump to the last position when
" " reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

map ,x :x<CR>
map ,q :q!<CR>
map ,n :set nonumber<CR>
nmap ,l :set list!<CR>
map ,p :set paste<CR>i
" map <F1> :q!<CR>
map <F2> :retab <CR> :wq! <CR>
map <F3> :x<CR>

