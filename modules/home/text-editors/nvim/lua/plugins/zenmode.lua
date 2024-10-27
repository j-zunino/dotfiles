return {
    'folke/zen-mode.nvim',
    lazy = true,
    keys = '<leader>zm',
    config = function()
        local zenmode = require('zen-mode')

        vim.keymap.set(
            'n',
            '<leader>zm',
            '<cmd>ZenMode<CR>',
            { noremap = true, silent = true, desc = 'Enable Zen Mode' }
        )

        zenmode.setup({
            window = {
                backdrop = 0.95,
                width = 120,
                height = 1,
                options = {
                    -- signcolumn = "no", -- disable signcolumn
                    -- number = false, -- disable number column
                    -- relativenumber = false, -- disable relative numbers
                    -- cursorline = false, -- disable cursorline
                    -- cursorcolumn = false, -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                    laststatus = 0,
                },
                twilight = { enabled = true },
                gitsigns = { enabled = false },
                todo = { enabled = false },
            },
            on_open = function() end,
            on_close = function() end,
        })
    end,
}
