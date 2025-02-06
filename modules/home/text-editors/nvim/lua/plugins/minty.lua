return {
    { 'nvzone/volt', lazy = true },

    {
        'nvzone/minty',
        cmd = { 'Shades', 'Huefy' },
        keys = { '<leader>cp', '<leader>cs' },
        config = function()
            local opts = { noremap = true, silent = true }

            opts.desc = 'Color picker'
            vim.keymap.set('n', '<leader>cp', '<cmd>Huefy<CR>', opts)

            opts.desc = 'Color shades'
            vim.keymap.set('n', '<leader>cs', '<cmd>Shades<CR>', opts)

            require('minty').setup({
                huefy = {
                    border = true,
                },
                shades = {
                    border = true,
                },
            })
        end,
    },
}
