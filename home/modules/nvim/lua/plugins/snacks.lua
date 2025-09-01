return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    config = function()
        local snacks = require('snacks')
        local picker = require('plugins.snacks.picker')

        require('plugins.snacks.bufdelete')

        vim.keymap.set(
            'n',
            '<leader>n',
            ':lua Snacks.notifier.show_history()<CR>',
            {
                noremap = true,
                silent = true,
                desc = 'Show notifications history',
            }
        )

        snacks.setup({
            bufdelete = { enabled = true },
            notify = { enabled = true },
            notifier = { enabled = true },
            input = { enabled = true },
            rename = { enabled = true },

            styles = {
                input = { border = 'single' },
                notification = { border = 'single' },
                notification_history = { border = 'single', minimal = true },
            },

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

            picker = {
                enabled = true,
                hidden = true,
                prompt = '> ',
                layout = picker.picker_layout,
                sources = {
                    select = {
                        config = function(opts)
                            opts.layout.layout.height = 10
                        end,
                    },
                },
            },
        })
    end,
}
