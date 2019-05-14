if !has("gui_running")
    set background=dark
endif

let $VIMHOME=stdpath("data") " $VIMHOME is set to reference temporary nvim user data

if !filereadable($VIMHOME . '/runtime/py3/bin/python')
    try
        if executable('virtualenv')
            !virtualenv -p python3 $VIMHOME/runtime/py3
        elseif executable('python3')
            !python3 -m venv $VIMHOME/runtime/py3
        endif
    finally
        !$VIMHOME/runtime/py3/bin/pip install pynvim
    endtry
endif

let g:python3_host_prog = $VIMHOME . '/runtime/py3/bin/python' " Set path to python interpret

try
    python3 import pynvim
catch
    echomsg "please ensure 'pynvim' installed in system"
endtry

" PLUGINS
" Using VimPlug. For more details please take look:
" https://github.com/junegunn/vim-plug
call plug#begin($VIMHOME . '/plugged')
Plug 'morhetz/gruvbox'                                 " Colorschema gruvbox: https://github.com/morhetz/gruvbox
Plug 'vim-airline/vim-airline'                         " Status bar line: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes'                  " A collection of themes for vim-airline: https://github.com/vim-airline/vim-airline-themes
Plug 'powerline/powerline-fonts'                       " Patched fonts for Powerline users: https://github.com/powerline/fonts
Plug 'scrooloose/nerdtree'                             " A tree explorer plugin: https://github.com/scrooloose/nerdtree
Plug 'liuchengxu/vista.vim'                            " Viewer & Finder for LSP symbols and tags in Vim: http://liuchengxu.org/vista.vim
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Semantic Highlighting for Python in Neovim: https://github.com/numirias/semshi
Plug 'tpope/vim-fugitive'                              " A Git wrapper so awesome, it should be illegal: https://github.com/tpope/vim-fugitive
call plug#end()                                        " runs 'filetype plugin indent on' and 'syntax enabled'

colorscheme gruvbox

let g:gruvbox_contrast_dark = "hard"         " Make background more contrast
let g:airline#extensions#tabline#enabled = 1 " Enable smart tab in airline
let g:airline_powerline_fonts = 1
let g:NERDTreeQuitOnOpen = 1                 " Close NERDTree when buffer is open

set encoding=utf-8
set autoindent     " Enable automatically indent the next new line to maatch the indent of previous one
set colorcolumn=80 " Show columns at 80
set showmatch
set smarttab
set noshowmode     " Hide NORMAL/INSERT/VISUAL mode highlight, because it's done in vim-airline
set tabstop=4      " Replace existing tab with 4 spaces width
set shiftwidth=4   " Move with 4 spaces when '>' pressed
set expandtab      " Insert 4 spaces when Tab pressed
set termguicolors  " In case of iTerm2 it gives TRUECOLORs for editor
set number         " Display line numbers
set nowrap         " Don't wrap text

" KEY BINDINGS

" Open/Close NERDTree panel
nnoremap <silent> <leader>1 :NERDTreeToggle<CR> 
" Remove search highlights
nnoremap <silent> <space> :nohlsearch<CR>
" Remap semicolon and get rid Shift
nnoremap ; :
