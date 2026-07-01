local cmds = {}

local M = {}

function M.add(cmd)
    table.insert(cmds, cmd)
end

function M.start()
    for _, cmd in ipairs(cmds) do
        hl.exec_cmd(cmd)
    end
end

return M
