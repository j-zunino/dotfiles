return {
    'stevearc/conform.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local conform = require('conform')

        conform.setup({
            vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                })
            end, { desc = 'Format buffer' }),

            formatters = {
                typstyle = {
                    command = '/home/juan/.nix-profile/bin/typstyle',
                },

                jq = {
                    command = '/home/juan/.nix-profile/bin/jq',
                    args = { '.' },
                },

                stylua = {
                    command = '/home/juan/.nix-profile/bin/stylua',
                    args = {
                        '--search-parent-directories',
                        '--stdin-filepath',
                        '$FILENAME',
                        '-',
                    },
                },
            },

            formatters_by_ft = {
                html = { 'prettierd' },
                css = { 'prettierd' },
                javascript = { 'prettierd' },
                typescript = { 'prettierd' },
                javascriptreact = { 'prettierd' },
                typescriptreact = { 'prettierd' },
                json = { 'jq' },
                jsonc = { 'jq' },
                lock = { 'jq' },
                markdown = { 'prettierd' },
                lua = { 'stylua' },
                typst = { 'typstyle' },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })
    end,
}
