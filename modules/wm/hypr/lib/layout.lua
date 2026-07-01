local bind = require("lib.bind")
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
    local map_spec = {
        [1] = spec[1],
        action = function()
            M.dispatch(spec)
        end,
        shift = spec.shift,
    }
    for k, v in pairs(spec) do
        if k ~= 1 and k ~= "shift" and k ~= "master" and k ~= "scrolling" then
            map_spec[k] = v
        end
    end
    bind.map(map_spec)
end

return M
