return {
    'nvzone/showkeys',
    cmd = 'ShowkeysToggle',
    keys = '<leader>tk',
    opts = {
        timeout = 3,
        maxkeys = 10,
    },

    config = function()
        vim.keymap.set(
            'n',
            '<leader>tk',
            '<cmd>ShowkeysToggle<CR>',
            { noremap = true, silent = true, desc = 'Toggle show keys' }
        )
    end,
}
