-------------------------------------------------------------------------------
-- Plugins {{{ ----------------------------------------------------------------
-------------------------------------------------------------------------------
-- TODO https://github.com/nvim-lua/wishlist/issues/18#issuecomment-812092951
-- TODO Lua based *.vpm SetVimPresentationMode sorta like sotte/presenting.vim
-- LSP
-- Treesitter
-- Telescope
-- FZF
-- lualine
-- lspsaga
-- https://github.com/nvim-lua/kickstart.nvim
local install_path = vim.fn.stdpath('data') ..  '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.cmd 'packadd packer.nvim'
end

require('packer').init({
    display = {
        open_fn = function()
            return require('packer.util').float({border = 'single'})
        end,
        prompt_border = 'single'
    },
    git = {
        clone_timeout = 800 -- Timeout, in seconds, for git clones
    },
    compile_path = vim.fn.stdpath('config') .. '/lua/ide/compile.lua',
    auto_clean = true,
    compile_on_sync = true
})

-- require('ide.compile')

return require('packer').startup({
    function(use)

        --
        -- Packer + Global Dependancies
        --
        use {'wbthomason/packer.nvim'}

        --
        -- Colors
        --
        use {
            'ishan9299/nvim-solarized-lua',
            config = function() vim.cmd('colorscheme solarized-flat') end
        }

        --
        -- Icons
        --
        use {'kyazdani42/nvim-web-devicons'}

        --
        -- LSP
        --
        use {
            'neovim/nvim-lspconfig',
            requires = {
                'jose-elias-alvarez/null-ls.nvim',
                'glepnir/lspsaga.nvim',
                'ray-x/lsp_signature.nvim',
                'hrsh7th/cmp-nvim-lsp'
            },
            config = function()

                -- local on_attach = function(client, bufnr)
                --   require('lsp_signature').on_attach()  -- Note: add in lsp client on-attach
                -- end

                -- Use an on_attach function to only map the following keys
                -- after the language server attaches to the current buffer
                local on_attach = function(client, bufnr)
                    require('lsp_signature').on_attach()
                end

                -- nvim-cmp supports additional completion capabilities
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

                -- require('lspsaga').init_lsp_saga({})
                require('lspconfig').intelephense.setup({
                    capabilities = capabilities,
                    on_attach = on_attach
                })
                require('lspconfig').tsserver.setup({
                    capabilities = capabilities,
                    on_attach = on_attach
                })
                -- require('lspconfig').sumneko_lua.setup({
                --     settings = {Lua = {diagnostics = {globals = {'vim'}}}}
                -- })
            end
        }

        --
        -- Completion
        --
        -- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
        use {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-calc',
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip'
            },
            config = function()
                local cmp = require 'cmp'
                local luasnip = require 'luasnip'

                cmp.setup {
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end
                    },
                    mapping = {
                        ['<C-p>'] = cmp.mapping.select_prev_item(),
                        ['<C-n>'] = cmp.mapping.select_next_item(),
                        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-e>'] = cmp.mapping.close(),
                        ['<CR>'] = cmp.mapping.confirm {
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = true
                        },
                        ['<Tab>'] = function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end,
                        ['<S-Tab>'] = function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end
                    },
                    sources = {{name = 'nvim_lsp'}, {name = 'luasnip'}}
                }
            end
        }

        --
        -- Treesitter
        --
        use {
            'nvim-treesitter/nvim-treesitter',
            requires = {
                'nvim-treesitter/nvim-treesitter-refactor',
                'nvim-treesitter/nvim-treesitter-textobjects'
            },
            run = ':TSUpdate',
            config = function()
                require('nvim-treesitter.configs').setup({
                    ensure_installed = {
                        'html',
                        'php',
                        'javascript',
                        'lua',
                        'css',
                        'json',
                        'scss',
                        'typescript'
                    },
                    highlight = {
                        enable = true,
                        -- custom_captures = {
                        --     -- Highlight the @foo.bar capture group with the 'Identifier' highlight group.
                        --     ['foo.bar'] = 'Identifier'
                        -- },
                        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                        -- Using this option may slow down your editor, and you may see some duplicate highlights.
                        -- Instead of true it can also be a list of languages
                        additional_vim_regex_highlighting = false
                    },
                    incremental_selection = {
                        enable = true
                        -- keymaps = {
                        --     init_selection = 'gnn',
                        --     node_incremental = 'grn',
                        --     scope_incremental = 'grc',
                        --     node_decremental = 'grm'
                        -- }
                    },
                    indent = {enable = true}
                })
            end
        }

        --
        -- Startpage
        --
        use {
            'glepnir/dashboard-nvim',
            config = function()
                vim.g.dashboard_default_executive = 'telescope'
            end
        }

        --
        -- Statusline
        --
        use {
            'nvim-lualine/lualine.nvim',
            requires = {
                'kyazdani42/nvim-web-devicons', --
                'nvim-lua/lsp-status.nvim'
            },
            config = function()
                require('lualine').setup({
                    options = {
                        icons_enabled = true,
                        theme = 'solarized',
                        component_separators = {'', ''},
                        section_separators = {'', ''},
                        disabled_filetypes = {}
                    },
                    sections = {
                        lualine_a = {'mode'},
                        lualine_b = {'branch'},
                        lualine_c = {'filename', require('lsp-status').status()},
                        lualine_x = {'encoding', 'fileformat', 'filetype'},
                        lualine_y = {'progress'},
                        lualine_z = {'location'}
                    },
                    inactive_sections = {
                        lualine_a = {},
                        lualine_b = {},
                        lualine_c = {'filename'},
                        lualine_x = {'location'},
                        lualine_y = {},
                        lualine_z = {}
                    },
                    tabline = {},
                    extensions = {}
                })
            end
        }

        --
        -- Finder
        --
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/popup.nvim', --
                'nvim-lua/plenary.nvim', --
                'nvim-telescope/telescope-github.nvim',
                'nvim-telescope/telescope-packer.nvim',
                'nvim-telescope/telescope-node-modules.nvim'
            }
        }

        --
        -- Diagnostics
        --
        use {
            'folke/trouble.nvim',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function() require('trouble').setup() end
        }
        use {
            'folke/which-key.nvim',
            config = function() require('which-key').setup() end
        }

        --
        -- Explorer
        --
        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function() require('nvim-tree').setup() end
        }

        --
        -- Git
        --
        use {'tpope/vim-fugitive'}
        -- use {
        --     'tanvirtin/vgit.nvim',
        --     requires = 'nvim-lua/plenary.nvim',
        --     config = function() require('vgit').setup() end
        -- }
        use {
            'lewis6991/gitsigns.nvim',
            requires = {
              'nvim-lua/plenary.nvim'
            },
            config = function()
              require('gitsigns').setup()
            end
          }

        --
        -- Formatters
        --
        use {
            'editorconfig/editorconfig-vim',
            config = function()
                vim.g.EditorConfig_exclude_patterns = {
                    'fugitive://.*',
                    'scp://.*'
                }
            end
        }
        use {'prettier/vim-prettier', run = 'yarn install'}
        -- use {
        --     'mhartington/formatter.nvim',
        --     config = function()
        --         require('formatter').setup({
        --             filetype = {
        --                 lua = {
        --                     -- luafmt
        --                     function()
        --                         return {
        --                             exe = 'luafmt',
        --                             args = {'--indent-count', 4, '--stdin'},
        --                             stdin = true
        --                         }
        --                     end
        --                 }
        --             }
        --         })
        --     end
        -- }

        --
        -- Editor
        --
        use {
            'windwp/nvim-autopairs',
            config = function() require('nvim-autopairs').setup() end
        }

        use {
            'terrortylor/nvim-comment',
            config = function() require('nvim_comment').setup() end
        }

        use {
            'folke/todo-comments.nvim',
            requires = 'nvima-lua/plenary.nvim',
            config = function() require('todo-comments').setup() end
        }

        use {
            'folke/zen-mode.nvim',
            requires = 'folke/twilight.nvim',
            config = function() require('zen-mode').setup() end
        }

        use {
            'norcalli/nvim-colorizer.lua',
            opt = true,
            cmd = {'ColorizerToggle'},
            config = function() require('colorizer').setup() end
        }
    end
})

