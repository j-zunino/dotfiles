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

                    hl.DiagnosticVirtualTextError =
                        { fg = palette.red, bg = palette.bg_red }
                    hl.DiagnosticVirtualTextHint =
                        { fg = palette.green, bg = palette.bg_green }
                    hl.DiagnosticVirtualTextInfo =
                        { fg = palette.blue, bg = palette.bg_blue }
                    hl.DiagnosticVirtualTextWarn =
                        { fg = palette.yellow, bg = palette.bg_yellow }

                    hl.NormalFloat = { bg = 'NONE' }
                    hl.FloatBorder = { link = 'Comment' }
                    hl.FloatTitle = { link = 'Comment' }
                    hl.TreesitterContext = { bg = bg1 } -- Treesitter context

                    -- Snacks
                    hl.SnacksDashboardTitle = { fg = accent }
                    hl.SnacksDashboardIcon = { fg = accent }
                    hl.SnacksDashboardFile = { link = 'Fg' }
                    hl.SnacksDashboardSpecial = { link = 'Comment' }
                    hl.SnacksDashboardNormal = { link = 'Comment' }
                    hl.SnacksDashboardDir = { link = 'Comment' }
                    hl.SnacksDashboardFooter = { link = 'Comment' }
                    hl.SnacksDashboardNormal = { link = 'Normal' }
                    hl.SnacksDashboardNormalNC = { link = 'Normal' }

                    -- Blink
                    hl.Pmenu = { link = 'Normal' }

                    -- Avante
                    hl.AvanteSidebarWinSeparator = { link = 'FloatBorder' }
                end,
            })

            vim.cmd.colorscheme('everforest')
        end,
    },
    {
        'ellisonleao/gruvbox.nvim',
        lazy = true,
        config = function()
            require('gruvbox').setup({
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
            })
        end,
    },
    {
        'navarasu/onedark.nvim',
        lazy = true,
        config = function()
            require('onedark').setup({
                style = 'dark',
            })
        end,
    },
    {
        'vague2k/vague.nvim',
        lazy = true,
        config = function()
            require('vague').setup()
        end,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = true,
        config = function()
            require('rose-pine').setup({
                variant = 'main',
                dark_variant = 'main',

                styles = {
                    bold = true,
                    italic = false,
                },
            })
        end,
    },
    {
        'folke/tokyonight.nvim',
        lazy = true,
        opts = {
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
            },
        },
    },
}
