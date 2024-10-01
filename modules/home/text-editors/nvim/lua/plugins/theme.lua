return {
    "neanias/everforest-nvim",
    priority = 1000,
    config = function()
        require("everforest").setup({
            background = "medium",
            transparent_background_level = 0,
            italics = false,
            disable_italic_comments = false,
            sign_column_background = "none",
            ui_contrast = "low",
            dim_inactive_windows = true,
            diagnostic_text_highlight = true,
            diagnostic_virtual_text = "coloured",
            diagnostic_line_highlight = false,
            spell_foreground = true,
            show_eob = true,
            float_style = "bright",
            inlay_hints_background = "none",
        })

        vim.cmd.colorscheme("everforest")

        -- You can configure highlights by doing something like:
        vim.cmd.hi("Comment gui=none")
    end,
}
