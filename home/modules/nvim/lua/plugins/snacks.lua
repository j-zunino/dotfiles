return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    config = function()
        local snacks = require('snacks')

        snacks.setup({
            rename = { enabled = true },


            statuscolumn = {
                enabled = true,
                left = { 'sign' },
                right = { 'fold', 'git' },
            },

            dashboard = {
                enabled = true,
                sections = {
                    {
                        section = 'recent_files',
                        title = '',
                        padding = 1,
                        indent = 3,
                    },
                    { section = 'startup', icon = '󰒲 ' },
                },
            },
        })
    end,
}
