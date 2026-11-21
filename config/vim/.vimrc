" collection of plugins i use

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'

Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

" number for lines
set number

" Nord theme for my vim :D
colorscheme nord

"a new Leader key (cause i hate backslash)
let mapleader = " "

" clangd lsp (a must for me)

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

" Shortcuts
nnoremap <C-s> :Files<CR>
nnoremap <C-e> :NERDTreeToggle<CR>

" Keybinds
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :Ex<CR>
nnoremap <Leader>q :q<CR>
" nnoremap <Leader>p :q!<CR>

