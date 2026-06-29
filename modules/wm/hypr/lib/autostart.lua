local cmds = {}

local M = {}

function M.add(cmd)
    table.insert(cmds, cmd)
end

function M.start()
    hl.exec_cmd(table.concat(cmds, ' & '))
end

return M
