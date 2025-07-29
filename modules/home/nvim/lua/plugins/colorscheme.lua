return {
    {
        'neanias/everforest-nvim',
        priority = 1000,
        lazy = false,
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('everforest').setup({
                transparent_background_level = 1,
                disable_italic_comments = true,

                on_highlights = function(hl, palette)
                    local bg1 = palette.bg1
                    local accent = palette.green

                    -- Nvim
                    hl.NormalFloat = { bg = 'NONE' }
                    hl.FloatBorder = { link = 'Comment' }
                    hl.FloatTitle = { link = 'Comment' }
                    hl.SpellBad = { link = 'DiagnosticUnderlineWarn' }
                    hl.SpellCap = { link = 'DiagnosticUnderlineWarn' }
                    hl.SpellLocal = { link = 'DiagnosticUnderlineWarn' }
                    hl.SpellRare = { link = 'DiagnosticUnderlineWarn' }
                    hl.DiagnosticVirtualTextError =
                        { fg = palette.red, bg = palette.bg_red }
                    hl.DiagnosticVirtualTextHint =
                        { fg = palette.green, bg = palette.bg_green }
                    hl.DiagnosticVirtualTextInfo =
                        { fg = palette.blue, bg = palette.bg_blue }
                    hl.DiagnosticVirtualTextWarn =
                        { fg = palette.yellow, bg = palette.bg_yellow }

                    hl.Pmenu = { link = 'Normal' } -- Blink
                    hl.TreesitterContext = { bg = bg1 }

                    hl.SnacksDashboardTitle = { fg = accent }
                    hl.SnacksDashboardIcon = { fg = accent }
                    hl.SnacksDashboardFile = { link = 'Fg' }
                    hl.SnacksDashboardSpecial = { link = 'Comment' }
                    hl.SnacksDashboardNormal = { link = 'Comment' }
                    hl.SnacksDashboardDir = { link = 'Comment' }
                    hl.SnacksDashboardFooter = { link = 'Comment' }
                    hl.SnacksDashboardNormal = { link = 'Normal' }
                    hl.SnacksDashboardNormalNC = { link = 'Normal' }
                    hl.SnacksPickerListCursorLine = { link = 'CursorLine' }
                end,
            })

            vim.cmd.colorscheme('everforest')
        end,
    },
    {
        'vague2k/vague.nvim',
        lazy = true,
        config = function()
            require('vague').setup({ italic = true })
        end,
    },
}
