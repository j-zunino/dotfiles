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

            formatters_by_ft = {
                html = { 'prettierd', 'prettier' },
                css = { 'prettierd', 'prettier' },
                javascript = { 'prettierd', 'prettier' },
                typescript = { 'prettierd', 'prettier' },
                javascriptreact = { 'prettierd', 'prettier' },
                typescriptreact = { 'prettierd', 'prettier' },
                json = { 'prettierd', 'prettier' },
                markdown = { 'prettierd', 'prettier' },
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
