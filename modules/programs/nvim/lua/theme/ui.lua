---@param p table<string, string> palette
---@param set fun(groups: string[], opts: table)
return function(p, set)
    -- UI
    set({ "NormalFloat" }, { fg = p.base05 })
    set({ "StatusLine", "StatusLineNC" }, { fg = p.base03, bg = p.base01 })
    set({
        "SignColumn",
        "LineNrAbove",
        "LineNrBelow",
        "FloatBorder",
    }, { fg = p.base03 })
    set({ "TablineFill" }, { bg = nil })

    -- Completion
    set({ "Pmenu" }, { fg = p.base03 })
    set({ "BlinkCmpLabelMatch" }, { fg = p.base0B, bold = true })
    set(
        { "BlinkCmpMenuSelection" },
        { fg = p.base05, bg = p.base01, bold = true }
    )

    --Search
    set({ "Search" }, { fg = p.base00, bg = p.base0B, bold = true })
    set({
        "IncSearch",
        "CurSearch",
    }, { fg = p.base00, bg = p.base08, bold = true })

    -- Diagnostics
    set({ "DiagnosticSignError" }, { fg = p.base08 })
    set({ "DiagnosticVirtualTextError" }, {
        fg = p.base08,
        bg = p.base08,
        bg_opacity = 0.12,
    })
    set(
        { "DiagnosticWarn", "DiagnosticFloatingWarn", "DiagnosticSignWarn" },
        { fg = p.base0A }
    )
    set({ "DiagnosticVirtualTextWarn" }, {
        fg = p.base0A,
        bg = p.base0A,
        bg_opacity = 0.12,
    })
    set({ "DiagnosticSignOk" }, { fg = p.base0B })
    set({ "DiagnosticVirtualTextOk" }, {
        fg = p.base0B,
        bg = p.base0B,
        bg_opacity = 0.12,
    })
    set({ "DiagnosticSignInfo" }, { fg = p.base0C })
    set({ "DiagnosticVirtualTextInfo" }, {
        fg = p.base0C,
        bg = p.base0C,
        bg_opacity = 0.12,
    })
    set({ "MiniDiffSignChange", "DiagnosticSignHint" }, { fg = p.base0D })
    set({ "DiagnosticVirtualTextHint" }, {
        fg = p.base0D,
        bg = p.base0D,
        bg_opacity = 0.12,
    })
end
