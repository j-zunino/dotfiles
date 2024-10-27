return {
    'echasnovski/mini.pairs',
    lazy = true,
    event = 'InsertEnter',
    config = function()
        require('mini.pairs').setup({
            modes = { insert = true, command = true, terminal = false },
        })
    end,
}
