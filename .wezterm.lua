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

    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = false,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    tab_and_split_indices_are_zero_based = false,

    hide_mouse_cursor_when_typing = true,
    force_reverse_video_cursor = false,
    window_background_opacity = 1,

    enable_scroll_bar = false,
    scroll_to_bottom_on_input = true,

    window_padding = {
        left = '0.3%',
        right = '0.2%',
        top = '0.6%',
        bottom = 0,
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

    colors = {
        tab_bar = {
            background = 'none',
            active_tab = {
                bg_color = 'none',
                fg_color = '#a7c080',
            },
            inactive_tab = {
                bg_color = 'none',
                fg_color = '#475258',
            },
            inactive_tab_hover = {
                bg_color = 'none',
                fg_color = '#859289',
            },
            new_tab = {
                bg_color = 'none',
                fg_color = '#475258',
            },
            new_tab_hover = {
                bg_color = 'none',
                fg_color = '#859289',
            },
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

    leader = { mods = 'ALT', key = 'w', timeout_milliseconds = 1000 },
    keys = {
        {
            mods = 'ALT',
            key = 'Enter',
            action = wezterm.action.SpawnTab('CurrentPaneDomain'),
        },
        {
            mods = 'ALT',
            key = 'q',
            action = wezterm.action.CloseCurrentPane({ confirm = false }),
        },

        {
            mods = 'ALT',
            key = '{',
            action = wezterm.action.ActivateTabRelative(-1),
        },
        {
            mods = 'ALT',
            key = '}',
            action = wezterm.action.ActivateTabRelative(1),
        },

        {
            mods = 'ALT',
            key = 's',
            action = wezterm.action.SplitVertical({
                domain = 'CurrentPaneDomain',
            }),
        },
        {
            mods = 'ALT',
            key = 'v',
            action = wezterm.action.SplitHorizontal({
                domain = 'CurrentPaneDomain',
            }),
        },

        {
            mods = 'ALT',
            key = 'j',
            action = wezterm.action.ActivatePaneDirection('Next'),
        },
        {
            mods = 'ALT',
            key = 'k',
            action = wezterm.action.ActivatePaneDirection('Prev'),
        },

        {
            mods = 'LEADER',
            key = 'h',
            action = wezterm.action.AdjustPaneSize({ 'Left', 5 }),
        },
        {
            mods = 'LEADER',
            key = 'l',
            action = wezterm.action.AdjustPaneSize({ 'Right', 5 }),
        },
        {
            mods = 'LEADER',
            key = 'j',
            action = wezterm.action.AdjustPaneSize({ 'Down', 5 }),
        },
        {
            mods = 'LEADER',
            key = 'k',
            action = wezterm.action.AdjustPaneSize({ 'Up', 5 }),
        },
    },
}

for i = 0, 8 do
    table.insert(config.keys, {
        mods = 'ALT',
        key = tostring(i + 1),
        action = wezterm.action.ActivateTab(i),
    })
end

return config
