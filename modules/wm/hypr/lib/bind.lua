local prefix = 'SUPER + '
local mod_prefix = 'SUPER + SHIFT + '

local M = {}

function M.map(spec)
    local keys = spec[1]
    local p = spec.mod and mod_prefix or prefix
    local fn = spec.exec and hl.dsp.exec_cmd(spec.exec) or spec.action
    local opts = {}
    for k, v in pairs(spec) do
        if k ~= 1 and k ~= 'mod' and k ~= 'exec' and k ~= 'action' then
            opts[k] = v
        end
    end
    hl.bind(p .. keys, fn, next(opts) and opts or nil)
end

return M
