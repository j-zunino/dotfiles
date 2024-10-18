{ pkgs, inputs, ... }:

{
    programs = {
        wezterm = {
            enable = true;
            package = inputs.wezterm.packages.${pkgs.system}.default;

            extraConfig = ''
                local wezterm = require 'wezterm'

                local config = wezterm.config_builder()

                config = {
                    color_scheme = 'everforest',

                    -- font = wezterm.font 'CaskaydiaCove Nerd Font'
                    font = wezterm.font 'JetBrainsMono Nerd Font',
                    font_size = 10.9,

                    enable_tab_bar = false,

                    hide_mouse_cursor_when_typing = true,
                    force_reverse_video_cursor = true,
                    window_background_opacity = 0.9,

                    cursor_blink_rate = 0,

                    enable_scroll_bar = false,
                    scroll_to_bottom_on_input = true,

                    window_padding = {
                        left = 3,
                        right = 0,
                        top = 0,
                        bottom = 0,
                    },
                }

                return config
            '';

            colorSchemes = {
                everforest = {
                    ansi = [
                        "#232a2e" "#e67e80" "#a7c080" "#dbbc7f" "#7fbbb3" "#d699b6" "#83c092" "#d3c6aa"
                    ];
                    brights = [
                        "#232a2e" "#e67e80" "#a7c080" "#dbbc7f" "#7fbbb3" "#d699b6" "#83c092" "#d3c6aa"
                    ];

                    foreground = "#d3c6aa";
                    background = "#2d353b";
                    cursor_fg = "#2d353b";
                    cursor_bg = "#d3c6aa";
                    cursor_border = "#d3c6aa";
                    selection_fg = "none";
                    selection_bg = "#543a48";
                };
            };
        };
    };
}
