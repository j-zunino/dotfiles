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

                    max_fps = 240,

                    -- font = wezterm.font 'CaskaydiaCove Nerd Font'
                    font = wezterm.font 'JetBrainsMono Nerd Font',
                    font_size = 10.9,

                    enable_tab_bar = true,
                    hide_tab_bar_if_only_one_tab = false,
                    tab_bar_at_bottom = true,
                    use_fancy_tab_bar = false,
                    tab_and_split_indices_are_zero_based = false,

                    colors = {
                        tab_bar = {
                            background = "none",

                            active_tab = {
                                bg_color = "none",
                                fg_color = "#a7c080",
                            },
                            inactive_tab = {
                                bg_color = "none",
                                fg_color = "#4f585e",
                            },

                            new_tab = {
                                bg_color = "none",
                                fg_color = "#343f44",
                            },
                            new_tab_hover = {
                                bg_color = "#343f44",
                                fg_color = "#4f585e",
                            },

                        },
                    },

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


                    -- tmux
                    leader = { mods = "ALT", key = "w", timeout_milliseconds = 1000 },
                    keys = {
                        {
                            mods = "ALT",
                            key = "Enter",
                            action = wezterm.action.SpawnTab "CurrentPaneDomain",
                        },
                        {
                            mods = "ALT",
                            key = "q",
                            action = wezterm.action.CloseCurrentPane { confirm = true },
                        },

                        {
                            mods = "ALT",
                            key = "{",
                            action = wezterm.action.ActivateTabRelative(-1),
                        },
                        {
                            mods = "ALT",
                            key = "}",
                            action = wezterm.action.ActivateTabRelative(1),
                        },


                        {
                            mods = "ALT",
                            key = "s",
                            action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
                        },
                        {
                            mods = "ALT",
                            key = "v",
                            action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
                        },

                        {
                            mods = "ALT",
                            key = "j",
                            action = wezterm.action.ActivatePaneDirection "Next",
                        },
                        {
                            mods = "ALT",
                            key = "k",
                            action = wezterm.action.ActivatePaneDirection "Prev",
                        },

                        {
                            mods = "LEADER",
                            key = "h",
                            action = wezterm.action.AdjustPaneSize { "Left", 5 },
                        },
                        {
                            mods = "LEADER",
                            key = "l",
                            action = wezterm.action.AdjustPaneSize { "Right", 5 },
                        },
                        {
                            mods = "LEADER",
                            key = "j",
                            action = wezterm.action.AdjustPaneSize { "Down", 5 },
                        },
                        {
                            mods = "LEADER",
                            key = "k",
                            action = wezterm.action.AdjustPaneSize { "Up", 5 },
                        },
                    },
                }

                for i = 0, 8 do
                    table.insert(config.keys, {
                        mods = "ALT",
                        key = tostring(i + 1),
                        action = wezterm.action.ActivateTab(i),
                    })
                end

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
