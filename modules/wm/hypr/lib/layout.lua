local bind = require("lib.bind")
local hl_layout = hl.dsp.layout

local LAYOUTS = { "master", "scrolling" }

local M = {}

local function active()
    return hl.get_active_special_workspace() or hl.get_active_workspace()
end

local function next_layout(current)
    for i, layout_name in ipairs(LAYOUTS) do
        if layout_name == current then
            return LAYOUTS[i % #LAYOUTS + 1]
        end
    end
    return LAYOUTS[1]
end

function M.current()
    local workspace = active()
    return workspace and workspace.tiled_layout or nil
end

function M.toggle()
    local workspace = active()
    if not workspace then
        return
    end
    local selector = tostring(workspace.name)
    hl.workspace_rule({
        workspace = selector,
        layout = next_layout(workspace.tiled_layout),
    })
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
