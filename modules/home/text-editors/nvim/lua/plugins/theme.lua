return {
    'neanias/everforest-nvim',
    priority = 1000,
    event = 'VeryLazy',
    config = function()
        require('everforest').setup({
            transparent_background_level = 1,
            disable_italic_comments = true,
            sign_column_background = 'none',
            diagnostic_text_highlight = true,
            diagnostic_line_highlight = true,
            float_style = 'bright',
        })

        vim.cmd.colorscheme('everforest')

        -- vim.cmd.hi('Comment gui=none')
    end,
}
