vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
    require('conform').format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    })
end, { desc = 'Format buffer' })

require('conform').setup({
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    },

    formatters = {
        shfmt = { args = { '-i', '4', '-ci', '-s', '-' } },

        clang_format = {
            prepend_args = {
                '-style={BasedOnStyle: Google, IndentWidth: 4}',
                '-fallback-style=Google',
            },
        },
    },

    formatters_by_ft = {
        c = { 'clang_format' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        json = { 'jq' },
        jsonc = { 'jq' },
        lock = { 'jq' },
        lua = { 'stylua' },
        markdown = { 'prettierd' },
        sh = { 'shfmt' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        typst = { 'typstyle' },
        zsh = { 'shfmt' },
    },
})
