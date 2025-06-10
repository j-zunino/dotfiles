return {
    'nvzone/showkeys',
    cmd = 'ShowkeysToggle',
    keys = '<leader>Tk',

    config = function()
        require('showkeys').setup({
            timeout = 1,
            maxkeys = 8,
            show_count = true,
        })

        vim.keymap.set(
            'n',
            '<leader>Tk',
            '<cmd>ShowkeysToggle<CR>',
            { noremap = true, silent = true, desc = 'Show keys' }
        )
    end,
}
