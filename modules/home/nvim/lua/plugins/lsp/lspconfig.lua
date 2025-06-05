return {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
        'saghen/blink.cmp',
        'yioneko/nvim-vtsls',
        { 'antosha417/nvim-lsp-file-operations', config = true },
        {
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {
                library = {
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
        },
    },

    config = function()
        local lspconfig = require('lspconfig')

        vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = false,
            float = {
                border = 'single',
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ' ',
                    [vim.diagnostic.severity.WARN] = ' ',
                    [vim.diagnostic.severity.HINT] = '󰌵 ',
                    [vim.diagnostic.severity.INFO] = ' ',
                },
            },
        })

        local capabilities = require('blink.cmp').get_lsp_capabilities()

        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            cmd = { '/home/juan/.nix-profile/bin/lua-language-server' },
            settings = {
                Lua = {
                    telemetry = { enable = false },
                    diagnostics = {
                        globals = { 'vim', 'love' },
                    },
                    completion = {
                        callSnippet = 'Replace',
                    },
                    workspace = {
                        library = {
                            '${3rd}/love2d/library',
                        },
                    },
                },
            },
        })

        lspconfig['nixd'].setup({
            capabilities = capabilities,
            cmd = { 'nixd' },
            settings = {
                nixd = {
                    nixpkgs = {
                        expr = 'import <nixpkgs> { }',
                    },
                    formatting = {
                        command = { 'alejandra' },
                    },
                },
                options = {
                    nixos = {
                        expr = '(builtins.getFlake "$HOME/dotfiles/flake.nix").nixosConfigurations.CONFIGNAME.options',
                    },

                    home_manager = {
                        expr = '(builtins.getFlake "$HOME/dotfiles/flake.nix").homeConfigurations.CONFIGNAME.options',
                    },
                },
            },
        })

        lspconfig['tinymist'].setup({
            capabilities = capabilities,
            cmd = {
                '/home/juan/.nix-profile/bin/tinymist',
            },
        })

        lspconfig['html'].setup({
            capabilities = capabilities,
        })

        lspconfig['cssls'].setup({
            capabilities = capabilities,
            cmd = {
                '/home/juan/.nix-profile/bin/vscode-css-language-server',
                '--stdio',
            },
        })

        lspconfig['emmet_ls'].setup({
            capabilities = capabilities,
            filetypes = {
                'html',
                'css',
                'sass',
                'scss',
                -- 'javascript',
                -- 'typescript',
                'javascriptreact',
                'typescriptreact',
            },
        })

        lspconfig['tailwindcss'].setup({
            capabilities = capabilities,
            cmd = {
                '/home/juan/.nix-profile/bin/tailwindcss-language-server',
                '--stdio',
            },
            filetypes = {
                'html',
                'javascript',
                'javascriptreact',
                'typescript',
                'typescriptreact',
            },
        })

        lspconfig['vtsls'].setup({
            capabilities = capabilities,
            -- handlers = {
            --     source_definition = function(err, locations) end,
            --     file_references = function(err, locations) end,
            --     code_action = function(err, actions) end,
            -- },
            filetypes = {
                'javascript',
                'javascriptreact',
                'javascript.jsx',
                'typescript',
                'typescriptreact',
                'typescript.tsx',
            },
            settings = {
                complete_function_calls = true,
                vtsls = {
                    enableMoveToFileCodeAction = true,
                    autoUseWorkspaceTsdk = true,
                    experimental = {
                        maxInlayHintLength = 30,
                        completion = {
                            enableServerSideFuzzyMatch = true,
                        },
                    },
                },
                typescript = {
                    updateImportsOnFileMove = { enabled = 'always' },
                    suggest = {
                        completeFunctionCalls = true,
                    },
                    inlayHints = {
                        enumMemberValues = { enabled = true },
                        functionLikeReturnTypes = { enabled = true },
                        parameterNames = { enabled = 'literals' },
                        parameterTypes = { enabled = true },
                        propertyDeclarationTypes = { enabled = true },
                        variableTypes = { enabled = false },
                    },
                },
            },
        })
    end,
}
