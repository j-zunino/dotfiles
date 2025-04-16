return {
    'folke/which-key.nvim',
    keys = '<leader>',
    opts_extend = { 'spec' },
    opts = {
        preset = 'helix',
        defaults = {},
        spec = {
            {
                mode = { 'n', 'v' },
                {
                    '<leader>a',
                    group = 'Avante',
                    icon = { icon = '', color = 'yellow' },
                },
                {
                    '<leader>c',
                    group = 'Code',
                    icon = { icon = ' ', color = 'red' },
                },
                {
                    '<leader>d',
                    group = 'Document',
                    icon = { icon = '󰈙', color = 'cyan' },
                },
                {
                    '<leader>r',
                    group = 'Rename',
                    icon = { icon = '' },
                },
                {
                    '<leader>s',
                    group = 'Snacks picker',
                    icon = { icon = '󱥰', color = 'purple' },
                },
                {
                    '<leader>w',
                    group = 'Workspace',
                    icon = { icon = '', color = 'blue' },
                },
                {
                    '<leader>t',
                    group = 'Typescript vtsls',
                    icon = { icon = '', color = 'cyan' },
                },
                {
                    '<leader>z',
                    group = 'Zen-mode',
                    icon = { icon = '' },
                },
                {
                    '<leader>g',
                    group = 'Git',
                    icon = { icon = '', color = 'orange' },
                },
                {
                    '<leader>gh',
                    group = 'Hunks',
                    icon = { icon = '', color = 'orange' },
                },
                {
                    '<leader>l',
                    group = 'Lazygit',
                    icon = { icon = '', color = 'orange' },
                },
                {
                    '<leader>lg',
                    group = 'Lazygit',
                    icon = { icon = '', color = 'orange' },
                },
                {
                    '<leader>b',
                    group = 'Buffers',
                    icon = { icon = '', color = 'red' },
                },
            },
        },

        win = {
            border = 'single',
        },
    },
}
