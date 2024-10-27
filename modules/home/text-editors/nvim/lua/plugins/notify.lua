return {
    'rcarriga/nvim-notify',
    -- lazy = true,
    enabled = false,
    config = function()
        local notify = require('notify')

        notify.setup({
            background_colour = 'NotifyBackground',
            fps = 30,
            icons = {
                DEBUG = '',
                ERROR = '',
                INFO = '',
                TRACE = '✎',
                WARN = '',
            },
            level = 2,
            minimum_width = 30,
            -- max_widht = 50,
            render = 'default',
            stages = 'fade',
            timeout = 5000,
            top_down = true,
        })
    end,
}
