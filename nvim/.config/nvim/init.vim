"
" nvim/init.vim
"
"


" viMproved =================================================================== {{{

set nocompatible
filetype plugin indent on

" }}}


" General ===================================================================== {{{

" Syntax
syntax on

" Colors
set termguicolors
set background=dark

" System
set hidden
set nolazyredraw
set confirm

" Errors
set noerrorbells
set novisualbell

" UI
set ruler
set number
set signcolumn=yes

set showcmd
set noshowmode

set showtabline=2
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
set ttimeoutlen=20
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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


" Keymaps ======================================================================= {{{

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

  " Comments
  Plug 'preservim/nerdcommenter'

  " Completions
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Explorer
  Plug 'preservim/nerdtree'
  " Plug 'tsony-tsonev/nerdtree-git-plugin' " fork of xuyuanp/nerdtree-git-plugin with git status colors
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " Git
  " Plug 'tpope/vim-fugitive'

  " Search
  " Plug 'wincent/ferret'
  " Plug 'wincent/loupe'

  " Status
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'

  " Syntax
  Plug 'sheerun/vim-polyglot'

  " UX
  " === Plug 'camspiers/animate.vim' ", not ready
  " === Plug 'camspiers/lens.vim'    ", not ready
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'wincent/terminus'

call plug#end()

" }}}


" Plugin Configuration ======================================================== {{{

" Plug ------------------------------------------------------------------------ {{{

command! PC PlugClean
command! PI PlugInstall
command! PU PlugUpgrade
command! PA PlugClean | PlugInstall | PlugUpgrade

" }}}


" Coc ------------------------------------------------------------------------- {{{

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" }}}

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" NERDCommenter --------------------------------------------------------------- {{{

let g:NERDSpaceDelims = 1

" }}}


" Lightline --------------------------------------------------------------- {{{

let g:lightline#bufferline#show_number  = 0
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#clickable    = 1

let g:lightline                  = {'colorscheme': 'solarized'}
let g:lightline.tabline          = {'left': [ ['buffers'] ], 'right': [ [] ]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.component_raw    = {'buffers': 1}

" Uncomment when adding the buffers to the bottom statusbar
" otherwise, the modified indicator will not be updated immediately
" autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" }}}


" }}}


" Colorscheme ================================================================= {{{

" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:solarized_visibility = 'flat'
let g:solarized_statusline = 'flat'
let g:solarized_old_cursor_style = 1

colorscheme solarized8

" }}}
