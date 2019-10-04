:set tabstop=8
:set shiftwidth=8

":set modeline
""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim startup settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: if you're on gVim for Windows and want to supress the default
" Windows shortcuts (ctrl + a, ctrl + v, etc) and instead use the default Vim
" actions associated with them, find these two lines in whatever _vimrc is
" supplied with your installation and comment them out with a double quote:
" source $VIMRUNTIME/mswin.vim
" behave mswin

"Note: if you're using with PuTTY and tmux (or maybe just tmux I haven't
"tested) check the bottom area of this config regarding the Solaraized background
"cause it can mess up the coloring if it isn't enabled.

" Fix backspaces on OSX
set backspace=indent,eol,start

" Enable syntax highlighting
syntax enable

" Enable 256-color mode
set t_Co=256


" Add numberlines and adjust gutter width
set numberwidth=5
set number
:highlight LineNr term=bold cterm=NONE ctermfg=6 ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


" Color column 80
:set colorcolumn=80
:highlight ColorColumn term=REVERSE ctermbg=7


" Set relative line numbers
set relativenumber


" Adjust the counting method, so that when words wrap it doesn't fuck up the
" counting
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


" Draw lines to indicate tab levels
set list lcs=tab:\|\ 

" Draw a sidebar that indicates folds
set foldcolumn=2

" Automatically save and load views
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Open man pages in a new tab
noremap <c-k> :execute "tab h " . expand("<cword>")<cr>

" Save marks
:set viminfo='1000,f1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'

Plug 'bronson/vim-trailing-whitespace'

Plug 'tpope/vim-surround'

Plug 'sirver/ultisnips'

Plug 'honza/vim-snippets'

" Approximates colorschemes designed for gvim to a 256-color palette
Plug 'godlygeek/csapprox'

Plug 'junegunn/vim-easy-align'

Plug 'kien/rainbow_parentheses.vim'

" Preview CSS colors inside vim
Plug 'ap/vim-css-color'

" clang autocompletion
Plug 'rip-rip/clang_complete'

" Lets you use tab for autocomplete
Plug 'ervandew/supertab'

" Auto closing (, [, and {
Plug 'cohama/lexima.vim'

" Dracula colors
Plug 'dracula/vim'

" Syntax checker for Vim
Plug 'scrooloose/syntastic'

" Visible marks
Plug 'kshenoy/vim-signature'

" Adds a bar that lists tagged information; requires ctags to be in $PATH
Plug 'majutsushi/tagbar'

" base-16 colors
" Plug 'chriskempson/base16-vim'

call plug#end()


" Settings for ultisnips
" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Temporary workaround for a bug where UltiSnipsEdit creates snips in the
" 	Wrong place
let g:UltraSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']


" Settings for easy-align
" Maps align mode interactive to the Enter key
vnoremap <silent> <Enter> :EasyAlign<cr>


"Settings for rainbow parentheses
" (There are also autocmd commands for it at the bottom)
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

let g:rbpt_colorpairs = [
	\ ['darkyellow',  'RoyalBlue3'],
	\ ['darkgreen',   'SeaGreen3'],
	\ ['darkcyan',    'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['DarkMagenta', 'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkyellow',  'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['DarkMagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkyellow',  'DarkOrchid3'],
	\ ['darkred',     'firebrick3'],
	\ ]


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Ease-of-use mapping to turn Syntastic off and on
nmap <F9> :SyntasticToggleMode<CR>

" Settings for Tagbar
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme settings
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula
" colorscheme base16-dracula

highlight Normal ctermbg=none
highlight NonText ctermbg=none

""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc final settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Reload this file right before vim starts so colorcheme settings take effect
autocmd VimEnter * source ~/.vimrc
autocmd VimEnter * RainbowParenthesesActivate
autocmd VimEnter * RainbowParenthesesLoadRound
" autocmd Syntax * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/

"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background
"endif

" Always show statusline
set laststatus=2

" Hide the mode in the command bar
" set noshowmode

" Deprecated Options
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
" set t_Co=256
" set encoding=utf-8
" set termencoding=utf-8
" set term=xterm-256color
" set termguicolors
" let base16colorspace=256
