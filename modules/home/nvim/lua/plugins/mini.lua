return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.pairs').setup()
        require('mini.surround').setup()
        require('mini.ai').setup({ n_lines = 80 })
        require('plugins.mini.hipatterns')
        require('plugins.mini.icons')
        require('plugins.mini.statusline')
    end,
}
