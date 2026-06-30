local bind = require("lib.bind")
local layout = require("lib.layout")
local osd = require("lib.osd")
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
local menu = {
    launcher = "foot -T floating-fzf -e $HOME/dotfiles/scripts/fzf/launcher",
    clipboard = "foot -T floating-fzf -e $HOME/dotfiles/scripts/fzf/clipboard",
    logout = "foot -T floating-fzf -e $HOME/dotfiles/scripts/fzf/logout",
}

bind.map({ "P", exec = menu.launcher })
bind.map({ "D", exec = menu.launcher })
bind.map({ "V", exec = menu.clipboard })
bind.map({ "Q", exec = menu.logout, shift = true })

hl.window_rule({
    name = "floating-fzf",
    match = {
        class = "foot",
        title = "floating-fzf",
    },
    float = true,
    center = true,
    pin = true,
    stay_focused = true,
    dim_around = true,
    size = { 600, 600 },
})

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
for i = 1, 10 do
    local key = tostring(i % 10)
    bind.map({ key, action = hl.dsp.focus({ workspace = i }) })
    bind.map({
        key,
        action = window.move({ workspace = i, follow = false }),
        shift = true,
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
    action = osd.brightness.up,
    repeating = true,
    super = false,
})
bind.map({
    "XF86MonBrightnessDown",
    action = osd.brightness.down,
    repeating = true,
    super = false,
})
bind.map({
    "XF86AudioRaiseVolume",
    action = osd.volume.up,
    repeating = true,
    super = false,
})
bind.map({
    "XF86AudioLowerVolume",
    action = osd.volume.down,
    repeating = true,
    super = false,
})
bind.map({ "XF86AudioMute", action = osd.volume.toggle, super = false })
bind.map({ "XF86AudioNext", action = osd.play.next, super = false })
bind.map({ "XF86AudioPlay", action = osd.play.play_pause, super = false })
bind.map({ "XF86AudioPrev", action = osd.play.previous, super = false })

------------------------------------------------------------------------------
-- MISC
------------------------------------------------------------------------------
bind.map({ "B", exec = "pkill -SIGUSR1 waybar" })
bind.map({ "C", exec = "hyprpicker" })
