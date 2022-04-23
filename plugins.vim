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
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <space>f :split<cr> :<C-u>Unite file<cr>
nnoremap <space>g :split<cr> :<C-u>Unite -start-insert file_rec/git<cr>
" see the yank history
nnoremap <space>y :split<cr>:<C-u>Unite history/yank<cr>
" reset not it is <C-l> normally
nnoremap <space>r <Plug>(unite_restart)


" -------------------
"       AG
" -------------------

" use ag instead of ack
if executable('ag')
  let g:ag_prg = 'ag --nogroup --nocolor --column'
  " --- type <space> \ to search the word in all files in the current dir
  nmap <space>* :Ag <c-r>=expand("<cword>")<cr><cr>
  nnoremap <space>/ :Ag 
else
  let g:ackprg = 'ag --nogroup --nocolor --column'
  " --- type <space> \ to search the word in all files in the current dir
  nmap <space>* :Ack <c-r>=expand("<cword>")<cr><cr>
  nnoremap <space>/ :Ack 

endif
