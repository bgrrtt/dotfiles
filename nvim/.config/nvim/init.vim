"
" nvim/init.vim
"
"


" viMproved =================================================================== {{{

set nocompatible
filetype plugin indent on

" }}}


" Plugins ===================================================================== {{{

" Install Plug to manage plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif

" Specify directory for plugin files
call plug#begin('~/.local/share/nvim/plugged')

  " Plug
  Plug 'junegunn/vim-plug'

  " Colors
  Plug 'lifepillar/vim-solarized8'

  " Completion Engine
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Explorer
  Plug 'preservim/nerdtree'
  Plug 'tsony-tsonev/nerdtree-git-plugin' " fork of xuyuanp/nerdtree-git-plugin with git status colors
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " Git
  Plug 'tpope/vim-fugitive'

  " Search
  " === Plug 'brooth/far.vim' ", not ready
  Plug 'wincent/ferret'
  Plug 'wincent/loupe'

  " Syntax
  Plug 'ryanoasis/vim-devicons'
  Plug 'sheerun/vim-polyglot'

  " Status Line
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'

  " UI
  " === Plug 'majutsushi/tagbar' ", not ready
  " === Plug 'mbbill/undotree'   ", not ready

  " UX
  " === Plug 'camspiers/animate.vim' ", not ready
  " === Plug 'camspiers/lens.vim'    ", not ready
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'wincent/terminus'

  " Applications
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
  Plug 'mhinz/vim-startify'
  Plug 'vimwiki/vimwiki'

call plug#end()

" }}}


" General ===================================================================== {{{

" Syntax
syntax on

" Colors
set termguicolors
set background=dark

" System
set hidden
set lazyredraw

" Errors
set errorbells
set visualbell

" UI
set ruler
set number
set showcmd
set noshowmode
set cmdheight=2
set laststatus=2
set fillchars+=vert:│

" Editor
set nowrap
set backspace=indent,eol,start " nvim default
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Clipboard
set clipboard+=unnamed

" Cursor
set cursorline
set nocursorcolumn
set showmatch
set virtualedit=onemore

" Display
set display=lastline,msgsep " nvim default

" Timeout
set timeoutlen=200
set ttimeoutlen=50
set updatetime=300

" Wildmenu
set wildmenu
set wildmode=full
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*

" Backups
set backupdir=$HOME/.local/share/nvim/backup//
set nobackup
set nowritebackup

" Swap
set directory=$HOME/.local/share/nvim/swap// " nvim default
set noswapfile

" Undo
set undodir=$HOME/.local/share/nvim/undo//
set undofile

" Spelling
set complete+=kspell
set spelllang=en
set spellfile=$HOME/.config/nvim/spell/en.utf-8.add
hi clear SpellBad
hi SpellBad cterm=underline

" The // at the end of the directory name tells Vim to use
" the absolute path to the file to create the swap file so
" there aren't collisions between files of the same name
" from different directories.

" The ^= syntax for :set prepends the directory name to
" the head of the list, so Vim will check that directory
" first.

" }}}


" Maps ======================================================================== {{{

" Leader Key
let mapleader="\<space>"

" ;
nnoremap ; :

" ESC
inoremap jf <Esc>
inoremap fj <Esc>
inoremap jj <Esc>
tnoremap <Esc> <C-\><C-n>

" Cusor Movement
nnoremap H 0
nnoremap L $
nnoremap J 5j
nnoremap K 5k

" Window Movement
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-H> <C-W><C-H>
" nnoremap <C-L> <C-W><C-L>

tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Indentation
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Remove Line in Insert Mode
inoremap <c-d> <esc>ddi

" Remove Search Highlights
map <esc> :nohlsearch<cr>

" Config Shortcuts
nnoremap <Leader>ev :tabedit $MYVIMRC<cr>
nnoremap <Leader>ec :tabedit $HOME/.config/nvim/config<cr>
nnoremap <Leader>es :tabedit $HOME/.config/nvim/spell<cr>


" }}}


" Autocommands ================================================================ {{{

