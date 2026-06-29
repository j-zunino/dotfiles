local bind = require("lib.bind")
local layout = require("lib.layout")
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
local menu = "foot -T floating-fzf -e $HOME/dotfiles/scripts/fzf/launcher"
local clipboard = "foot -T floating-fzf -e $HOME/dotfiles/scripts/fzf/clipboard"
local logout = "foot -T floating-fzf -e $HOME/dotfiles/scripts/fzf/logout"

bind.map({ "P", exec = menu })
bind.map({ "D", exec = menu })
bind.map({ "V", exec = clipboard })
bind.map({ "Q", exec = logout, mod = "SHIFT" })

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
bind.map({ "C", action = window.close(), mod = "SHIFT" })

layout.bind({ "J", master = "cyclenext", scrolling = "focus r" })
layout.bind({ "K", master = "cycleprev", scrolling = "focus l" })

layout.bind({ "J", master = "swapnext", scrolling = "swapcol r", mod = "SHIFT" })
layout.bind({ "K", master = "swapprev", scrolling = "swapcol l", mod = "SHIFT" })

layout.bind({
    "h",
    master = window.resize({
        x = -20,
        y = 0,
        relative = true,
        repeating = true,
    }),
    scrolling = "colresize -0.1",
})
layout.bind({
    "l",
    master = window.resize({ x = 20, y = 0, relative = true, repeating = true }),
    scrolling = "colresize +0.1",
})

layout.bind({ "BACKSPACE", master = "swapwithmaster", mod = "SHIFT" })

bind.map({
    "M",
    action = window.fullscreen({ mode = "fullscreen", action = "toggle" }),
})
bind.map({
    "SPACE",
    action = window.float({ action = "toggle" }),
    mod = "SHIFT",
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
        mod = "SHIFT",
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
    exec = "brightnessctl set 5%+ && $HOME/dotfiles/scripts/osd/brightness",
    repeating = true,
})
bind.map({
    "XF86MonBrightnessDown",
    exec = "brightnessctl set 5%- && $HOME/dotfiles/scripts/osd/brightness",
    repeating = true,
})
bind.map({
    "XF86AudioRaiseVolume",
    exec = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && $HOME/dotfiles/scripts/osd/volumen",
    repeating = true,
})
bind.map({
    "XF86AudioLowerVolume",
    exec = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%- && $HOME/dotfiles/scripts/osd/volumen",
    repeating = true,
})
bind.map({
    "XF86AudioMute",
    exec = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && $HOME/dotfiles/scripts/osd/volumen",
    repeating = true,
})
bind.map({ "XF86AudioNext", exec = "playerctl next" })
bind.map({ "XF86AudioPause", exec = "playerctl play-pause" })
bind.map({ "XF86AudioPlay", exec = "playerctl play-pause" })
bind.map({ "XF86AudioPrev", exec = "playerctl previous" })

------------------------------------------------------------------------------
-- MISC
------------------------------------------------------------------------------
bind.map({ "B", exec = "pkill -SIGUSR1 waybar" })
bind.map({ "C", exec = "hyprpicker" })
