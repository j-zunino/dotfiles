{pkgs, ...}: {
    home = {
        pointerCursor = {
            hyprcursor = {
                enable = true;
            };
        };
        packages = with pkgs; [
            hyprpicker
            wl-clipboard
            cliphist
        ];
    };

    wayland.windowManager.hyprland = {
        enable = true;
        plugins = with pkgs.hyprlandPlugins; [
            hypr-dynamic-cursors
        ];

        settings = {
            # - [ VARIABLES ] -
            "$mod" = "SUPER";
            "$mod_shift" = "SUPER_SHIFT";

            "$browser" = "brave";
            "$browser_firefox" = "zen";
            "$file-explorer" = "nautilus";
            "$terminal" = "wezterm";
            "$menu" = "rofi -show run";

            # - [ ENV VARIABLES ] -
            env = [
                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
            ];

            # - [ AUTOSTART ] -
            exec-once = [
                "sleep 5"
                "waybar"
                "wpaperd"
                "syshud -p bottom -i 24 -m 5"
                "wl-paste --watch cliphist store"
            ];

            # - [ MONITORS ] -
            monitor = ",preferred,auto,auto";

            master = {
                new_status = "slave";
            };

            # - [ LOOK AND FEEL ] -
            general = {
                layout = "master";

                gaps_in = 0;
                gaps_out = 0;

                border_size = 2;
                resize_on_border = true;
            };

            decoration = {
                rounding = 0;

                active_opacity = 1.0;
                inactive_opacity = 1.0;

                dim_inactive = true;
                dim_strength = 0.05;

                shadow = {
                    enabled = false;
                };

                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;

                    vibrancy = 0.2;
                };
            };

            animations = {
                enabled = false;
                first_launch_animation = false;

                bezier = "myBezier, 0, 0.4, 0.2, 1";

                animation = [
                    "windows, 1, 5, myBezier, slide"
                    "fade, 1, 3, default"
                    "workspaces, 1, 3, default"
                ];
            };

            # - [ INPUTS ] -
            input = {
                kb_layout = "latam";
                kb_model = "latitude";
                kb_options = "caps:swapescape";
                repeat_delay = 300;

                follow_mouse = 1;

                sensitivity = 0;

                touchpad = {
                    disable_while_typing = true;
                    natural_scroll = false;
                    scroll_factor = 0.5;
                    middle_button_emulation = true;
                };
            };

            gestures = {
                workspace_swipe = false;
            };

            misc = {
                force_default_wallpaper = 0;
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
                animate_manual_resizes = true;
                disable_hyprland_qtutils_check = true;
            };

            cursor = {
                enable_hyprcursor = true;
                no_warps = true;
            };

            bind =
                [
                    "$mod, F, exec, $browser"
                    "$mod, B, exec, $browser_firefox"
                    "$mod, Q, exec, $terminal"
                    "$mod, P, exec, $menu"
                    "$mod_shift, RETURN, exec, $terminal"
                    "$mod, E, exec, $file-explorer"

                    "$mod_shift, C, killactive"
                    "$mod_shift, Q, exec, logout"
                    "$mod_shift, V, exec, clipboard"
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

            "plugin:dynamic-cursors" = {
                enabled = true;
                mode = "stretch";

                stretch = {
                    limit = 4000;
                };

                shake = {
                    enabled = true;
                    base = 2.0;
                };

                hyprcursor = {
                    enabled = true;
                    resulution = -1;
                };
            };
        };
    };
}
