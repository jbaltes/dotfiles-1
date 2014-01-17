set helplang=de
set autoindent
set backspace=2
set backup
set cmdheight=2
set shortmess=aoOs
set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-

set modeline
set termencoding=utf-8
set encoding=utf-8
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,
set hidden
set history=500
set hlsearch
set icon
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set listchars=precedes:$,extends:$,tab:>-,trail:.,eol:<
set mouse=nvi
set number
set printheader=%<%F%=Seite\ %N
set printoptions=left:10pc,right:10pc,top:5pc,bottom:5pc,number:y
set report=0
set ruler
set scrolloff=2
set shiftwidth=4
set showbreak=\ \|
set showcmd
set showmatch
set showmode
set sidescroll=5
set smartcase
set spelllang=de,en
set spellsuggest=double,10
set switchbuf=useopen,usetab
set tabstop=4
set textwidth=75
set title
set titleold=""
set ttyfast
set whichwrap=<,>,h,l,[,]
set wildignore=*.o,*.obj,*.exe,*~,moc_*
set wildmenu
set wildmode=list:longest,full
set wrap

" syntax highlighting
syntax on

" enable per filetype settings
filetype on
filetype indent on
filetype plugin on

" pathogen support
execute pathogen#infect()

" omnicompletion
"set completeopt=menuone,longest
"set tags+=~/.vim/systags
"set omnifunc=syntaxcomplete#Complete
"inoremap <C-Space> <C-x><C-o>

" move lines
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Leader
"let mapleader = ","

" Folding
"syntax sync fromstart
set foldmethod=indent
set nofoldenable

" plugin buftabs
nnoremap <f1> :bN<CR>
nnoremap <f2> :bn<CR>
let g:buftabs_in_statusline = 1
let g:buftabs_only_basename = 1
let g:buftabs_marker_modified = "*"

" plugin gundo
nnoremap <f5> :GundoToggle<CR>

" plugin CommandT
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" fix cursor keys
"  see http://superuser.com/questions/237751
map <Esc>[B <Down>

" misc
map <C-Enter> <C-]>
map <silent> <C-N> :nohl<CR>

if has("autocmd")
	" config files
	autocmd BufWritePost .vimrc source ~/.vimrc
	autocmd BufWritePost .vimrc setlocal nowrap number textwidth=0
	autocmd BufWritePost *.Xresources call UpdateXresources()
	autocmd FileType vim setlocal nowrap number textwidth=0
	autocmd FileType xdefaults setlocal nowrap number textwidth=0

	autocmd Filetype c,cpp set smartindent
	autocmd Filetype c,cpp setlocal cindent nowrap number textwidth=0
"	autocmd BufWritePost *.cpp,*.h,*.c call UpdateCTags()
	autocmd Filetype taglist setlocal statusline=Taglist
"	autocmd Filetype python set omnifunc=pythoncomplete#Complete
	autocmd Filetype python set tags+=$HOME/.vim/tags/python.ctags
	autocmd Filetype python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
	autocmd Filetype python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
	autocmd Filetype python set expandtab
	autocmd Filetype python set textwidth=79
	autocmd Filetype python set tabstop=8
	autocmd Filetype python set softtabstop=4
	autocmd Filetype python set shiftwidth=4

	" mark extra whitespaces
	autocmd Syntax * highlight ExtraWhitespace ctermbg=red guibg=red
	autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
endif

" colorscheme
set background=light
colorscheme solarized

" own functions
function! UpdateCTags()
	let _result_ = system('ctags -a '.expand("%:p"))
	unlet _result_
endfunction

function! UpdateXresources()
	let _result_ = system('xrdb '.expand("%:p"))
	unlet _result_
endfunction

com! ClearWhitespaces :%s/\s\+$//
