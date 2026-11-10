local M = {}

---@param fg string "#rrggbb"
---@param bg string "#rrggbb"
---@param opacity number 0.0 - 1.0
---@return string
function M.blend(fg, bg, opacity)
    local function to_rgb(hex)
        hex = hex:gsub("#", "")
        return {
            tonumber(hex:sub(1, 2), 16),
            tonumber(hex:sub(3, 4), 16),
            tonumber(hex:sub(5, 6), 16),
        }
    end

    opacity = math.max(0, math.min(1, opacity))
    local f, b = to_rgb(fg), to_rgb(bg)
    local out = {}
    for i = 1, 3 do
        out[i] = math.floor(opacity * f[i] + (1 - opacity) * b[i] + 0.5)
    end
    return string.format("#%02x%02x%02x", out[1], out[2], out[3])
end

--- Returns a `set(groups, opts)` function bound to a palette.
--- opts: fg, bg, fg_opacity, bg_opacity, base (blend target, default base00),
---       plus any nvim_set_hl key (bold, italic, ...)
---@param palette table<string, string>
function M.make_set(palette)
    return function(groups, opts)
        local spec = vim.deepcopy(opts or {})

        local base = spec.base or palette.base00
        local fg_opacity, bg_opacity = spec.fg_opacity, spec.bg_opacity
        spec.base, spec.fg_opacity, spec.bg_opacity = nil, nil, nil

        if spec.fg and fg_opacity then
            spec.fg = M.blend(spec.fg, base, fg_opacity)
        end
        if spec.bg and bg_opacity then
            spec.bg = M.blend(spec.bg, base, bg_opacity)
        end

        for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, spec)
        end
    end
end

return M
