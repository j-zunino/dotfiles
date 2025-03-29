return {
    'williamboman/mason.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    enabled = false,
    -- event = 'LspAttach',
    cmd = 'Mason',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local mason_tool_installer = require('mason-tool-installer')

        mason.setup({
            ui = {
                icons = {
                    package_installed = ' ',
                    package_pending = ' ',
                    package_uninstalled = ' ',
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                'html',
                'cssls',
                'emmet_ls',
                -- 'ts_ls',
                'tailwindcss',
                'lua_ls',
                'nil_ls',
                'vtsls',
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                'prettier',
                'stylua',
                'eslint_d',
            },
        })
    end,
}
