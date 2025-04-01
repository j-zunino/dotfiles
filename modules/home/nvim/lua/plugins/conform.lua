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
                json = { 'prettierd' },
                markdown = { 'prettierd' },
                lua = { 'stylua' },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })
    end,
}
