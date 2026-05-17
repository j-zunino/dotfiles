local function getHostname()
    local f = io.popen('hostname')
    local hostname = f:read('*a') or ''
    f:close()
    hostname = string.gsub(hostname, '\n$', '')
    return hostname
end

local host = getHostname()

if host == 'desktop' then
    hl.config({
        cursor = {
            default_monitor = 'DP-1',
        },
    })

    hl.workspace_rule({
        workspace = '4',
        monitor = 'HDMI-A-1',
        default = true,
    })

    hl.workspace_rule({
        workspace = '1',
        monitor = 'DP-1',
        default = true,
    })
end
