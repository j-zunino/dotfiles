vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })

require('oil').setup({
    default_file_explorer = true,
    view_options = { show_hidden = true },

    keymaps = {
        ['<C-h>'] = 'actions.parent',
        ['<C-l>'] = 'actions.select',
        ['<C-r>'] = 'actions.refresh',
    },

    vim.keymap.set(
        'n',
        '<C-e>',
        ':Oil<CR>',
        { noremap = true, silent = true, desc = 'Open oil' }
    ),
})
