---@diagnostic disable: missing-fields
return {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    keys = { '<leader>tws', '<leader>twc' },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {},

    config = function()
        vim.keymap.set(
            'n',
            '<leader>tws',
            ':TailwindSort<CR>',
            { noremap = true, silent = true, desc = 'Tailwind sort' }
        )
        vim.keymap.set(
            'n',
            '<leader>twc',
            ':TailwindConcealToggle<CR>',
            { noremap = true, silent = true, desc = 'Tailwind conceal' }
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
