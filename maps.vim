" designate space as map leader (prefix)
nnoremap <space> <nop>
let mapleader = " "

" force myself to use 'jk' instead of <esc>
" so let's map <esc> to <nop>
" inoremap <esc> <nop>
inoremap jk <esc>
cnoremap jk <esc>

" quickly edit init.vim (and maps.vim plugins.vim)
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>em :split ~/.config/nvim/maps.vim<cr>
nnoremap <leader>ep :split ~/.config/nvim/plugins.vim<cr>
" quickly source changes from init.vim (and thus maps.vim, plugins.vim)
nnoremap <leader>sv :source $MYVIMRC<cr>

" split window
nnoremap <leader>ss :split<cr>
nnoremap <leader>vv :vsplit<cr>

" Description Keymaps
map <leader>h <c-w>h
map <leader>k <c-w>k
map <leader>j <c-w>j
map <leader>l <c-w>l
map <leader>o <c-w>o
map <leader>c <c-w>c

