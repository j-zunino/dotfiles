local hl_layout = hl.dsp.layout

local M = {}

function M.current()
    return hl.get_active_workspace().tiled_layout
end

function M.dispatch(actions)
    local cur = M.current()
    local action = actions[cur] or actions.master
    if action then
        if type(action) == "string" then
            hl.dispatch(hl_layout(action))
        elseif type(action) == "function" then
            action()
        else
            hl.dispatch(action)
        end
    end
end

function M.bind(spec)
    local keys = spec[1]
    local prefix = spec.mod and "SUPER + SHIFT + " or "SUPER + "
    local opts = {}
    for k, v in pairs(spec) do
        if k ~= 1 and k ~= "mod" and k ~= "master" and k ~= "scrolling" then
            opts[k] = v
        end
    end
    hl.bind(prefix .. keys, function()
        M.dispatch(spec)
    end, next(opts) and opts or nil)
end

return M
