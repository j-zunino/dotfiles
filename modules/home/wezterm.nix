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
            -- Stylix (~/dotfiles/modules/stylix.nix)
            color_scheme="stylix",

            max_fps = 60,
            animation_fps = 0,
            cursor_blink_rate = 0,

            enable_tab_bar = true,
            hide_tab_bar_if_only_one_tab = false,
            tab_bar_at_bottom = true,
            use_fancy_tab_bar = false,
            tab_and_split_indices_are_zero_based = false,

            hide_mouse_cursor_when_typing = true,
            force_reverse_video_cursor = false,
            window_background_opacity = 0.9,

            enable_scroll_bar = false,
            scroll_to_bottom_on_input = true,

            window_padding = {
                left = '0.3%',
                right = '0.2%',
                top = '0.6%',
                bottom = 0,
            },


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
    };
  };
}
