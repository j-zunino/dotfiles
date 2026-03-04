vim.lsp.enable({
    'nixd',
    'lua_ls',
    'vtsls',
    'html',
    'cssls',
    'tailwindcss',
    'emmet_ls',
    'jsonls',
    'tinymist',
    'pyright',
    'prismals',
})

local diagnostic_icons = {
    [vim.diagnostic.severity.ERROR] = '■',
    [vim.diagnostic.severity.WARN] = '▲',
    [vim.diagnostic.severity.HINT] = '',
    [vim.diagnostic.severity.INFO] = '󰨐',
}

vim.diagnostic.config({
    float = { border = 'single' },
    signs = { text = diagnostic_icons },
    virtual_lines = false,
    virtual_text = {
        prefix = function(diagnostic)
            return diagnostic_icons[diagnostic.severity] or '■'
        end,
    },
})

local function restart_lsp(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    for _, client in ipairs(clients) do
        vim.lsp.stop_client(client.id)
    end

    vim.defer_fn(function()
        vim.cmd('edit')
    end, 100)
end

vim.api.nvim_create_user_command('LspRestart', function()
    restart_lsp()
end, {})
