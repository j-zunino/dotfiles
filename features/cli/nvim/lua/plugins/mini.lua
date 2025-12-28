return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        require('mini.align').setup()
        require('mini.extra').setup()
        require('mini.pairs').setup()
        require('mini.surround').setup()
        require('mini.splitjoin').setup()

        require('plugins.mini.ai')
        require('plugins.mini.bufremove')
        require('plugins.mini.diff')
        require('plugins.mini.hipatterns')
        require('plugins.mini.icons')
        require('plugins.mini.indentscope')
        require('plugins.mini.notify')
        require('plugins.mini.pick')
        -- require('plugins.mini.statusline')
    end,
}
