---@param p table<string, string> palette
---@param set fun(groups: string[], opts: table)
return function(p, set)
    -- TODO or already good: Regexp, Statement, Conditional, Repeat, Label, Exception,
    --       PreProc, Include, Define, SpecialComment, Debug, Underlined, Bold
    --       Italic, BoldItalic, Dimmed, Ignore, Error, Todo, Added, Removed

    -- FG
    set({
        "@constructor",
        "@tag.attribute",
        "@tag.delimiter",
        "Delimiter",
        "Tag",
    }, { fg = p.base05 })

    -- Light FG
    set({ "Constant" }, { fg = p.base07, bold = true })

    -- Red
    set({ "Keyword" }, { fg = p.base08 })

    -- Orange
    set({ "Operator" }, { fg = p.base09 })

    -- Yellow
    set({ "Character", "String" }, { fg = p.base0A })
    set(
        { "SpellBad", "SpellCap", "SpellLocal", "SpellRare" },
        { fg = p.base0A, underline = true }
    )

    -- Green
    set({ "@tag", "@tag.builtin", "Directory", "Function" }, { fg = p.base0B })

    -- Aqua
    set({ "@variable.member.nix", "Identifier" }, { fg = p.base0C })

    -- Blue
    set({ "Changed" }, { fg = p.base0D })

    -- Purple
    set({ "Boolean", "Float", "Number", "Special" }, { fg = p.base0E })
end
