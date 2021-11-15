-------------------------------------------------------------------------------
-- Auto Command Groups {{{ ----------------------------------------------------
-------------------------------------------------------------------------------
--
--
--
vim.api.nvim_exec([[
augroup center_cursor_vertically_auto_group
  autocmd!
  autocmd BufEnter,WinEnter,WinNew,VimResized *,*.*
	\ let &scrolloff=winheight(win_getid())/3
augroup END
]], true)

-- vim-numbertoggle - Automatic toggling between 'hybrid' and absolute line numbers
-- Maintainer:        <https://jeffkreeftmeijer.com>
-- Version:           2.1.2
vim.api.nvim_exec([[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]], true)

-- Highlight on yank
vim.api.nvim_exec([[
augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]], false)

--
--
-- https://github.com/nickjj/dotfiles
vim.api.nvim_exec([[
" Only show the cursor line in the active buffer.
augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
]], true)

--
--
-- https://github.com/nickjj/dotfiles
vim.api.nvim_exec([[
" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab
]], true)

