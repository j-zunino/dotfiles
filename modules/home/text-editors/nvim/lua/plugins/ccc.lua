return {
    'uga-rosa/ccc.nvim',
    opts = {},
    event = { 'BufReadPost', 'BufNewFile' },
    enabled = true,
    config = function()
        local ccc = require('ccc')
        local mapping = ccc.mapping

        vim.keymap.set(
            'n',
            '<leader>cp',
            '<cmd>CccPick<CR>',
            { desc = 'Color picker' }
        )
        vim.keymap.set(
            'n',
            '<leader>cc',
            '<cmd>CccConvert<CR>',
            { desc = 'Color convert' }
        )
        vim.keymap.set(
            'n',
            '<leader>ch',
            '<cmd>CccHighlightToggle<CR>',
            { desc = 'Toggle color highlight' }
        )

        ccc.setup({
            bar_len = 50,
            alpha_show = 'hide',
            point_char = '■',
            win_opts = {
                relative = 'cursor',
                row = 1,
                col = 1,
                style = 'minimal',
                border = 'single',
            },
            highlighter = {
                auto_enable = true,
                lsp = true,
            },
            mappings = {
                q = mapping.quit,

                t = mapping.toggle_alpha,

                h = mapping.decrease,
                H = mapping.decrease5,
                l = mapping.increase,
                L = mapping.increase5,

                W = mapping.set100,
                S = mapping.set0,
            },
        })
    end,
}
