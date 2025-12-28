return {
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = true,
        keymaps = {
            ['<C-h>'] = 'actions.parent',
            ['<C-l>'] = 'actions.select',
            ['<C-r>'] = 'actions.refresh',
        },

        win_options = { signcolumn = 'yes' },
        view_options = { show_hidden = true },
        confirmation = { border = 'single' },
    },

    vim.keymap.set(
        'n',
        '<C-e>',
        ':Oil<CR>',
        { noremap = true, silent = true, desc = 'Open oil' }
    ),
}
