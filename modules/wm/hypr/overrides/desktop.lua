local host = require("lib.host")

host.when("desktop", function()
    hl.env("LIBVA_DRIVER_NAME", "nvidia")
    hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

    hl.config({
        general = {
            allow_tearing = true,
        },
        cursor = {
            default_monitor = "DP-1",
        },
    })

    hl.window_rule({
        match = { class = "steam_app_2357570" },
        immediate = true,
    })

    hl.workspace_rule({
        workspace = "4",
        monitor = "HDMI-A-1",
        default = true,
    })

    hl.workspace_rule({
        workspace = "1",
        monitor = "DP-1",
        default = true,
    })
end)
