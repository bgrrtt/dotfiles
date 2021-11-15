-------------------------------------------------------------------------------
-- Options {{{ ----------------------------------------------------------------
-------------------------------------------------------------------------------
-- TODO:
-- set nowritebackup
-- set showtabline      = 2
-- set cmdheight        = 2
-- set numberwidth      = 2
-- set clipboard        += unnamed
-------------------------------------------------------------------------------
-- TODO:
-- vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
-- vim.opt.expandtab = true                -- Use spaces instead of tabs
-- vim.opt.hidden = true                   -- Enable background buffers
-- vim.opt.ignorecase = true               -- Ignore case
-- vim.opt.joinspaces = false              -- No double spaces with join
-- vim.opt.list = true                     -- Show some invisible characters
-- vim.opt.number = true                   -- Show line numbers
-- vim.opt.relativenumber = true           -- Relative line numbers
-- vim.opt.scrolloff = 4                   -- Lines of context
-- vim.opt.shiftround = true               -- Round indent
-- vim.opt.shiftwidth = 2                  -- Size of an indent
-- vim.opt.sidescrolloff = 8               -- Columns of context
-- vim.opt.smartcase = true                -- Do not ignore case with capitals
-- vim.opt.smartindent = true              -- Insert indents automatically
-- vim.opt.splitbelow = true               -- Put new windows below current
-- vim.opt.splitright = true               -- Put new windows right of current
-- vim.opt.tabstop = 2                     -- Number of spaces tabs count for
-- vim.opt.termguicolors = true            -- True color support
-- vim.opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
-- vim.opt.wrap = false                    -- Disable line wrap
-------------------------------------------------------------------------------
vim.cmd('filetype indent plugin on')
vim.cmd('syntax on')

--
-- Global-Local Options -- vim.opt.
--
vim.opt.backspace = 'indent,start,eol' -- allow unrestricted backspacing in insert mode
vim.opt.background = 'dark' --
vim.opt.completeopt = {
    'menuone', 'noinsert', 'noselect' --
}
vim.opt.confirm = true --
vim.opt.cursorline = true -- highlight current line
vim.opt.cursorcolumn = false --
vim.opt.errorbells = false --
vim.opt.expandtab = true -- always use spaces instead of tabs
vim.opt.fillchars = {
    diff = '∙', -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    eob = ' ', -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
    fold = '·', -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    vert = '┃' -- BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
}
vim.opt.hidden = true -- allows you to hide buffers with unsaved changes without being prompted
vim.opt.laststatus = 2 -- always show status line
vim.opt.lazyredraw = true -- don't bother updating screen during macro playback
vim.opt.modelines = 5 -- scan this many lines looking for modeline
vim.opt.number = true -- show line numbers in gutter
vim.opt.relativenumber = true -- show relative numbers in gutter
vim.opt.scrolloff = 4 -- start scrolling 3 lines before edge of viewport
vim.opt.shiftround = false -- don't always indent by multiple of shiftwidth
vim.opt.shiftwidth = 2 -- spaces per tab (when shifting)
vim.opt.softtabstop = 2 --
vim.opt.showcmd = false -- don't show extra info at end of command line
vim.opt.showmatch = true --
vim.opt.showmode = false --
-- vim.opt.shortmess       = vim.opt.shortmess + 'A'  -- ignore annoying swapfile messages
vim.opt.shortmess = vim.opt.shortmess + 'I' -- no splash screen
vim.opt.shortmess = vim.opt.shortmess + 'O' -- file-read message overwrites previous
vim.opt.shortmess = vim.opt.shortmess + 'T' -- truncate non-file messages in middle
vim.opt.shortmess = vim.opt.shortmess + 'W' -- don't echo "[w]"/"[written]" when writing
vim.opt.shortmess = vim.opt.shortmess + 'a' -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
vim.opt.shortmess = vim.opt.shortmess + 'c' -- completion messages
vim.opt.shortmess = vim.opt.shortmess + 'o' -- overwrite file-written messages
vim.opt.shortmess = vim.opt.shortmess + 't' -- truncate file messages at start
vim.opt.splitbelow = true -- open horizontal splits below current window
vim.opt.splitright = true -- open vertical splits to the right of the current window
vim.opt.tabstop = 2 -- spaces per tab
vim.opt.termguicolors = true -- use guifg/guibg instead of ctermfg/ctermbg in terminal
vim.opt.updatetime = 100 -- CursorHold interval
vim.opt.visualbell = true -- stop annoying beeping for non-error errors
-- vim.opt.virtualedit  = 'block'                  -- allow cursor to move where there is no text in visual block mode
vim.opt.virtualedit = 'onemore' --
vim.opt.wrap = false -- wrap

--
-- Global Options -- vim.go. or vim.o.
--

--
-- Window Options -- vim.wo.
--

vim.wo.signcolumn = 'number' --

--
-- Buffer Options -- vim.bo.
--

-------------------------------------------------------------------------------
-- Backup, Swap, and Undo Options {{{ -----------------------------------------
-------------------------------------------------------------------------------

local home = vim.env.HOME
local localPath = home .. '/.local/share/nvim'
local root = vim.env.USER == 'root'

--
-- Backup
--
vim.opt.backup = false -- don't make backups before writing
vim.opt.backupcopy = 'yes' -- overwrite files to update, instead of renaming + rewriting
vim.opt.backupdir = localPath .. '/backup//' -- keep backup files out of the way (ie. if 'backup' is ever set)
vim.opt.backupdir = vim.opt.backupdir + '.' -- fallback

--
-- Swap
--
vim.opt.swapfile = false -- don't create swap files
vim.opt.directory = localPath .. '/swap//' -- keep swap files out of the way

--
-- Undo
--
if root then
    vim.opt.undofile = false -- don't create root-owned files
else
    vim.opt.undodir = localPath .. '/undo//' -- keep undo files out of the way
    vim.opt.undodir = vim.opt.undodir + '.' -- fallback
    vim.opt.undofile = true -- actually use undo files
end

-- The // at the end of the directory name tells Vim to use
-- the absolute path to the file as the created filename so
-- there aren't collisions between files of the same name
-- from different directories.

-------------------------------------------------------------------------------
