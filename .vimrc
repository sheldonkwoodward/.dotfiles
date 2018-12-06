" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'  " ale https://github.com/w0rp/ale
Plug 'editorconfig/editorconfig-vim'  " editorconfig https://github.com/editorconfig/editorconfig-vim
Plug '/usr/local/opt/fzf'  " fzf https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'  " gitgutter https://github.com/airblade/vim-gitgutter
Plug 'itchyny/lightline.vim'  " lightline https://github.com/itchyny/lightline.vim
Plug 'scrooloose/nerdtree'  " nerdtree https://github.com/scrooloose/nerdtree
Plug 'tpope/vim-surround'  " surround https://github.com/tpope/vim-surround
Plug 'flazz/vim-colorschemes'  " vim colorschemes https://github.com/flazz/vim-colorschemes
call plug#end()


" GENERAL CONFIG
" set foldmethod=indent


" PLUGIN CONFIGS
" ale config
map <C-a> :ALEToggle<CR>

" fzf config
map ; :Files<CR>

" lightline config
set laststatus=2  " show lightline
set noshowmode  " hide status in commandline
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" nerdtree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  " close nerdtree if only window open
map <C-o> :NERDTreeToggle<CR>


" RANDOM
set backspace=indent,eol,start  " fix backspace issue
colorscheme darth  " editor colorscheme
set number  " show line numbers