augroup source_settings_on_save
  autocmd!
  autocmd BufWritePost $MYVIMRC source %
  autocmd BufWritePost $HOME/.config/nvim/ftplugin/*.vim source %
  autocmd BufWritePost $HOME/.config/nvim/spell/* mkspell! %
augroup END

augroup center_cursor_vertically
  autocmd!
  autocmd BufEnter,WinEnter,WinNew,VimResized *,*.*
	\ let &scrolloff=winheight(win_getid())/4
augroup END

" }}}


" Filetypes =================================================================== {{{

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim set foldlevelstart=0
  autocmd FileType vim setlocal foldmarker={{{,}}}
augroup END

augroup filetype_markdown
  autocmd!
  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
augroup END

" }}}


" Folding ===================================================================== {{{

function! FoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . '   |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=FoldText()

" }}}


" Advanced Configuration ====================================================== {{{


" Plug ------------------------------------------------------------------------ {{{

command! PC PlugClean
command! PI PlugInstall
command! PU PlugUpgrade
command! PA PlugClean | PlugInstall | PlugUpgrade

" }}}


" Coc ------------------------------------------------------------------------- {{{

" https://www.npmjs.com/package/coc-github
" https://www.npmjs.com/package/coc-webpack
" https://www.npmjs.com/package/coc-docker
" https://www.npmjs.com/package/coc-sql
" https://www.npmjs.com/package/coc-post
" https://www.npmjs.com/package/coc-tailwindcss
" https://github.com/shtanton/coc-fs-lists

" Check back space (for Coc)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use <tab> for trigger completion and navigate to next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Lightline support
function! CocLightlineCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" Highlight selected word in document
nmap <expr> <silent> <c-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

" }}}

" Coc-yank -------------------------------------------------------------------- {{{

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" }}}

" Coc-highlight -------------------------------------------------------------------- {{{

" To enable highlight current symbol on CursorHold, add:
autocmd CursorHold * silent call CocActionAsync('highlight')

" }}}


" Starify --------------------------------------------------------------------- {{{

let g:startify_custom_header = [
\ '     ______                           __   __     _                  _          ____ _',
\ '    / ____/_   __ ___   _____ __  __ / /_ / /_   (_)____   ____ _   (_)_____   / __/(_)____   ___',
\ '   / __/  | | / // _ \ / ___// / / // __// __ \ / // __ \ / __ `/  / // ___/  / /_ / // __ \ / _ \',
\ '  / /___  | |/ //  __// /   / /_/ // /_ / / / // // / / // /_/ /  / /(__  )  / __// // / / //  __/_',
\ ' /_____/  |___/ \___//_/    \__, / \__//_/ /_//_//_/ /_/ \__, /  /_//____/  /_/  /_//_/ /_/ \___/(_)',
\ '                           /____/                       /____/',
\ '',
\ ]

" let g:startify_custom_header = ['']
let g:startify_custom_footer = ['']
let g:startify_files_number = 5

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': [' MRU']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_session_dir = '~/.local/share/nvim/sessions' " Does this work?

" }}}


" Vimwiki --------------------------------------------------------------------- {{{

let g:vimwiki_list = [{'path': '~/Wiki/'}]

" }}}



" NERDTree -------------------------------------------------------------------- {{{

noremap <C-o> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeRespectWildIgnore=1
let NERDTreeAutoDeleteBuffer = 1

" let NERDTreeIgnore=['\.DS_Store$'] " ignoring with wildignore instead

" nerdtree-git-plugin

let g:NERDTreeShowIgnoredStatus = 1

" tsony-tsonev/nerdtree-git-plugin only

let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeColorMapCustom = {
    \ "Modified"  : "#528AB3",
    \ "Staged"    : "#538B54",
    \ "Untracked" : "#BE5849",
    \ "Dirty"     : "#b58900",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }


let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" }}}


" NERDCommenter --------------------------------------------------------------- {{{

let g:NERDSpaceDelims = 1

" }}}


" Lightline --------------------------------------------------------------- {{{

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'coccurrentfunction', 'readonly', 'filename', 'modified', 'spell' ] ],
      \   'right': [ ['lineinfo'], ['percent'], ['filetype' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'coccurrentfunction': 'CocLightlineCurrentFunction',
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" }}}


" Signify --------------------------------------------------------------------- {{{

let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
let g:signify_line_highlight = 0

" }}}

" DevIcons -------------------------------------------------------------------- {{{

let g:webdevicons_enable = 1
" let g:webdevicons_conceal_nerdtree_brackets = 0
let g:DevIconsEnableFoldersOpenClose = 1

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

" }}}

" Better Whitespace ----------------------------------------------------------- {{{

let g:better_whitespace_enabled = 1
" let g:strip_whitespace_on_save = 1

" }}}


" Ferret and Loupe ------------------------------------------------------------ {{{


" }}}


" }}}


" Colorscheme ================================================================= {{{

" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:solarized_visibility = 'flat'
let g:solarized_statusline = 'flat'
let g:solarized_old_cursor_style = 1

colorscheme solarized8
set guifont=Fura\ Code\ Nerd\ Font\ Medium\ 16

" }}}
