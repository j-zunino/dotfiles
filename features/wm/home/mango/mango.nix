{
  lib,
  config,
  inputs,
  hostname,
  ...
}: {
  imports = [
    inputs.mango.hmModules.mango
    ./autostart.nix
    ./binds.nix
    ./look.nix
  ];

  config = lib.mkIf config.features.wm.mango {
    wayland.windowManager.mango = {
      enable = true;
      settings = ''
        new_is_master=0
        circle_layout=tile,scroller,vertical_scroller

        repeat_rate=40
        repeat_delay=300
        xkb_rules_layout=latam
        xkb_rules_options=caps:escape

        accel_profile=0
        warpcursor=0
        drag_corner=4
        drag_warp_cursor=0
        drag_tile_to_tile=1

        windowrule=isfloating:1,width:1200,height:900,title:^floating$
        windowrule=isfloating:1,width:600,height:600,title:^floating-fzf$
      '';

      extraConfig = lib.mkMerge [
        (lib.mkIf (config.features.gaming.tweaks) ''
          allow_tearing=1
          syncobj_enable=1
          windowrule=force_tearing:1,title:Overwatch.exe
        '')

        (lib.mkIf (hostname == "desktop") ''
          monitorrule=name:HDMI-A-1,width:1360,height:768,refresh:60,x:0,y:0,scale:1
          monitorrule=name:DP-1,width:1920,height:1080,refresh:60,x:1360,y:0,scale:1
        '')
      ];
    };
  };
}
