# TODO: Add styles
{inputs, ...}: {
    flake.modules.nixos.mangowc = {
        imports = [inputs.mango.nixosModules.mango];
        programs.mango.enable = true;
    };

    flake.modules.homeManager.mangowc = {
        imports = [inputs.mango.hmModules.mango];

        wayland.windowManager.mango = {
            enable = true;
            settings = {
                exec-once = [
                    "waybar"
                    "wbg -s $(find ~/dotfiles/wallpapers -type f | shuf -n 1)"
                    "wl-paste --watch cliphist store"
                    "steam -silent"
                    "spotify"
                    "webcord -m"
                ];

                # INPUT
                repeat_delay = 300;
                xkb_rules_layout = "latam";
                xkb_rules_options = "caps:escape";
                mouse_accel_profile = 0;
                disable_while_typing = 0;

                # MISC
                allow_tearing = 2;
                syncobj_enable = 1;
                warpcursor = 0;
                drag_corner = 4;
                drag_tile_to_tile = 1;

                # VISUAL
                border_radius = 0;
                borderpx = 0;
                gappih = 4;
                gappiv = 4;
                gappoh = 4;
                gappov = 4;

                shadow_only_floating = 0;
                unfocused_opacity = 0.95;

                animations = 1;
                animation_type_open = "none";
                animation_type_close = "none";
                animation_fade_in = 0;
                animation_fade_out = 0;
                animation_duration_tag = 0;
                animation_duration_move = 180;
                animation_curve_move = "0.16,1,0.3,1";

                # LAYOUTS
                enable_hotarea = 0;
                new_is_master = 0;
                circle_layout = "tile,scroller";

                # BINDS
                bind = [
                    "SUPER+SHIFT,r,reload_config"
                    "SUPER,b,spawn_shell,pkill -SIGUSR1 waybar" # Toggle waybar
                    # bind=SUPER+SHIFT,s,spawn_shell,hyprshot -m region --c
                    # bind=SUPER,c,spawn_shell,hyprpicker -a

                    # TODO: Make dynamic
                    "SUPER,q,spawn,foot"
                    "SUPER,f,spawn,zen"
                    "SUPER,e,spawn,thunar"

                    # MENU
                    "SUPER,p,spawn,foot -T 'floating-fzf' -e $HOME/dotfiles/scripts/fzf/launcher"
                    "SUPER,d,spawn,foot -T 'floating-fzf' -e $HOME/dotfiles/scripts/fzf/launcher"
                    "SUPER,v,spawn,foot -T 'floating-fzf' -e $HOME/dotfiles/scripts/fzf/clipboard"
                    "SUPER+SHIFT,q,spawn,foot -T 'floating-fzf' -e $HOME/dotfiles/scripts/fzf/logout"

                    # LAYOUT
                    "SUPER,m,togglefullscreen"
                    "SUPER+SHIFT,space,togglefloating"

                    "SUPER,n,switch_layout"
                    "SUPER+SHIFT,BackSpace,zoom" # Set as master

                    # WINDOWS
                    "SUPER+SHIFT,c,killclient"
                    "SUPER,c,killclient"
                    "SUPER,j,focusstack,next"
                    "SUPER,k,focusstack,prev"
                    "SUPER+SHIFT,j,exchange_stack_client,next"
                    "SUPER+SHIFT,k,exchange_stack_client,prev"

                    "SUPER,h,resizewin,-20,0"
                    "SUPER,l,resizewin,+20,0"
                    "SUPER+SHIFT,h,resizewin,0,-50"
                    "SUPER+SHIFT,l,resizewin,0,+50"

                    # TAGS
                    "SUPER,1,spawn_shell,~/dotfiles/scripts/mango/smart_tags 1"
                    "SUPER,2,spawn_shell,~/dotfiles/scripts/mango/smart_tags 2"
                    "SUPER,3,spawn_shell,~/dotfiles/scripts/mango/smart_tags 3"
                    "SUPER,4,spawn_shell,~/dotfiles/scripts/mango/smart_tags 4"
                    "SUPER,5,spawn_shell,~/dotfiles/scripts/mango/smart_tags 5"
                    "SUPER,6,spawn_shell,~/dotfiles/scripts/mango/smart_tags 6"
                    "SUPER,7,spawn_shell,~/dotfiles/scripts/mango/smart_tags 7"
                    "SUPER,8,spawn_shell,~/dotfiles/scripts/mango/smart_tags 8"
                    "SUPER,9,spawn_shell,~/dotfiles/scripts/mango/smart_tags 9"
                    "SUPER+SHIFT,1,spawn_shell,~/dotfiles/scripts/mango/smart_move_tag 1"
                    "SUPER+SHIFT,2,spawn_shell,~/dotfiles/scripts/mango/smart_move_tag 2"
                    "SUPER+SHIFT,3,spawn_shell,~/dotfiles/scripts/mango/smart_move_tag 3"
                    "SUPER+SHIFT,4,spawn_shell,~/dotfiles/scripts/mango/smart_move_tag 4"
                    "SUPER+SHIFT,5,spawn_shell,~/dotfiles/scripts/mango/smart_move_tag 5"
                    "SUPER+SHIFT,6,spawn_shell,~/dotfiles/scripts/mango/smart_move_tag 6"
                    "SUPER+SHIFT,7,spawn_shell,~/dotfiles/scripts/mango/smart_move_tag 7"
                    "SUPER+SHIFT,8,spawn_shell,~/dotfiles/scripts/mango/smart_move_tag 8"
                    "SUPER+SHIFT,9,spawn_shell,~/dotfiles/scripts/mango/smart_move_tag 9"

                    # AUDIO & BRIGHTNESS
                    "NONE,XF86MonBrightnessUp,spawn_shell,brightnessctl set 5%+ && osd_brightness"
                    "NONE,XF86MonBrightnessDown,spawn_shell,brightnessctl -n1 set 5%- && osd_brightness"
                    "NONE,XF86AudioRaiseVolume,spawn_shell,wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && osd_volumen"
                    "NONE,XF86AudioLowerVolume,spawn_shell,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && osd_volumen"
                    "NONE,XF86AudioMute,spawn_shell,wpctl set-mute @DEFAULT_SINK@ toggle && osd_volumen"
                    "NONE,XF86AudioNext,spawn_shell,playerctl next"
                    "NONE,XF86AudioPause,spawn_shell,playerctl play-pause"
                    "NONE,XF86AudioPlay,spawn_shell,playerctl play-pause"
                    "NONE,XF86AudioPrev,spawn_shell,playerctl previous"
                ];

                mousebind = [
                    "SUPER,btn_left,moveresize,curmove"
                    "SUPER,btn_right,moveresize,curresize"
                ];

                # RULES
                windowrule = [
                    "isfloating:1,width:1200,height:900,title:^floating$"
                    "isfloating:1,width:600,height:600,title:^floating-fzf$"
                ];
            };
        };
    };

    flake.modules.homeManager.stylix = {config, ...}: let
        colors = config.my.colors;
    in {
        wayland.windowManager.mango.extraConfig = ''
            cursor_size=${toString config.stylix.cursor.size}
            rootcolor=0x${colors.bg1.hexNoPrefix}ff
            bordercolor=0x${colors.bg1.hexNoPrefix}ff
            focuscolor=0x${colors.accent.hexNoPrefix}ff
            focuscolor=0x${colors.accent.hexNoPrefix}ff
            urgentcolor=0x${colors.red.hexNoPrefix}ff
            dropcolor=0x${colors.bg2.hexNoPrefix}ff
        '';
    };
}
