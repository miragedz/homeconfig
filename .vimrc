" ######################## "
" Doc et Reference 
" ######################## "
" DOC : http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
" DOC : http://www.sontek.net/blog/2011/05/07/turning_vim_into_a_modern_python_ide.html
" DOC : https://speakerdeck.com/mbrochh/vim-as-a-python-ide
" DOC : https://github.com/klen/python-mode
" DOC : http://www.jeffknupp.com/blog/2013/12/04/my-development-environment-for-python/

set nocompatible
filetype off


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ############################ "
" Vundle system de gestion de plugin 
" ############################ "
" let Vundle manage Vundle
Bundle 'gmarik/vundle'


" Desactivation de l'auto-Indentation
filetype plugin indent on

augroup vimrc_autocmds
    autocmd!
    " Activation de l'auto-indentation pour python
    autocmd FileType python filetype plugin indent on
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" ############################  "
" powerline - Status bar 
" ############################  "
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Powerline setup
" fix font error : 
" $ wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
" $ wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
" $ mv PowerlineSymbols.otf ~/.fonts/
" $ fc-cache -vf ~/.fonts/
" $ mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
set guifont=DejaVu\ Sans\ Mono
set laststatus=2

" Ajout de la configuration pour la coloration de la ligne 
" ref: http://choorucode.com/2013/02/17/how-to-install-and-use-vim-powerline-plugin-for-vim/
set t_Co=256
let g:Powerline_symbols = "fancy"

" ############################  "
" END   powerline 	 	"
" ############################  "

" ############################  "
" Vim Fugitive - Git module 
" ############################  "
Bundle 'tpope/vim-fugitive'

" ############################  "
" NerdTree - File Browser 
" ############################  "

Bundle 'scrooloose/nerdtree'

" Press F2 in vim and it will take you to the current working directory
map <F2> :NERDTreeToggle<CR>

" ########################### "
" Utilisation des TAB - Besoin de VIM 7 "
" ########################### "

" Press F3 in vim To go to the Previous TAB
map <F3> :tabprevious <CR>

" Press F4 in vim to Open New TAB
map <F4> :tabnew<CR>

" Press F5 in vim To go to the Next TAB
map <F5> :tabnext <CR>


" ############################  "
" Python-mode - Desactive sur le EEEPC prend trop de jus
" ############################  "
" Bundle 'klen/python-mode'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"let g:pymode_rope = 0

" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'

" X3 - si la validation syntaxique va pas super il y a aussi
" https://github.com/scrooloose/syntastic
"
"Linting
"let g:pymode_lint = 0
"let g:pymode_lint_checker = ["pep8","pyflakes"]
" Auto check on save
"let g:pymode_lint_write = 0

" Support virtualenv
"let g:pymode_virtualenv = 1

" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

"  autofold code
" let g:pymode_folding = 1

" ############################  "
" END - Python-mode 		
" ############################  "

" ############################ "
" syntastic
" ############################ "

Bundle 'scrooloose/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
" TODO : Voir pour faire ouvrir la fenetre d'erreur 
" sur demande
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" ############################ "
" END - syntastic
" ############################ "

" ############################ "
" puppet-vim                   " 
" ############################ "

Bundle "puppetlabs/puppet-syntax-vim"
au BufRead,BufNewFile *.pp              set filetype=puppet

" Ajout de la validation syntaxque 
let g:syntastic_puppet_checkers=['puppetlint']


"set shellcmdflag=-ic
set tags=./tags;~/
set kp=pi
set iskeyword=-,:,@,48-57,_,192-255

" ############################ "
" END - puppet-vim             "
" ############################ "

" ############################ "
" taglist
" TODO : approfondir les options du site :
" https://gist.github.com/trlinkin/6924042
" ############################ "

" Configuration original 
" Bundle 'vim-scripts/taglist.vim'
" Press t in vim and it will show tag list
" map t :TlistToggle<CR>

Bundle 'vim-scripts/AutoTag'
Bundle 'majutsushi/tagbar'

map t :TagbarToggle<CR>
let g:tagbar_type_puppet = {
            \ 'ctagstype': 'puppet',
            \ 'kinds': [
            \'c:class',
            \'s:site',
            \'n:node',  
            \'d:definition',
            \'r:resource',
            \'f:default'
            \]
            \}

" ############################ "
" END - taglist
" ############################ "

" ############################ "
" grep
" ############################ "
Bundle 'vim-scripts/grep.vim'

" ############################ "
" END - grep
" ############################ "

" ############################ "
" Taklist
" ############################ "
Bundle 'vim-scripts/TaskList.vim'
" map <leader>t <Plug>TaskList


" ############################ "
" END - Tasklist
" ############################ "

" ############################ "
" Revision History             "
" ############################ "

Bundle 'sjl/gundo.vim.git'

map <leader>g :GundoToggle<CR>

" ############################ "
" END -  Revision History      "
" ############################ "

" ############################ "
" color scheme
" ############################ "
" PROB : 
" 
" Les commmantaire pas assez distinct
"Bundle 'tomasr/molokai'
"set background=dark
"let g:rehash256 = 1
"colorscheme molokai

" Les commmantaire pas assez distinct
" Bundle 'vim-scripts/The-Vim-Gardener'
" colorscheme gardener

" J'aime pas le backgroup Gris
" Bundle 'w0ng/vim-hybrid'
"  colorscheme hybrid

" Boff 
" Bundle 'vim-scripts/256-grayvim'
" colorscheme 256-grayvim

" Boff
" Bundle 'vim-scripts/rdark-terminal'
" colorscheme rdark-terminal


" Pas mal
" Bundle 'jonathanfilip/vim-lucius'
" colorscheme lucius
" LuciusBlack
" let g:lucius_use_bold = 9

" J'aime pas le backgroud gris !
"Bundle 'carlson-erik/wolfpack'
" colorscheme wolfpack

" Bien pour python mais boff pour le reste
" Bundle 'yantze/pt_black'
" colorscheme pt_black

" un peu sombre :( 
" Bundle 'vim-scripts/twilight256.vim'
" colorscheme twilight256

" J'aime BIEN
Bundle 'vim-scripts/tchaba'
" colorscheme tchaba2

" Full contraste interaissant !!
Bundle 'vim-scripts/miko'
colorscheme miko

Bundle 'vim-scripts/moria'
"colorscheme moria
"let moria_style = 'dark'

Bundle 'nanotech/jellybeans.vim'
" set t_Co=256
" set background=dark
" colorscheme jellybeans
" let s:termBlack = "Black"


" ############################ "
" END - color scheme
" ############################ "

" enable code folding. type ‘za’ to open and close a fold.
set foldmethod=indent
set foldlevel=99

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" automatically change window's cwd to file's dir
set autochdir

" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
endif

