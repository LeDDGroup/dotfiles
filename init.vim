set rtp+=/usr/local/opt/fzf

set tabstop=4
set softtabstop=4 
set shiftwidth=2
set expandtab
set shiftround

set noswapfile

set number
set mouse=a
set ignorecase
set hidden
set smartindent
set list
set clipboard+=unnamedplus

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'mhartington/nvim-typescript'
  Plug 'Yggdroot/indentLine'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'mbbill/undotree'
  Plug 'roman/golden-ratio'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'leafgarland/typescript-vim'
call plug#end()

colorscheme onedark

let mapleader = ","

map <Leader>P :Files<CR>
map <Leader>p :GFiles<CR>
map <Leader>g :GFiles?<CR>
map <Leader>f :Ag 
map <Leader>b :Buffers<CR>

map <Leader>d :e $MYVIMRC<CR>
map <Leader>r :so %<CR>

map <Leader>t :NERDTreeToggle<CR>
map <Leader>u :UndotreeToggle<CR>

nmap <leader>, :bprevious<CR>
nmap <leader>. :bnext<CR>
nmap <leader>n :enew<CR>

tnoremap <ESC> <C-\><C-n>

" nerdtree
let g:NERDTreeMouseMode=3 

" airline
let g:airline_theme = 'onedark'

" nerdcommenter
let g:NERDSpaceDelims = 1

" deploete
let g:deoplete#enable_at_startup = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
