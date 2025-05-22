local wezterm = require('wezterm')
local config = wezterm.config_builder()

config = {
    default_domain = 'WSL:NixOS',
    default_prog = { 'pwsh.exe', '-NoLogo' },

    font_size = 13,
    font = wezterm.font('JetBrainsMono Nerd Font'),

    max_fps = 240,
    animation_fps = 0,
    cursor_blink_rate = 0,
    allow_square_glyphs_to_overflow_width = 'Always',

    enable_tab_bar = false,
    hide_mouse_cursor_when_typing = true,
    force_reverse_video_cursor = false,
    window_background_opacity = 1,

    enable_scroll_bar = false,
    scroll_to_bottom_on_input = true,

    window_padding = {
        left = '1cell',
        right = '1cell',
        top = '0.5cell',
        bottom = '0.5cell',
    },

    color_scheme = 'everforest',

    color_schemes = {
        ['everforest'] = {
            ansi = {
                '#2d353b',
                '#e67e80',
                '#a7c080',
                '#dbbc7f',
                '#7fbbb3',
                '#d699b6',
                '#83c092',
                '#d3c6aa',
            },

            brights = {
                '#859289',
                '#e67e80',
                '#a7c080',
                '#dbbc7f',
                '#7fbbb3',
                '#d699b6',
                '#83c092',
                '#fdf6e3',
            },

            foreground = '#d3c6aa',
            background = '#2d353b',
            cursor_fg = '#2d353b',
            cursor_bg = '#d3c6aa',
            cursor_border = '#d3c6aa',
            selection_fg = 'none',
            selection_bg = '#543a48',
            split = '#859289',
        },
    },

    window_frame = {
        active_titlebar_bg = '#859289',
        active_titlebar_fg = '#d3c6aa',
        active_titlebar_border_bottom = '#859289',
        border_left_color = '#343f44',
        border_right_color = '#343f44',
        border_bottom_color = '#343f44',
        border_top_color = '#343f44',
        button_bg = '#343f44',
        button_fg = '#d3c6aa',
        button_hover_bg = '#d3c6aa',
        button_hover_fg = '#859289',
        inactive_titlebar_bg = '#343f44',
        inactive_titlebar_fg = '#d3c6aa',
        inactive_titlebar_border_bottom = '#859289',
    },

    keys = {
        {
            mods = 'ALT',
            key = 'Enter',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            mods = 'ALT',
            key = 'q',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            mods = 'ALT',
            key = '{',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            mods = 'ALT',
            key = '}',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            mods = 'ALT',
            key = 's',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            mods = 'ALT',
            key = 'v',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            mods = 'ALT',
            key = 'j',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            mods = 'ALT',
            key = 'k',
            action = wezterm.action.DisableDefaultAssignment,
        },
    },
}

return config
