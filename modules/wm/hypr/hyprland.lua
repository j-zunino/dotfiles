hl.on('hyprland.start', function()
    hl.exec_cmd(
        'waybar & wbg -s $(find ~/dotfiles/wallpapers -type f | shuf -n 1) & wl-paste --watch cliphist store & steam -silent & spotify & webcord -m'
    )
end)

require('binds')
require('animations')

hl.monitor({
    output = '',
    mode = 'preferred',
    position = 'auto',
    scale = 'auto',
})

hl.config({
    general = {
        border_size = 0,
        gaps_in = 2,
        gaps_out = 4,
        layout = 'master',
    },

    decoration = {
        inactive_opacity = 0.95,
        blur = { enabled = false },
        shadow = { enabled = false },
    },

    input = {
        kb_layout = 'latam',
        repeat_delay = 300,

        touchpad = {
            disable_while_typing = false,
        },
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },

    cursor = { no_warps = true },

    ecosystem = { no_donation_nag = true },
})

require('overrides')
