" ================================================
" Dependencies
" ================================================
" Pep8
" PyFlakes
"
" ================================================
" Plugins
" ================================================
" Pathogen
"     VIM plugin manager
" 
" PyFlakes
"     Underline and display errors for Python on-the-fly
"
" Pep8
"     Coding convension module for Python
"
" GunDo
"     Visual Undo in vim with difference checking
" 
" PyDoc
"     Opens up pydoc within vim
"
" Git
"     



" Load pathogen for plugins
filetype off
call pathogen#incubate()
call pathogen#helptags()

" ================================================
" Basic settings
" ================================================
colorscheme molokai
syntax on
filetype on
filetype plugin indent on

let g:nerdtree_tabs_open_on_console_startup=1
let g:pyflakes_use_quickfix = 0
let mapleader = ","  
let g:pep8_map = '<leader>8'
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" ================================================
" Set veriables
" ================================================
set nocompatible          " not compatible with Vi
set number                " display line numbers
set nowrap                " don't wrap text
set linebreak             " don't wrap text in the middle of a word 
set autoindent            " set autoindent on
set cursorline            " have a line indicate the cursor position
set foldmethod=indent     " allow fold on indents
set foldlevel=99          " don't fold by default
set title                 " show title in console title bar
set wildmenu              " menu completion in command mode on <Tab>
set wildmode=full         " <Tab> cycles between all matching choices
if exists("&colorcolumn")
    set colorcolumn=79
endif
set completeopt=menuone,longest,preview
set statusline=%{fugitive#statusline()}

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set textwidth=79

set sw=4
set ru
set hlsearch
set bs=2
if has('mouse')
  set mouse=a
endif

"set smarttab
"set nu
"set mousehide
"set termencoding=utf-8
"set novisualbell
"set t_vb=
"set backspace=indent,eol,start whichwrap+=<,>,[,]
"set showtabline=0
"set foldcolumn=1
"set wrap
"set linebreak
"set nobackup
"set noswapfile
"set encoding=utf-8
"set fileencodings=utf8,cp1251
set t_Co=256

"set complete=""
"set complete+=.
"set complete+=k
"set complete+=b
"set complete+=t
" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
exec 'set viminfo=%,' . &viminfo




"-------------------------------------------------
" Bind keys to move around window splits
"-------------------------------------------------
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
"map <C-h> <C-w>h
"-------------------------------------------------
" Task lists
"-------------------------------------------------
map <leader>td <Plug>TaskList
"-------------------------------------------------
" Revision History
"-------------------------------------------------
map <leader>g :GundoToggle<CR>
"-------------------------------------------------
" Refactoring
" ------------------------------------------------
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
"-------------------------------------------------
" Searching
" ------------------------------------------------
nmap <leader>a <Esc>:Ack!
"-------------------------------------------------
" NERDTree hotkeys
"-------------------------------------------------
map <leader>n :NERDTreeTabsToggle<CR>
map <leader>t :NERDTreeToggle<CR>
"-------------------------------------------------
" Tabs
"-------------------------------------------------
map <C-n> :tabnew<CR>
map <C-c> :tabclose<CR>
map <C-l> :tabn<CR>
map <C-k> :tabp<CR>


"function InsertTabWrapper()
"let col = col('.') - 1
"if !col || getline('.')[col - 1] !~ '\k'
"return '"\"
"else
"return "\<c-p>"
"endif
"endfunction
"let g:snippetsEmu_key = "<C-j>"
":let python_highlight_all = 1
"let g:nerdtree_tabs_open_on_console_startup=a

"vmap <C-C> "+yi
"imap <C-V> "+gPi
"imap <c-r>=InsertTabWrapper()

"map  <C-l> :tabn<CR>
"map  <C-h> :tabp<CR>
"map  <C-n> :tabnew<CR>

imap <F1>       <ESC>:Man <c-r>=expand("<cword>")<CR><CR>
 map <F1>       <ESC>:Man <c-r>=expand("<cword>")<CR><CR>

imap <F2>       <ESC>:w<CR>
 map <F2>       <ESC>:w<CR>
imap <F3>       <ESC>:!perldoc -f <c-r>=expand("<cword>")<CR><CR>
 map <F3>       <ESC>:!perldoc -f <c-r>=expand("<cword>")<CR><CR>

"imap <F5>  <ESC>:!grep  -rn . --regexp=<c-r>=expand("<cword>")<CR> \| tee /tmp/z
" map <F5>  <ESC>:!grep  -rn . --regexp=<c-r>=expand("<cword>")<CR> \| tee /tmp/z
"call togglebg#map("<F5>")

"map <leader>n :NERDTreeToggle<CR>
imap <F11>       <ESC>:bprev<CR>
 map <F11>       <ESC>:bprev<CR>
imap <F12>       <ESC>:bnext<CR>
 map <F12>       <ESC>:bnext<CR>

imap <C-p>  <ESC><INS>print "\033[1;31m%s\033[0m" % (<C-R>=expand('<cword>')<CR>
 map <C-p>  <ESC><INS>print "\033[1;31m%s\033[0m" % (<C-R>=expand('<cword>')<CR>

"highlight WhitespaceEOL ctermbg=Red ctermfg=White guibg=Red
"match WhitespaceEOL /\s\+$/

"highlight WhitespaceBOL ctermbg=DarkRed ctermfg=White guibg=DarkRed
"match WhitespaceBOL /^\s\+$/

"highlight Tabs ctermbg=DarkRed ctermfg=White guibg=DarkRed
"match Tabs /\t\+/

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

autocmd BufWritePre *.py,*.tmpl,*.css,*.cc,*.cpp,*.h,*.hpp :%s/\s\+$//e
"autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror

augroup JumpCursorOnEdit
au!
autocmd BufReadPost *
\ if expand("<afile>:p:h") !=? $TEMP |
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\ let JumpCursorOnEdit_foo = line("'\"") |
\ let b:doopenfold = 1 |
\ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
\ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
\ let b:doopenfold = 2 |
\ endif |
\ exe JumpCursorOnEdit_foo |
\ endif |
\ endif
" Need to postpone using "zv" until after reading the modelines.
autocmd BufWinEnter *
\ if exists("b:doopenfold") |
\ exe "normal zv" |
\ if(b:doopenfold > 1) |
\ exe "+".1 |
\ endif |
\ unlet b:doopenfold |
\ endif
augroup END

" Protobuf config
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
