local hipatterns = require('mini.hipatterns')

local function to_hex(r, g, b, alpha)
    r, g, b = tonumber(r), tonumber(g), tonumber(b)
    if alpha and alpha >= 0 and alpha <= 1 then
        r, g, b = r * alpha, g * alpha, b * alpha
    end
    return string.format('#%02x%02x%02x', r, g, b)
end

local function hsl_to_rgb(h, s, l)
    h, s, l = h % 360, s / 100, l / 100
    local function f(n)
        local k = (n + h / 30) % 12
        local a = s * math.min(l, 1 - l)
        return math.floor(
            (l - a * math.max(-1, math.min(k - 3, 9 - k, 1))) * 255
        )
    end
    return f(0), f(8), f(4)
end

local function highlight(hex)
    if not hex:match('^#%x%x%x%x%x%x$') then
        return false -- evita errores por hex inválido
    end
    return hipatterns.compute_hex_color_group(hex, 'bg')
end

local function hex_color(_, match)
    local hex = match:sub(2)
    local len = #hex

    if len == 3 or len == 4 then
        local r, g, b = hex:sub(1, 1), hex:sub(2, 2), hex:sub(3, 3)
        local a = len == 4
            and tonumber(hex:sub(4, 4) .. hex:sub(4, 4), 16) / 255
        return highlight(
            to_hex(
                tonumber(r .. r, 16),
                tonumber(g .. g, 16),
                tonumber(b .. b, 16),
                a
            )
        )
    elseif len == 6 or len == 8 then
        local r, g, b = hex:sub(1, 2), hex:sub(3, 4), hex:sub(5, 6)
        local a = len == 8 and tonumber(hex:sub(7, 8), 16) / 255
        return highlight(
            to_hex(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16), a)
        )
    end

    return false
end

local function rgb_color(_, match)
    local r, g, b, a =
        match:match('rgba?%((%d+), ?(%d+), ?(%d+),? ?([%d%.]*)%)')
    r, g, b = tonumber(r), tonumber(g), tonumber(b)
    a = tonumber(a)
    if not r or not g or not b then
        return false
    end
    if not a or a < 0 or a > 1 then
        a = 1
    end
    return highlight(to_hex(r, g, b, a))
end

local function hsl_color(_, match)
    local h, s, l, a =
        match:match('hsla?%((%d+), ?(%d+)%%, ?(%d+)%%,? ?([%d%.]*)%)')
    h, s, l = tonumber(h), tonumber(s), tonumber(l)
    a = tonumber(a)
    if not h or not s or not l then
        return false
    end
    if not a or a < 0 or a > 1 then
        a = 1
    end
    local r, g, b = hsl_to_rgb(h, s, l)
    return highlight(to_hex(r, g, b, a))
end

local M = {}

function M.extend()
    return {
        hex_color = {
            pattern = '#%x%x%x%x?%x?%x?%x?%x?%f[%X]',
            group = hex_color,
        },
        rgb_color = {
            pattern = 'rgba?%(%d+, ?%d+, ?%d+,? ?%d*%.?%d*%)',
            group = rgb_color,
        },
        hsl_color = {
            pattern = 'hsla?%(%d+, ?%d+%%, ?%d+%%,? ?%d*%.?%d*%)',
            group = hsl_color,
        },
    }
end

return M
