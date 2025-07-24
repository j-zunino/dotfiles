return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.pairs').setup()
        require('mini.surround').setup()
        require('mini.ai').setup({ n_lines = 80 })
        require('mini.hipatterns').setup({
            highlighters = {
                perf = {
                    pattern = '().%f[%w]PERF%f[%W].()',
                    group = 'MiniStatuslineModeOther',
                },
                fix = {
                    pattern = '().%f[%w]FIX%f[%W].()',
                    group = 'MiniHipatternsFixme',
                },
                fixme = {
                    pattern = '().%f[%w]FIXME%f[%W].()',
                    group = 'MiniHipatternsFixme',
                },
                hack = {
                    pattern = '().%f[%w]HACK%f[%W].()',
                    group = 'MiniHipatternsHack',
                },
                warning = {
                    pattern = '().%f[%w]WARNING%f[%W].()',
                    group = 'MiniHipatternsHack',
                },
                todo = {
                    pattern = '().%f[%w]TODO%f[%W].()',
                    group = 'MiniHipatternsNote',
                },
                note = {
                    pattern = '().%f[%w]NOTE%f[%W].()',
                    group = 'MiniHipatternsTodo',
                },
            },
        })
        require('plugins.mini.icons')
    end,
}
