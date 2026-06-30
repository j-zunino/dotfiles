local autostart = require("lib").autostart

autostart.add("waybar")
autostart.add("wbg -s $(find ~/dotfiles/wallpapers -type f | shuf -n 1)")
autostart.add("wl-paste --watch cliphist store")
autostart.add("steam -silent")
autostart.add("spotify")
autostart.add("webcord -m")

hl.on("hyprland.start", autostart.start)

hl.window_rule({ match = { class = "spotify" }, workspace = "10 silent" })

hl.window_rule({
    match = { class = "com.stremio.Stremio" },
    opacity = "1.0 override 1.0 override",
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

hl.config({
    general = {
        border_size = 0,
        gaps_in = 2,
        gaps_out = 4,
        layout = "master",
    },
    decoration = {
        inactive_opacity = 0.95,
        blur = { enabled = false },
        shadow = { enabled = false },
    },
    input = {
        kb_layout = "latam",
        repeat_delay = 300,
        accel_profile = "flat",
        touchpad = { disable_while_typing = false },
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        middle_click_paste = false,
    },
    cursor = { no_warps = true },
    ecosystem = { no_donation_nag = true },
})

require("binds")
require("animations")

require("overrides.desktop")
require("overrides.latitude")
