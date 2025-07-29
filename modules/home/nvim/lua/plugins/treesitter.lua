return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup({
                indent = { enable = true },
                highlight = { enable = true },

                auto_install = true,
                ensure_installed = {
                    'nix',
                    'lua',
                    'css',
                    'html',
                    'markdown',
                    'javascript',
                    'typescript',
                },
            })
        end,
    },
    {
        'windwp/nvim-ts-autotag',
        event = { 'BufReadPost', 'BufNewFile' },
    },
}
