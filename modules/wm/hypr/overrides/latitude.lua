local host = require("lib.host")

host.when("latitude", function()
    hl.config({
        input = {
            kb_options = "caps:swapescape",
        },
        scrolling = {
            column_width = 0.9,
        },
    })

    hl.gesture({
        fingers = 3,
        direction = "horizontal",
        action = "workspace",
        scale = 4,
    })

    hl.gesture({
        fingers = 2,
        direction = "pinch",
        mods = "SUPER",
        action = "cursorZoom",
        zoom_level = 1,
        mode = "live",
    })
end)
