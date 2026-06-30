local M = {}

function M.map(spec)
    local keys = spec[1]
    local parts = {}
    if spec.super ~= false then table.insert(parts, "SUPER") end
    if spec.shift then table.insert(parts, "SHIFT") end
    if spec.alt then table.insert(parts, "ALT") end
    local prefix = #parts > 0 and table.concat(parts, " + ") .. " + " or ""
    local fn = spec.exec and hl.dsp.exec_cmd(spec.exec) or spec.action
    local opts = {}
    for k, v in pairs(spec) do
        if k ~= 1 and k ~= "super" and k ~= "shift" and k ~= "alt" and k ~= "exec" and k ~= "action" then
            opts[k] = v
        end
    end
    hl.bind(prefix .. keys, fn, next(opts) and opts or nil)
end

return M
