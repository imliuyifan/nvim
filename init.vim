" Yifan Liu
" github.com/imliuyifan
"

" ========
" Personal
" ========

" use hybrid line numbers
" i.e. show relative (line) number + abs current line number
set number relativenumber
set rnu

" tab management
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set cinoptions=(0,u0,U0

" use smart case
set ignorecase
set smartcase

" no beep
set visualbell

" for python
let g:python_recommended_style = 0

" Imports "{{{
runtime ./maps.vim
runtime ./plugins.vim
"}}}
