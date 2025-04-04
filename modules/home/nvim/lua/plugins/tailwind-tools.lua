return {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    keys = '<leader>ts',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {},

    config = function()
        vim.keymap.set(
            'n',
            '<leader>ts',
            '<cmd>TailwindSort<CR>',
            { noremap = true, silent = true, desc = 'Sort tailwind' }
        )

        require('tailwind-tools').setup({
            server = {
                override = false,
            },
            document_color = {
                enabled = false,
            },
            conceal = {
                enabled = false,
            },
        })
    end,
}
