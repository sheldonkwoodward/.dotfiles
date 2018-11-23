" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'  " editorconfig https://github.com/editorconfig/editorconfig-vim
Plug '/usr/local/opt/fzf'  " fzf https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'  " gitgutter https://github.com/airblade/vim-gitgutter
Plug 'itchyny/lightline.vim'  " lightline https://github.com/itchyny/lightline.vim
Plug 'scrooloose/nerdtree'  " nerdtree https://github.com/scrooloose/nerdtree
Plug 'tpope/vim-surround'  " surround https://github.com/tpope/vim-surround
Plug 'flazz/vim-colorschemes'  " vim colorschemes https://github.com/flazz/vim-colorschemes
call plug#end()


" COMMAND MAPS
map ; :Files<CR>
map <C-o> :NERDTreeToggle<CR>


" PLUGIN CONFIGS
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
autocmd StdinReadPre * let s:std_in=1  " auto open nerd tree when no file is specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  " close nerdtree if only window open


" RANDOM
set backspace=indent,eol,start  " fix backspace issue
colorscheme darth  " editor colorscheme
set number  " show line numbers

