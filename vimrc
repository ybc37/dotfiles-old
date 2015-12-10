set nocompatible
set shell=/bin/bash\ -i


call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-sneak'
Plug 'jaxbot/browserlink.vim'
Plug 'Raimondi/delimitMate'
Plug 'bling/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'vim-scripts/sessionman.vim'
Plug 'matchit.zip'
Plug 'Lokaltog/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'gcmt/wildfire.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'amirh/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-haml'
Plug 'fatih/vim-go'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/restore_view.vim'
Plug 'mhinz/vim-signify'
Plug 'maxbrunsfeld/vim-yankstack'

" kalisi
Plug 'freeo/vim-kalisi'
Plug 'Yggdroot/indentLine'

Plug 'othree/javascript-libraries-syntax.vim'
Plug 'burnettk/vim-angular'

Plug 'https://github.com/vasconcelloslf/vim-interestingwords'

call plug#end()


" General

filetype plugin indent on " Automatically detect file types.
syntax on                 " Syntax highlighting
set mouse=a               " Automatically enable mouse usage
set mousehide             " Hide the mouse cursor while typing
scriptencoding utf-8
set nospell
set clipboard=

autocmd FileType c,cpp,cs,java,go,php setlocal commentstring=//\ %s
autocmd FileType sql setlocal commentstring=--\ %s

set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore                         " Allow for cursor beyond last character
set history=1000                                " Store a ton of history (default is 20)
set hidden                                      " Allow buffer switching without saving
set iskeyword-=.                                " '.' is an end of word designator
set iskeyword-=#                                " '#' is an end of word designator
set iskeyword-=-                                " '-' is an end of word designator

set backup           " Backups are nice ...
set undofile         " So is persistent undo ...
set undolevels=1000  " Maximum number of changes that can be undone
set undoreload=10000 " Maximum number lines to save for undo on a buffer reload

" swapfile macht ggf. probleme mit tools, die verzeichnisse/dateien ueberwachen.
" set noswapfile
set directory=~/.vimswap

set backupdir=~/.vimbackup
set viewdir=~/.vimviews
set undodir=~/.vimundo


" Vim UI
" kalisi
set t_Co=256
" set guifont=Inconsolata\ 11
set guifont=Inconsolata-dz\ for\ Powerline\ 9

" colorscheme base16-default
colorscheme kalisi
set background=dark                            " Assume a dark background

set visualbell                                 " kein beep...
autocmd! GUIEnter * set t_vb=                  " keine visualbell (screen flashing)

set cursorline                                 " Highlight current line
set shortmess+=filmnrxoOtTI                    " Abbrev. of messages (avoids 'hit enter')
set diffopt+=vertical
set showcmd                                    " Show partial commands in status line and
set laststatus=2
set backspace=indent,eol,start                 " Backspace for dummies
set number
set relativenumber
set showmatch                                  " Show matching brackets/parenthesis
set incsearch                                  " Find as you type search
set hlsearch                                   " Highlight search terms
set ignorecase                                 " Case insensitive search
set smartcase                                  " Case sensitive when uc present
set wildmenu                                   " Show list instead of just completing
set wildmode=list:longest,full                 " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]                  " Backspace and cursor keys wrap too
set scrolljump=5                               " Lines to scroll when cursor leaves screen
set scrolloff=3                                " Minimum lines to keep above and below cursor
set foldenable                                 " Auto fold code
set foldmethod=syntax
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace


" Formatting
set nowrap        " Do not wrap long lines
set autoindent    " Indent at the same level of the previous line
set shiftwidth=4  " Use indents of 4 spaces
set expandtab     " Tabs are spaces, not tabs
set tabstop=4     " An indentation every four columns
set softtabstop=4 " Let backspace delete indent
set nojoinspaces  " Prevents inserting two spaces after punctuation on a join (J)
set splitright    " Puts new vsplit windows to the right of the current
set splitbelow    " Puts new split windows to the bottom of the current
set textwidth=120
set formatoptions-=t
" toggle wrapping of long lines
nmap <F10> :set wrap! linebreak!<CR>

" Key Mappings

let mapleader = "\<Space>"

