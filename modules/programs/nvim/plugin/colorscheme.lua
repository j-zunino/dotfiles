vim.pack.add({
    'https://github.com/neanias/everforest-nvim',
    'https://github.com/vague2k/vague.nvim',
})

require('everforest').setup({
    transparent_background_level = 1,
    disable_italic_comments = true,

    on_highlights = function(hl, palette)
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
    end,
})

require('vague').setup({ italic = false })

vim.cmd.colorscheme('everforest')
