-------------------------------------------------------------------------------
-- Keymaps {{{ ----------------------------------------------------------------
-------------------------------------------------------------------------------
local function map(mode, lhs, rhs, opts)
    local options = {}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function noremap(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------------------------------------------------------------------

noremap('n', '<Leader>f', '<Plug>(FerretAckWord)', {})

noremap('n', ';', ':', {})

noremap('i', 'fj', '<Esc>', {})
noremap('i', 'jf', '<Esc>', {})

noremap('v', '<Tab>', '>gc', {})
noremap('v', '<S-Tab>', '<gv', {})

-- <Tab> to navigate the completion menu
-- noremap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
-- noremap('i', '<Tab>',   'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

noremap('n', '<leader>o', 'm`o<Esc>``') -- Insert a newline in normal mode

noremap('n', 'confe', ':edit $MYVIMRC<CR>', {})
noremap('n', 'confn', ':edit $HOME/.config/nvim<CR>', {})
noremap('n', 'confp', ':edit $HOME/.config/nvim/plugin<CR>', {})

-------------------------------------------------------------------------------

