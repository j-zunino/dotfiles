return {
    { 'nvzone/volt', lazy = true },

    {
        'nvzone/minty',
        cmd = { 'Shades', 'Huefy' },
        keys = { '<leader>Cp', '<leader>Cs' },
        config = function()
            local opts = { noremap = true, silent = true }

            opts.desc = 'Picker'
            vim.keymap.set('n', '<leader>Cp', '<cmd>Huefy<CR>', opts)

            opts.desc = 'Shades'
            vim.keymap.set('n', '<leader>Cs', '<cmd>Shades<CR>', opts)

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
