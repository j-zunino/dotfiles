return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.pairs').setup()
        require('mini.surround').setup()
        require('plugins.mini.hipatterns')
        require('plugins.mini.ai')
        require('plugins.mini.icons')
        require('plugins.mini.statusline')
        require('plugins.mini.indentscope')
    end,
}
