return {
    'folke/which-key.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = '<leader>',
    opts = {
        spec = {
            { '<leader>a', group = 'Avante ', mode = { 'n' } },
            { '<leader>c', group = 'Code ', mode = { 'n', 'x' } },
            { '<leader>d', group = 'Document 󰈙', mode = { 'n' } },
            { '<leader>r', group = 'Rename ', mode = { 'n' } },
            { '<leader>s', group = 'Picker ', mode = { 'n' } },
            { '<leader>w', group = 'Workspace ', mode = { 'n' } },
            { '<leader>t', group = 'Vtsls ', mode = { 'n' } },
            { '<leader>l', group = 'LazyGit ', mode = { 'n' } },
            { '<leader>z', group = 'ZenMode ', mode = { 'n' } },
            { '<leader>h', group = 'Git  Hunk', mode = { 'n', 'v' } },
            { '<leader>b', group = 'Buffers ', mode = { 'n' } },
        },

        win = {
            border = 'single',
        },
    },
}
