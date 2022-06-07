" Yank
nnoremap Y y$

" Searching
nnoremap n nzzzv 
nnoremap N Nzzzv 
nnoremap * *zzzv 

" Windows movement
map <C-h> <C-w>h 
map <C-j> <C-w>j 
map <C-k> <C-w>k
map <C-l> <C-w>l

" Windows Resizing
nnoremap <silent> <Leader>h+ :exe "resize " . (winheight(0) * 5/4)<CR> 
nnoremap <silent> <Leader>h- :exe "resize " . (winheight(0) * 4/5)<CR>   
nnoremap <silent> <Leader>w+ :exe "vertical resize " . (winwidth(0) * 5/4)<CR>  
nnoremap <silent> <Leader>w- :exe "vertical resize " . (winwidth(0) * 4/5)<CR>

" Buffers
map <C-d>  :bnext<CR>  
map <C-a>  :bprev<CR>
imap <C-D> <Esc>:bnext<CR>a 
imap <C-A> <Esc>:bprev<CR>
nnoremap <silent> <C-q> :lclose<bar>b#<bar>bdelete #<CR>
