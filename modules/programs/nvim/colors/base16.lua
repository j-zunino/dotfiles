vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- Reload
for name in pairs(package.loaded) do
    if name:match("^theme") then
        package.loaded[name] = nil
    end
end

---@type table<string, string>
local palette =
    assert(MiniBase16.config.palette, "mini.base16: palette is not configured")

require("mini.base16").setup({ palette = palette })

local set = require("theme.utils").make_set(palette)
require("theme.syntax")(palette, set)
require("theme.ui")(palette, set)
require("theme.mini")(palette, set)

vim.g.colors_name = "base16"
