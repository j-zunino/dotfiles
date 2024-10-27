return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = {},
    config = function()
        local alpha = require('alpha')
        local theme = require('plugins.alpha-utils.theme')

        alpha.setup(theme.config)
    end,
}
