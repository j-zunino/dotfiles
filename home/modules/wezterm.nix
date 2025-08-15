{...}: {
    programs.wezterm = {
        enable = true;

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

                disable_default_key_bindings = true,

                keys = {
                    { mods = 'CTRL', key = 'V', action = wezterm.action.PasteFrom 'Clipboard' },
                    { mods = 'CTRL', key = 'C', action = wezterm.action.CopyTo 'Clipboard' },

                    { mods = 'CTRL', key = '0', action = wezterm.action.ResetFontSize },
                    { mods = 'CTRL', key = '+', action = wezterm.action.IncreaseFontSize },
                    { mods = 'CTRL', key = '-', action = wezterm.action.DecreaseFontSize },
                }
            }

            return config
        '';
    };
}
