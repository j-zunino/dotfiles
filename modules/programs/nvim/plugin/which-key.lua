vim.pack.add({ 'https://github.com/folke/which-key.nvim' })

require('which-key').setup({
    preset = 'helix',
    delay = 200,
    notify = true,
    win = { border = 'single' },
    defaults = {},
})

require('which-key').add({
    {
        mode = { 'n' },
        {
            '<leader>c',
            group = 'Code',
            icon = { icon = ' ', color = 'red' },
        },
        {
            '<leader>r',
            group = 'Rename',
            icon = { icon = '' },
        },
        {
            '<leader>s',
            group = 'Pick',
            icon = { icon = '', color = 'purple' },
        },
        { '<leader>T', group = 'Toggle' },
    },
})
