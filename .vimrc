if !has("gui_running")
    set background=dark
endif

" Using VimPlug. For more details please take look:
" https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')
" Colorschema gruvbox: https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'
" Status bar line: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
" Syntax highlights for various languages: https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'
call plug#end() " runs 'filetype plugin indent on' and 'syntax enabled'

colorscheme gruvbox

let g:airline#extensions#tabline#enabled = 1 "Enable smart tab in airline

set autoindent
set showmatch
set smarttab
set noshowmode " Hide NORMAL/INSERT/VISUAL mode highlight, because it's done in vim-airline

" Configure tabulation
set tabstop=4 "Replace existing tab with 4 spaces width
set shiftwidth=4 "Move with 4 spaces when '>' pressed
set expandtab "Insert 4 spaces when Tab pressed
set termguicolors "In case of iTerm2 it gives TRUECOLORs for editor
set number "Display line numbers
set nowrap " Don't wrap text

" Custom hotkey mapping
" Previous tab
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
" Next tab
nnoremap <silent> <LocalLeader>] :tabnext<CR>
" Remove search highlights
nnoremap <silent> <space> :nohlsearch<CR>

