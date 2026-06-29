local function getHostname()
    local f = io.popen('hostname')
    local hostname = f:read('*a') or ''
    f:close()
    hostname = string.gsub(hostname, '\n$', '')
    return hostname
end

local host = getHostname()

if host == 'desktop' then
    hl.env('LIBVA_DRIVER_NAME', 'nvidia')
    hl.env('__GLX_VENDOR_LIBRARY_NAME', 'nvidia')

    hl.config({
        general = {
            allow_tearing = true,
        },
        cursor = {
            default_monitor = 'DP-1',
        },

        scrolling = {
            explicit_column_widths = '0.3, 0.5, 0.9, 1',
        },
    })

    hl.window_rule({
        match = { class = 'steam_app_2357570' },
        immediate = true,
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
elseif host == 'latitude' then
    hl.config({
        input = {
            kb_options = 'caps:swapescape',
        },

        scrolling = {
            column_width = 0.9,
        },

        hl.gesture({
            fingers = 3,
            direction = 'horizontal',
            action = 'workspace',
            scale = 4,
        }),

        hl.gesture({
            fingers = 2,
            direction = 'pinch',
            mods = 'SUPER',
            action = 'cursorZoom',
            zoom_level = 1,
            mode = 'live',
        }),
    })
end
