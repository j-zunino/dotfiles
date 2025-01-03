{ ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            # - [ VARIABLES ] -
            "$mod" = "SUPER";
            "$mod_shift" = "SUPER_SHIFT";

            "$browser" = "brave";
            "$terminal" = "wezterm";
            "$menu" = "rofi -show run";

            # - [ ENV VARIABLES ] -
            env = [
                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
            ];

            # - [ AUTOSTART ] -
            "exec-once" = "sleep 5 & waybar & wpaperd & hyprctl setcursor yaru 24";

            # - [ COLORS ] -
            "$bg_dim" = "rgb(232a2e)"; #232a2e
            "$bg0" =    "rgb(2d353b)"; #2d353b
            "$bg1" =    "rgb(343f44)"; #343f44
            "$bg2" =    "rgb(3d484d)"; #3d484d
            "$bg3" =    "rgb(475258)"; #475258
            "$bg4" =    "rgb(4f585e)"; #4f585e
            "$bg5" =    "rgb(56635f)"; #56635f

            "$gray0" =  "rgb(7a8478)"; #7a8478
            "$gray1" =  "rgb(859289)"; #859289
            "$gray2" =  "rgb(9da9a0)"; #9da9a0

            "$fg" =     "rgb(d3c6aa)"; #d3c6aa

            "$red" =    "rgb(e67e80)"; #e67e80
            "$orange" = "rgb(e69875)"; #e69875
            "$yellow" = "rgb(dbbc7f)"; #dbbc7f
            "$green" =  "rgb(a7c080)"; #a7c080
            "$blue" =   "rgb(7fbbb3)"; #7fbbb3
            "$aqua" =   "rgb(83c092)"; #83c092
            "$purple" = "rgb(d699b6)"; #d699b6



            # - [ MONITORS ] -
            monitor = ",preferred,auto,auto";

            master = {
                new_status = "slave";
            };


            # - [ LOOK AND FEEL ] -
            general = {
                layout = "master";

                gaps_in = 5;
                gaps_out = 7;

                border_size = 2;
                resize_on_border = true;

                "col.active_border" = "$green";
                "col.inactive_border" = "$bg_dim";
            };


            decoration = {
                rounding = 0;

                active_opacity = 1.0;
                inactive_opacity = 0.9;

                dim_inactive = true;
                dim_strength = 0.2;

                shadow = {
                    enabled = false;
                };

                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;

                    vibrancy = 0.1696;
                };
            };

            animations = {
                enabled = true;
                first_launch_animation = true;

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
                # font_family = "CaskaydiaMono Nerd Font";
                font_family = "JetBrainsMono Nerd Font";
                disable_hyprland_qtutils_check = true;
            };

            cursor = {
                # enable_hyprcursor = true;
                no_warps = true;
            };

            bind = [
                "$mod, F, exec, $browser"
                "$mod, Q, exec, $terminal"
                "$mod, P, exec, $menu"
                "$mod_shift, RETURN, exec, $terminal"

                "$mod_shift, C, killactive"
                "$mod_shift, Q, exit"
                "$mod_shift, SPACE, exec, hyprctl --batch 'dispatch togglefloating ; dispatch centerwindow'"

                "$mod, J, layoutmsg, cyclenext"
                "$mod, K, layoutmsg, cycleprev"

                "$mod_shift, J, layoutmsg, swapnext"
                "$mod_shift, K, layoutmsg, swapprev"

                "$mod, M, fullscreen"

                "$mod, H, resizeactive, -20 0"
                "$mod, L, resizeactive, 20 0"

                "$mod_shift, H, resizeactive, 0 -20"
                "$mod_shift, L, resizeactive, 0 20"

                "$mod_shift, S, exec, hyprshot -m region --c"
                "$mod, PRINT, exec, hyprshot -m output"

                "$mod, C, exec, hyprpicker -a"
            ]
            ++ (

                builtins.concatLists (builtins.genList (i:
                    let ws = i + 1;
                    in [
                        "$mod, code:1${toString i}, workspace, ${toString ws}"
                        "$mod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
                    ]
                )
                9)
            );

            bindm = [
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];

            bindel = [
                # Volume controls
                ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && sh ~/dotfiles/modules/home/scripts/dunst-notify.sh volume"
                ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && sh ~/dotfiles/modules/home/scripts/dunst-notify.sh volume"

                # Volume mute/unmute
                ",XF86AudioMute, exec, sh ~/dotfiles/modules/home/scripts/dunst-notify.sh mute"

                # Brightness controls
                ",XF86MonBrightnessUp, exec, brightnessctl set 5%+ && sh ~/dotfiles/modules/home/scripts/dunst-notify.sh brightness"
                ",XF86MonBrightnessDown, exec, brightnessctl -n1 set 5%- && sh ~/dotfiles/modules/home/scripts/dunst-notify.sh brightness"

                # Media controls
                ",XF86AudioNext, exec, playerctl next"
                ",XF86AudioPause, exec, playerctl play-pause"
                ",XF86AudioPlay, exec, playerctl play-pause"
                ",XF86AudioPrev, exec, playerctl previous"
            ];
        };

    };
}
