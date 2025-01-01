return {
    'echasnovski/mini.indentscope',
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        require('mini.indentscope').setup({
            draw = {
                delay = 0,
                animation = require('mini.indentscope').gen_animation.none(),
            },
            symbol = '│',
        })
    end,
}
