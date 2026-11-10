---@param p table<string, string> palette
---@param set fun(groups: string[], opts: table)
return function(p, set)
    set({ "MiniCursorword" }, { bg = p.base01, bold = true })

    set({ "MiniIndentScopeSymbol" }, { fg = p.base03 })

    set({ "MiniPickMatchCurrent" }, { fg = p.base05, bg = p.base01 })
    set({ "MiniPickNormal" }, { fg = p.base03 })
    set({ "MiniPickPrompt", "MiniPickPromptCaret" }, { fg = p.base05 })
    set({
        "MiniPickPromptPrefix",
        "MiniPickMatchRanges",
        "MiniPickBorderText",
    }, { fg = p.base0B, bold = true })

    set({ "MiniTablineHidden" }, { fg = p.base03 })
end
