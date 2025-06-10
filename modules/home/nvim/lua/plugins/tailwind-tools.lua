---@diagnostic disable: missing-fields
return {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    keys = { '<leader>ws', '<leader>wc' },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {},

    config = function()
        vim.keymap.set(
            'n',
            '<leader>ws',
            ':TailwindSort<CR>',
            { noremap = true, silent = true, desc = 'Sort' }
        )
        vim.keymap.set(
            'n',
            '<leader>wc',
            ':TailwindConcealToggle<CR>',
            { noremap = true, silent = true, desc = 'Conceal' }
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
                symbol = '…',
                highlight = {
                    fg = '',
                },
            },
        })
    end,
}
