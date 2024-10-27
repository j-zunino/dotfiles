return {
    'echasnovski/mini.ai',
    lazy = true,
    event = 'InsertEnter',
    config = function()
        require('mini.ai').setup({ n_lines = 500 })
    end,
}
