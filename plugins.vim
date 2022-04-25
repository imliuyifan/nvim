" Yifan Liu
" github.com/imliuyifan
"

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" solarized colorscheme
Plug 'altercation/vim-colors-solarized'

" unite (depends on vimproc)
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'

" ag plugin
Plug 'rking/ag.vim'
" ack plugin ("Searching ..." bug in neovim)
" refer here: https://github.com/mileszs/ack.vim/issues/267
" will use ag.vim utill this is fixed
Plug 'mileszs/ack.vim'

"see and remove trailing spaces
Plug 'bronson/vim-trailing-whitespace'

call plug#end()

" ###################
" ### Plugin conf ###
" ###################

" -------------------
"       THEME
" -------------------

" -- solarized theme
set background=light
try
    colorscheme solarized
catch
endtry

" -------------------
"       UNITE
" -------------------

" -- unite for file management
" let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <leader>f :<C-u>Unite file<cr>
nnoremap <leader>b :<C-u>Unite buffer<cr>
nnoremap <leader>g :<C-u>Unite -start-insert file_rec/git<cr>
nnoremap <leader><space> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <silent> ,ug  :<C-u>Unite file_rec/git:--cached:--others:--exclude-standard<CR>

" see the yank history
nnoremap <leader>y :split<cr>:<C-u>Unite history/yank<cr>
" reset not it is <C-l> normally
nnoremap <leader>r <Plug>(unite_restart)


" -------------------
"       AG
" -------------------

" use ag instead of ack
" note that a trailing space is needed after Ag (Ack)
if executable('ag')
  let g:ag_prg = 'ag --nogroup --nocolor --column'
  " --- type <leader> \ to search the word in all files in the current dir
  nmap <leader>* :Ag <c-r>=expand("<cword>")<cr><cr>
  nnoremap <leader>/ :Ag 
else
  let g:ackprg = 'ag --nogroup --nocolor --column'
  " --- type <leader> \ to search the word in all files in the current dir
  nmap <leader>* :Ack <c-r>=expand("<cword>")<cr><cr>
  nnoremap <leader>/ :Ack 

endif