inoremap jk <Esc>
inoremap kj <Esc>
" map <Space> v<Esc>vaBokV

" suche innerhalb visual selection..
vnoremap <M-/> <Esc>/\%V

nmap <silent> <leader>vv :e ~/.vimrc<CR>
nmap <silent> <leader>sv :source ~/.vimrc<CR>
nmap <silent> <leader>bb :e ~/.bashrc<CR>

nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>x :bd<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Tab> :b#<CR>
nnoremap <silent> <Leader>h :bp<CR>
nnoremap <silent> <Leader>l :bn<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"copy & paste to system clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+y$
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" nnoremap <silent><leader><Space> :noh<CR>
nnoremap <silent> <leader>/ :noh<CR>
" nmap <silent> <leader>/ :set invhlsearch<CR>

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (http://stackoverflow.com/a/8064607/127816)
vnoremap . :normal .<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode (http://vimcasts.org/e/14)
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Adjust viewports to the same size
" map <Leader>= <C-w>=

" Map <Leader>ff to display all lines with keyword under cursor and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH

" Easier formatting
" nnoremap <silent> <leader>q gwip


" Plugins:  Misc

let b:match_ignorecase = 1
let g:syntastic_always_populate_loc_list = 1
nnoremap <leader>a :Ack!
let g:ackprg = '/bin/ag -S --nogroup --nocolor --column'


" Plugins: OmniComplete

if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
        \if &omnifunc == "" |
            \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

" Some convenient mappings
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest


" Plugins: Ctags

set tags=./tags;/,~/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif


" Plugins: AutoCloseTag

" Make it so AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim


" Plugins: NerdTree

map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=0    " don't show hidden files (hmmm?)
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0


" Plugins: Session List
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize


" Plugins: JSON
let g:vim_json_syntax_conceal = 0


" Plugins: CtrlP
nnoremap <silent> <Leader><Tab> :CtrlPBuffer<CR>

" let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

if executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack')
    let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
    let s:ctrlp_fallback = 'find %s -type f'
endif

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': s:ctrlp_fallback
\ }

" Plugins: CtrlP Extensions
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>


" Plugins: TagBar
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" If using go please install the gotags program using the following
" go install github.com/jstemmer/gotags
" And make sure gotags is in your path
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }


" Plugins: Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>


" Plugins: YouCompleteMe

let g:acp_enableAtStartup = 0

let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1

" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" For snippet_complete marker.
set conceallevel=2 concealcursor=i

" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt-=preview


" Plugins: UndoTree
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1


" Plugins: indent_guides
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" let g:indent_guides_enable_on_vim_startup = 1


" Plugins: Wildfire
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
    \ "html,xml" : ["at"],
    \ }


" Plugins: vim-airline
" let g:airline_theme = 'base16'
" kalisi
let g:airline_theme = 'kalisi'
" let g:airline_left_sep='›'  " Slightly fancier than '>'
" let g:airline_right_sep='‹' " Slightly fancier than '<'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#left_sep = '›'
" let g:airline#extensions#tabline#left_alt_sep = '›'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1


" Plugins: vim-go
" https://github.com/fatih/vim-go/issues/129
source ~/.vim/plugged/vim-go/autoload/go/doc.vim
" todo: mapping for go filetype:
" au FileType go nmap <Leader>i <Plug>(go-info)
" au FileType go nmap <Leader>od <Plug>(go-doc-browser)
" etc.
let g:go_fmt_fail_silently = 1


" Plugins: yankstack
nmap <ALT+p> <Plug>yankstack_substitute_older_paste
nmap <ALT+P> <Plug>yankstack_substitute_newer_paste
let g:yankstack_yank_keys = ['y', 'd', 'c']


" Plugins: vim-interestingwords
" nnoremap <silent> <leader>n :call WordNavigation('forward')<cr>
" nnoremap <silent> <leader>N :call WordNavigation('backward')<cr>

" GUI Settings

" GVIM- (here instead of .gvimrc)
if has('gui_running')
    set guioptions-=m         " Remove menu bar
    set guioptions-=T         " Remove toolbar
    " set lines=999 columns=999 " //Maximize// gvim window. -> kde window/application rules
endif
