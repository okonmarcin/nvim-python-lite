let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:airline_theme='angr'
let g:jedi#autocompletions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
let g:neomake_python_enabled_makers = ['pylint']
colorscheme gruvbox
set background=dark
set splitbelow
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif


