local bind = require("lib.bind")
local layout = require("lib.layout")
local media = require("lib.media")
local window = hl.dsp.window

------------------------------------------------------------------------------
-- APPS
------------------------------------------------------------------------------
bind.map({ "Q", exec = "foot" })
bind.map({ "F", exec = "zen" })
bind.map({ "E", exec = "thunar" })

------------------------------------------------------------------------------
-- MENU
------------------------------------------------------------------------------
bind.map({
    "P",
    action = function()
        hl.dispatch(hl.dsp.global("quickshell:launcher-toggle"))
        hl.dispatch(hl.dsp.submap("launcher"))
    end,
})
bind.map({
    "Q",
    action = function()
        hl.dispatch(hl.dsp.global("quickshell:power-toggle"))
        hl.dispatch(hl.dsp.submap("launcher"))
    end,
    shift = true,
})

hl.define_submap("launcher", function()
    bind.map({
        "P",
        action = function()
            hl.dispatch(hl.dsp.global("quickshell:launcher-toggle"))
            hl.dispatch(hl.dsp.submap("reset"))
        end,
    })
    bind.map({
        "Q",
        action = function()
            hl.dispatch(hl.dsp.global("quickshell:power-toggle"))
            hl.dispatch(hl.dsp.submap("reset"))
        end,
        shift = true,
    })

    bind.map({
        "J",
        action = hl.dsp.global("quickshell:launcher-next"),
        ctrl = true,
        super = false,
        repeating = true,
    })
    bind.map({
        "K",
        action = hl.dsp.global("quickshell:launcher-prev"),
        ctrl = true,
        super = false,
        repeating = true,
    })

    bind.map({
        "ESCAPE",
        action = hl.dsp.submap("reset"),
        super = false,
        non_consuming = true,
    })
    bind.map({
        "RETURN",
        action = (hl.dsp.submap("reset")),
        super = false,
        non_consuming = true,
    })
end)

------------------------------------------------------------------------------
-- WINDOWS
------------------------------------------------------------------------------
bind.map({ "C", action = window.close(), shift = true })

layout.bind({ "J", master = "cyclenext", scrolling = "focus r" })
layout.bind({ "K", master = "cycleprev", scrolling = "focus l" })

layout.bind({ "J", master = "swapnext", scrolling = "swapcol r", shift = true })
layout.bind({ "K", master = "swapprev", scrolling = "swapcol l", shift = true })

layout.bind({
    "h",
    master = window.resize({ x = -20, y = 0, relative = true }),
    scrolling = "colresize -0.1",
    repeating = true,
})
layout.bind({
    "l",
    master = window.resize({ x = 20, y = 0, relative = true }),
    scrolling = "colresize +0.1",
    repeating = true,
})

layout.bind({ "BACKSPACE", master = "swapwithmaster", shift = true })

bind.map({
    "M",
    action = window.fullscreen({ mode = "fullscreen", action = "toggle" }),
})
bind.map({
    "SPACE",
    action = window.float({ action = "toggle" }),
    shift = true,
})

bind.map({ "mouse:272", action = window.drag(), mouse = true })
bind.map({ "mouse:273", action = window.resize(), mouse = true })

------------------------------------------------------------------------------
-- WORKSPACE
------------------------------------------------------------------------------
bind.map({
    "SUPER_L",
    action = hl.dsp.global("quickshell:workspace-show"),
    super = false,
    transparent = true,
})

bind.map({
    "SUPER_L",
    action = hl.dsp.global("quickshell:workspace-show"),
    release = true,
    transparent = true,
})

for i = 1, 10 do
    local key = tostring(i % 10)
    bind.map({
        key,
        action = hl.dsp.focus({ workspace = i }),
        submap_universal = true,
    })
    bind.map({
        key,
        action = window.move({ workspace = i, follow = false }),
        shift = true,
        submap_universal = true,
    })
end

local layouts = {}
bind.map({
    "N",
    action = function()
        local ws = tostring(hl.get_active_workspace().id)
        local current = layouts[ws] or "master"
        layouts[ws] = current == "master" and "scrolling" or "master"
        hl.workspace_rule({ workspace = ws, layout = layouts[ws] })
    end,
})

------------------------------------------------------------------------------
-- AUDIO & BRIGHTNESS
------------------------------------------------------------------------------
bind.map({
    "XF86MonBrightnessUp",
    action = media.brightness.up,
    repeating = true,
    super = false,
    submap_universal = true,
})
bind.map({
    "XF86MonBrightnessDown",
    action = media.brightness.down,
    repeating = true,
    super = false,
    submap_universal = true,
})
bind.map({
    "XF86AudioRaiseVolume",
    action = media.volume.up,
    repeating = true,
    super = false,
    submap_universal = true,
})
bind.map({
    "XF86AudioLowerVolume",
    action = media.volume.down,
    repeating = true,
    super = false,
    submap_universal = true,
})
bind.map({
    "XF86AudioMute",
    action = media.volume.toggle,
    super = false,
    submap_universal = true,
})
bind.map({
    "XF86AudioNext",
    action = media.play.next,
    super = false,
    submap_universal = true,
})
bind.map({
    "XF86AudioPlay",
    action = media.play.play_pause,
    super = false,
    submap_universal = true,
})
bind.map({
    "XF86AudioPrev",
    action = media.play.previous,
    super = false,
    submap_universal = true,
})

------------------------------------------------------------------------------
-- MISC
------------------------------------------------------------------------------
bind.map({ "B", exec = "pkill -SIGUSR1 waybar" })
bind.map({ "A", exec = "handy --toggle-transcription" })
bind.map({ "C", exec = "hyprpicker -a", submap_universal = true })
bind.map({
    "S",
    exec = "hyprshot -m region -z -s --clipboard-only",
    shift = true,
    submap_universal = true,
})
