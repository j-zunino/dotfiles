return {
    'nvchad/nvim-colorizer.lua',
    lazy = true,
    -- enable = false,
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        require('colorizer').setup({
            user_default_options = {
                tailwind = true,
            },
        })
    end,
}
