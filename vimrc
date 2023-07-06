" runtime! debian.vim 

if has("syntax")
  syntax enable
endif

set number

" make vim start faster
set clipboard=exclude:.*

" fix tmux and vim mouse issue
set ttymouse=xterm2
set mouse=a

" paste what was last yanked
xnoremap ,p "0p
nnoremap ,p "0p

" set terminal color
set t_Co=256
set background=light
" colorscheme solarized
colorscheme nord

" set code editor settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set splitbelow
set splitright

" Handy search options
set hlsearch
set incsearch

" 80 column rule
set colorcolumn=80
highlight ColorColumn ctermbg =lightgray

" handy navigation b/t panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set shortmess=a

filetype plugin indent on

let g:netrw_liststyle=3 

" pdb shortcut
nnoremap <leader>d oimport pdb; pdb.set_trace()<Esc>
nnoremap <leader>D Oimport pdb; pdb.set_trace()<Esc>
