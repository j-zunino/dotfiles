{...}: {
    wayland.windowManager.hyprland.settings = {
        "$terminal" = "wezterm";
        "$browser" = "brave";
        "$browser_firefox" = "zen";
        "$file-explorer" = "nautilus";
        "$menu" = "rofi -show run";

        "$mod" = "SUPER";
        "$mod_shift" = "SUPER_SHIFT";

        bind =
            [
                "$mod, F, exec, $browser"
                "$mod, B, exec, $browser_firefox"
                "$mod, Q, exec, $terminal"
                "$mod, P, exec, $menu"
                "$mod_shift, RETURN, exec, $terminal"
                "$mod, E, exec, $file-explorer"

                "$mod_shift, C, killactive"
                "$mod_shift, Q, exec, rofi_logout"
                "$mod_shift, V, exec, rofi_clipboard"
                "$mod_shift, SPACE, exec, hyprctl --batch 'dispatch togglefloating; dispatch centerwindow'"

                "$mod, M, fullscreen"

                "$mod_shift, S, exec, hyprshot -m region --c"
                "$mod, PRINT, exec, hyprshot -m output"

                "$mod, C, exec, hyprpicker -a"
            ]
            ++ (
                builtins.concatLists (builtins.genList (
                    i: let
                        ws = i + 1;
                    in [
                        "$mod, code:1${toString i}, workspace, ${toString ws}"
                        "$mod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
                    ]
                )
                9)
            );

        binde = [
            "$mod, J, layoutmsg, cyclenext"
            "$mod, K, layoutmsg, cycleprev"

            "$mod_shift, J, layoutmsg, swapnext"
            "$mod_shift, K, layoutmsg, swapprev"

            "$mod, H, resizeactive, -20 0"
            "$mod, L, resizeactive, 20 0"

            "$mod_shift, H, resizeactive, 0 -20"
            "$mod_shift, L, resizeactive, 0 20"
        ];

        bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
        ];

        bindel = [
            # Volume controls
            ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

            # Volume mute/unmute
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"

            # Brightness controls
            ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
            ",XF86MonBrightnessDown, exec, brightnessctl -n1 set 5%-"

            # Media controls
            ",XF86AudioNext, exec, playerctl next"
            ",XF86AudioPause, exec, playerctl play-pause"
            ",XF86AudioPlay, exec, playerctl play-pause"
            ",XF86AudioPrev, exec, playerctl previous"
        ];
    };
}
