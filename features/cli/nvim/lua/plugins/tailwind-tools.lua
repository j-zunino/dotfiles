return {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    keys = { '<leader>ws', '<leader>wc' },
    build = ':UpdateRemotePlugins',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },

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
            ---@diagnostic disable-next-line: missing-fields
            server = { override = false },
            document_color = { enabled = false },
            conceal = {
                enabled = false,
                symbol = '…',
                highlight = { fg = '' },
            },
        })
    end,
}
