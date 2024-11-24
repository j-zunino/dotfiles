return {
    'neanias/everforest-nvim',
    priority = 1000,
    lazy = false,
    config = function()
        require('everforest').setup({
            transparent_background_level = 1,
            -- asdadsa
            disable_italic_comments = true,

            on_highlights = function(hl, palette)
                hl.DiagnosticVirtualTextError =
                    { fg = palette.red, bg = palette.bg_red }
                hl.DiagnosticVirtualTextHint =
                    { fg = palette.green, bg = palette.bg_green }
                hl.DiagnosticVirtualTextInfo =
                    { fg = palette.blue, bg = palette.bg_blue }
                hl.DiagnosticVirtualTextWarn =
                    { fg = palette.yellow, bg = palette.bg_yellow }
            end,
        })

        vim.cmd.colorscheme('everforest')
    end,
}
