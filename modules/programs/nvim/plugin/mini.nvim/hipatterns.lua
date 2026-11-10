local hp = {}
for word, level in pairs({
    FIX = "Error",
    FIXME = "Error",
    HACK = "Warn",
    WARN = "Warn",
    WARNING = "Warn",
    TODO = "Info",
    NOTE = "Hint",
}) do
    hp[word:lower()] = {
        pattern = "%f[%w]()" .. word .. "()%f[%W]",
        group = "DiagnosticVirtualText" .. level,
    }
end

require("mini.hipatterns").setup({ highlighters = hp })
