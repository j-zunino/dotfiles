{
    pkgs,
    inputs,
    ...
}: {
    programs = {
        wezterm = {
            enable = true;
            package = inputs.wezterm.packages.${pkgs.system}.default;

            extraConfig = ''
                local wezterm = require("wezterm")
                local config = {
                    color_scheme = "stylix",

                    max_fps = 60,
                    animation_fps = 0,
                    cursor_blink_rate = 0,
                    allow_square_glyphs_to_overflow_width = "Always",

                    enable_tab_bar = false,
                    hide_mouse_cursor_when_typing = true,
                    force_reverse_video_cursor = false,
                    window_background_opacity = 0.9,

                    enable_scroll_bar = false,
                    scroll_to_bottom_on_input = true,

                    window_padding = {
                        left = '1cell',
                        right = '1cell',
                        top = '0.5cell',
                        bottom = '0.5cell',
                    },

                    keys = {
                        { mods = "ALT", key = "Enter", action = wezterm.action.DisableDefaultAssignment, },
                        { mods = "ALT", key = "q", action = wezterm.action.DisableDefaultAssignment, },
                        { mods = "ALT", key = "{", action = wezterm.action.DisableDefaultAssignment, },
                        { mods = "ALT", key = "}", action = wezterm.action.DisableDefaultAssignment, },
                        { mods = "ALT", key = "s", action = wezterm.action.DisableDefaultAssignment, },
                        { mods = "ALT", key = "v", action = wezterm.action.DisableDefaultAssignment, },
                        { mods = "ALT", key = "j", action = wezterm.action.DisableDefaultAssignment, },
                        { mods = "ALT", key = "k", action = wezterm.action.DisableDefaultAssignment, },
                    }
                }

                return config
            '';
        };
    };
}
