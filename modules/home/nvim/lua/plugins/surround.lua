return {
    'echasnovski/mini.surround',
    lazy = true,
    event = 'InsertEnter',
    config = function()
        require('mini.surround').setup()
    end,
}
