return {
    'nvzone/showkeys',
    cmd = 'ShowkeysToggle',
    keys = '<leader>tk',

    config = function()
        require('showkeys').setup({
            timeout = 1,
            maxkeys = 8,
            show_count = true,
        })

        vim.keymap.set(
            'n',
            '<leader>tk',
            '<cmd>ShowkeysToggle<CR>',
            { noremap = true, silent = true, desc = 'Toggle show keys' }
        )
    end,
}
