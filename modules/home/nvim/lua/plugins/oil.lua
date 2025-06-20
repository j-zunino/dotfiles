return {
    'stevearc/oil.nvim',
    dependencies = { 'echasnovski/mini.icons' },

    config = function()
        vim.keymap.set('n', '-', ':Oil<CR>', { desc = 'Open parent directory' })
        vim.keymap.set(
            'n',
            '<C-e>',
            ':Oil<CR>',
            { desc = 'Open parent directory' }
        )

        require('oil').setup({
            default_file_explorer = true,
            keymaps = {
                ['<C-h>'] = 'actions.parent',
                ['<C-l>'] = 'actions.select',
                ['<C-r>'] = 'actions.refresh',
            },

            win_options = {
                signcolumn = 'yes',
            },
            view_options = {
                show_hidden = true,
            },
            confirmation = {
                border = 'single',
            },
            progress = {
                border = 'single',
            },
            ssh = {
                border = 'single',
            },
            keymaps_help = {
                border = 'single',
            },
        })
    end,
}
