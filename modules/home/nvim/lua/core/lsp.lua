vim.lsp.enable({
    'nixd',
    'lua_ls',
    'vtsls',
    'html',
    'cssls',
    'tailwindcss',
    'emmet_ls',
    'tinymist',
})

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
