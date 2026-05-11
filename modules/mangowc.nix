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
      settings = ''
        exec-once=waybar
        exec-once=wbg -s $(find ~/dotfiles/wallpapers -type f | shuf -n 1)
        exec-once=wl-paste --watch cliphist store

        new_is_master=0
        circle_layout=tile,scroller,vertical_scroller

        repeat_rate=40
        repeat_delay=300
        xkb_rules_layout=latam
        xkb_rules_options=caps:escape

        # accel_profile=0
        warpcursor=0
        drag_corner=4
        drag_warp_cursor=0
        drag_tile_to_tile=1

        windowrule=isfloating:1,width:1200,height:900,title:^floating$
        windowrule=isfloating:1,width:600,height:600,title:^floating-fzf$

        bind=SUPER+SHIFT,r,reload_config

        # Toggle waybar
        bind=SUPER,b,spawn_shell,pkill -SIGUSR1 waybar

        # TODO: Make dynamic
        bind=SUPER,q,spawn,foot
        bind=SUPER+SHIFT,Return,spawn,foot
        bind=SUPER,f,spawn,zen
        bind=SUPER,e,spawn,thunar

        bind=SUPER+SHIFT,s,spawn_shell,hyprshot -m region --c
        bind=SUPER,c,spawn_shell,hyprpicker -a

        # Open menu
        bind=SUPER,p,spawn,foot -T "floating-fzf" -e $HOME/dotfiles/features/scripts/fzf/launcher
        bind=SUPER,d,spawn,foot -T "floating-fzf" -e $HOME/dotfiles/features/scripts/fzf/launcher
        bind=SUPER,v,spawn,foot -T "floating-fzf" -e $HOME/dotfiles/features/scripts/fzf/clipboard
        bind=SUPER+SHIFT,q,spawn,foot -T "floating-fzf" -e $HOME/dotfiles/features/scripts/fzf/logout

        # Windows
        bind=SUPER,j,focusstack,next
        bind=SUPER,k,focusstack,prev
        bind=SUPER+SHIFT,c,killclient

        # Move window
        bind=SUPER+SHIFT,j,exchange_stack_client,next
        bind=SUPER+SHIFT,k,exchange_stack_client,prev

        bind=SUPER,h,resizewin,-20,0
        bind=SUPER,l,resizewin,+20,0
        bind=SUPER+SHIFT,h,resizewin,0,-50
        bind=SUPER+SHIFT,l,resizewin,0,+50

        # Move and follow window
        bind=CTRL+SUPER,h,tagtoleft,0
        bind=CTRL+SUPER,l,tagtoright,0

        # Set as master
        bind=SUPER+SHIFT,BackSpace,zoom

        # Switch layout
        bind=SUPER,n,switch_layout
        # Reset layout
        bind=SUPER+SHIFT,Escape,setlayout,tile

        # Floating and Fullscreen
        bind=SUPER+SHIFT,space,togglefloating
        bind=SUPER,m,togglefullscreen

        # Mouse binds
        mousebind=SUPER,btn_left,moveresize,curmove
        mousebind=SUPER,btn_right,moveresize,curresize

        # Volume, audio, brightness
        bind=NONE,XF86AudioRaiseVolume,spawn_shell,wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && osd_volumen
        bind=NONE,XF86AudioLowerVolume,spawn_shell,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && osd_volumen
        bind=NONE,XF86AudioMute,spawn_shell,wpctl set-mute @DEFAULT_SINK@ toggle && osd_volumen
        bind=NONE,XF86AudioNext,spawn_shell,playerctl next
        bind=NONE,XF86AudioPause,spawn_shell,playerctl play-pause
        bind=NONE,XF86AudioPlay,spawn_shell,playerctl play-pause
        bind=NONE,XF86AudioPrev,spawn_shell,playerctl previous
        bind=NONE,XF86MonBrightnessUp,spawn_shell,brightnessctl set 5%+ && osd_brightness
        bind=NONE,XF86MonBrightnessDown,spawn_shell,brightnessctl -n1 set 5%- && osd_brightness

        # Tags
        bind=SUPER,1,spawn_shell,~/dotfiles/features/scripts/mango/smart_tags 1
        bind=SUPER,2,spawn_shell,~/dotfiles/features/scripts/mango/smart_tags 2
        bind=SUPER,3,spawn_shell,~/dotfiles/features/scripts/mango/smart_tags 3
        bind=SUPER,4,spawn_shell,~/dotfiles/features/scripts/mango/smart_tags 4
        bind=SUPER,5,spawn_shell,~/dotfiles/features/scripts/mango/smart_tags 5
        bind=SUPER,6,spawn_shell,~/dotfiles/features/scripts/mango/smart_tags 6
        bind=SUPER,7,spawn_shell,~/dotfiles/features/scripts/mango/smart_tags 7
        bind=SUPER,8,spawn_shell,~/dotfiles/features/scripts/mango/smart_tags 8
        bind=SUPER,9,spawn_shell,~/dotfiles/features/scripts/mango/smart_tags 9

        bind=SUPER+SHIFT,1,spawn_shell,~/dotfiles/features/scripts/mango/smart_move_tag 1
        bind=SUPER+SHIFT,2,spawn_shell,~/dotfiles/features/scripts/mango/smart_move_tag 2
        bind=SUPER+SHIFT,3,spawn_shell,~/dotfiles/features/scripts/mango/smart_move_tag 3
        bind=SUPER+SHIFT,4,spawn_shell,~/dotfiles/features/scripts/mango/smart_move_tag 4
        bind=SUPER+SHIFT,5,spawn_shell,~/dotfiles/features/scripts/mango/smart_move_tag 5
        bind=SUPER+SHIFT,6,spawn_shell,~/dotfiles/features/scripts/mango/smart_move_tag 6
        bind=SUPER+SHIFT,7,spawn_shell,~/dotfiles/features/scripts/mango/smart_move_tag 7
        bind=SUPER+SHIFT,8,spawn_shell,~/dotfiles/features/scripts/mango/smart_move_tag 8
        bind=SUPER+SHIFT,9,spawn_shell,~/dotfiles/features/scripts/mango/smart_move_tag 9
      '';

      # extraConfig = lib.mkMerge [
      #     (lib.mkIf (config.features.gaming.tweaks) ''
      #     allow_tearing=1
      #     syncobj_enable=1
      #     windowrule=force_tearing:1,title:Overwatch.exe
      # '')
      #
      #     (lib.mkIf (hostname == "desktop") ''
      #     monitorrule=name:HDMI-A-1,width:1360,height:768,refresh:60,x:0,y:0,scale:1
      #     monitorrule=name:DP-1,width:1920,height:1080,refresh:60,x:1360,y:0,scale:1
      #     windowrule=tags:9,appid:spotify
      #     '')
      # ];
    };
  };
}
