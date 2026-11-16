local function getHostname()
    local f = io.popen("hostname")
    local hostname = f:read("*a") or ""
    f:close()
    return string.gsub(hostname, "\n$", "")
end

local name = getHostname()

local M = {}

function M.when(hostname, fn)
    if name == hostname then
        fn()
    end
end

return M
