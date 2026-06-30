local M = {}

function M.bind(spec)
    local keys = spec[1]
    local fn = spec.exec or spec.action or spec[2]
    local opts = {}
    for k, v in pairs(spec) do
        if k ~= 1 and k ~= 2 and k ~= "exec" and k ~= "action" then
            opts[k] = v
        end
    end
    hl.bind(keys, fn, next(opts) and opts or nil)
end

return M
