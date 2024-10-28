return {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true },
        { 'folke/neodev.nvim', opts = {} },
        'yioneko/nvim-vtsls',
    },

    config = function()
        local lspconfig = require('lspconfig')
        local mason_lspconfig = require('mason-lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(event)
                local opts = { buffer = event.buf, silent = true }

                opts.desc = 'Hover'
                vim.keymap.set(
                    'n',
                    '<leader>h',
                    '<cmd>lua vim.lsp.buf.hover()<cr>',
                    opts
                )

                opts.desc = 'Goto definition'
                vim.keymap.set(
                    'n',
                    'gd',
                    '<cmd>Telescope lsp_definitions<cr>',
                    opts
                )

                opts.desc = 'Goto references'
                vim.keymap.set(
                    'n',
                    'gr',
                    '<cmd>Telescope lsp_references<cr>',
                    opts
                )

                opts.desc = 'Show lsp implementation'
                vim.keymap.set(
                    'n',
                    'gi',
                    '<cmd>Telescope lsp_implementations<cr>',
                    opts
                )

                opts.desc = 'Goto implementation'
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

                opts.desc = 'Show lsp definition'
                vim.keymap.set(
                    'n',
                    '<leader>d',
                    '<cmd>Telescope lsp_type_definitions<cr>',
                    opts
                )

                -- opts.desc = "type definition"
                -- vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, opts)

                opts.desc = 'Document symbols'
                vim.keymap.set(
                    'n',
                    '<leader>ds',
                    vim.lsp.buf.document_symbol,
                    opts
                )

                opts.desc = 'Workspace symbols'
                vim.keymap.set(
                    'n',
                    '<leader>ws',
                    vim.lsp.buf.workspace_symbol,
                    opts
                )

                opts.desc = 'Rename'
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

                opts.desc = 'Code action'
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

                opts.desc = 'Goto declaration'
                vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, opts)

                -- [ vtsls ]
                opts.desc = 'Restart'
                vim.keymap.set(
                    'n',
                    '<leader>tr',
                    '<cmd>VtsExec restart_tsserver<CR>',
                    opts
                )

                opts.desc = 'Organize imports'
                vim.keymap.set(
                    'n',
                    '<leader>to',
                    '<cmd>VtsExec organize_imports<CR>',
                    opts
                )

                opts.desc = 'Sort imports'
                vim.keymap.set(
                    'n',
                    '<leader>ts',
                    '<cmd>VtsExec sort_imports<CR>',
                    opts
                )

                opts.desc = 'Remove unused imports'
                vim.keymap.set(
                    'n',
                    '<leader>tu',
                    '<cmd>VtsExec remove_unused_imports<CR>',
                    opts
                )

                opts.desc = 'Add missing imports'
                vim.keymap.set(
                    'n',
                    '<leader>ta',
                    '<cmd>VtsExec add_missing_imports<CR>',
                    opts
                )
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs =
            { Error = ' ', Warn = ' ', Hint = '󰌵 ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            ['vtsls'] = function()
                lspconfig['vtsls'].setup({
                    capabilities = capabilities,
                    handlers = {
                        source_definition = function(err, locations) end,
                        file_references = function(err, locations) end,
                        code_action = function(err, actions) end,
                    },
                })
            end,

            ['emmet_ls'] = function()
                lspconfig['emmet_ls'].setup({
                    capabilities = capabilities,
                    filetypes = {
                        'html',
                        'css',
                        'sass',
                        'scss',
                        'javascript',
                        'typescript',
                        'javascriptreact',
                        'typescriptreact',
                    },
                })
            end,

            ['lua_ls'] = function()
                lspconfig['lua_ls'].setup({
                    capabilities = capabilities,
                    cmd = { '/home/juan/.nix-profile/bin/lua-language-server' },
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' },
                            },
                            completion = {
                                callSnippet = 'Replace',
                            },
                        },
                    },
                })
            end,
        })
    end,
}
