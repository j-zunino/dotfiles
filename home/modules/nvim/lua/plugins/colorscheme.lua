return {
    {
        'neanias/everforest-nvim',
        priority = 1000,
        lazy = false,
        config = function()
            require('everforest').setup({
                transparent_background_level = 1,
                disable_italic_comments = true,

                on_highlights = function(hl, palette)
                    local bg1 = palette.bg1
                    local gray1 = palette.grey1
                    local accent = palette.green
                    local fg = palette.fg

                    -- Nvim
                    hl.NormalFloat = { bg = 'NONE' }
                    hl.FloatBorder = { link = 'Comment' }
                    hl.FloatTitle = { link = 'Comment' }
                    hl.DiagnosticVirtualTextError =
                        { fg = palette.red, bg = palette.bg_red }
                    hl.DiagnosticVirtualTextHint =
                        { fg = palette.green, bg = palette.bg_green }
                    hl.DiagnosticVirtualTextInfo =
                        { fg = palette.blue, bg = palette.bg_blue }
                    hl.DiagnosticVirtualTextWarn =
                        { fg = palette.yellow, bg = palette.bg_yellow }

                    hl.Pmenu = { link = 'Normal' } -- Blink

                    hl.SnacksDashboardFile = { link = 'Fg' }
                    hl.SnacksDashboardSpecial = { link = 'Comment' }
                    hl.SnacksDashboardDir = { link = 'Comment' }
                    hl.SnacksDashboardFooter = { link = 'Comment' }
                end,
            })

            vim.cmd.colorscheme('everforest')
        end,
    },
    {
        'vague2k/vague.nvim',
        event = 'VimEnter',
        opts = {
            italic = false,
        },
    },
}
