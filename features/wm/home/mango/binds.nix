{config, ...}: {
    wayland.windowManager.mango.settings = ''
        bind=SUPER+SHIFT,r,reload_config

        # Toggle waybar
        bind=SUPER,b,spawn_shell,pkill -SIGUSR1 waybar

        bind=SUPER,q,spawn,${config.features.gui.terminal.default}
        bind=SUPER+SHIFT,Return,spawn,${config.features.gui.terminal.default}
        bind=SUPER,f,spawn,${config.features.gui.browser.default}
        bind=SUPER,e,spawn,nautilus
        bind=SUPER+SHIFT,s,spawn_shell,hyprshot -m region --c
        bind=SUPER,c,spawn_shell,hyprpicker -a

        # Open menu
        bind=SUPER,p,spawn,rofi -show drun
        bind=SUPER,d,spawn,rofi -show drun
        bind=SUPER+SHIFT,q,spawn_shell,rofi_logout
        bind=SUPER,v,spawn_shell,rofi_clipboard

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
        bind=NONE,XF86AudioNext,spawn_shell,playerctl next"
        bind=NONE,XF86AudioPause,spawn_shell,playerctl play-pause"
        bind=NONE,XF86AudioPlay,spawn_shell,playerctl play-pause"
        bind=NONE,XF86AudioPrev,spawn_shell,playerctl previous"
        bind=NONE,XF86MonBrightnessUp,spawn_shell,brightnessctl set 5%+ && osd_brightness
        bind=NONE,XF86MonBrightnessDown,spawn_shell,brightnessctl -n1 set 5%- && osd_brightness

        # Tags
        bind=SUPER,1,view,1,0
        bind=SUPER,2,view,2,0
        bind=SUPER,3,view,3,0
        bind=SUPER,4,view,4,0
        bind=SUPER,5,view,5,0
        bind=SUPER,6,view,6,0
        bind=SUPER,7,view,7,0
        bind=SUPER,8,view,8,0
        bind=SUPER,9,view,9,0
        bind=SUPER+SHIFT,1,tagsilent,1,0
        bind=SUPER+SHIFT,2,tagsilent,2,0
        bind=SUPER+SHIFT,3,tagsilent,3,0
        bind=SUPER+SHIFT,4,tagsilent,4,0
        bind=SUPER+SHIFT,5,tagsilent,5,0
        bind=SUPER+SHIFT,6,tagsilent,6,0
        bind=SUPER+SHIFT,7,tagsilent,7,0
        bind=SUPER+SHIFT,8,tagsilent,8,0
        bind=SUPER+SHIFT,9,tagsilent,9,0

        tagrule=id:1,layout_name:tile
        tagrule=id:2,layout_name:tile
        tagrule=id:3,layout_name:tile
        tagrule=id:4,layout_name:tile
        tagrule=id:5,layout_name:tile
        tagrule=id:6,layout_name:tile
        tagrule=id:7,layout_name:tile
        tagrule=id:8,layout_name:tile
        tagrule=id:9,layout_name:tile
    '';
}
