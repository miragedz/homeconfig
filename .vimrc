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
" Python-mode 		
" ############################  "
Bundle 'klen/python-mode'

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
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" X3 - si la validation syntaxique va pas super il y a aussi
" https://github.com/scrooloose/syntastic
"
"Linting
let g:pymode_lint = 0
let g:pymode_lint_checker = ["pep8","pyflakes"]
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"  autofold code
let g:pymode_folding = 1

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
 let g:syntastic_always_populate_loc_list = 0
 let g:syntastic_auto_loc_list = 0
 let g:syntastic_check_on_open = 0
 let g:syntastic_check_on_wq = 0

" ############################ "
" END - syntastic
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

" more subtle popup colors 
if has ('gui_running')
	highlight Pmenu guibg=#cccccc gui=bold    
endif

