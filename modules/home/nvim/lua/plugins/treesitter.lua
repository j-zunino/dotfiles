return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
        local treesitter = require('nvim-treesitter.configs')
        treesitter.setup({
            highlight = {
                enable = true,
            },
            indent = { enable = true },

            auto_install = true,
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-space>',
                    node_incremental = '<C-space>',
                    node_decremental = '<BS>',
                    scope_incremental = false,
                },
            },
            ensure_installed = {
                'html',
                'css',
                'javascript',
                'typescript',
                'lua',
                'markdown',
                'diff',
                'nix',
            },
        })
    end,
}
