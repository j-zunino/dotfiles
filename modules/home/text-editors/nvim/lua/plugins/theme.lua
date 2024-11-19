return {
    'neanias/everforest-nvim',
    priority = 1000,
    lazy = false,
    config = function()
        require('everforest').setup({
            transparent_background_level = 1,
            disable_italic_comments = true,
        })

        vim.cmd.colorscheme('everforest')
    end,
}
