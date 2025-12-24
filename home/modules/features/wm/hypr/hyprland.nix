{
    lib,
    pkgs,
    config,
    hostname,
    ...
}: {
    config = lib.mkIf config.features.wm.hyprland {
        imports = [
            ./autostart.nix
            ./windows.nix
            ./binds.nix
            ./input.nix
            ./look.nix
            ./envs.nix
            ./wpaperd.nix
            ./hypridle.nix
        ];

        home = {
            pointerCursor.hyprcursor.enable = true;
            packages = with pkgs; [
                hyprpicker
                hyprshot
                wl-clipboard
                cliphist
            ];
        };

        wayland.windowManager.hyprland = {
            enable = true;
            settings = {
                monitor =
                    lib.optionals (hostname == "desktop") [
                        "DP-1,1920x1080@60.00,0x0,1"
                        "HDMI-A-1,1920x1080@60.00,-1920x0,1"
                        # "HDMI-A-1,1920x1080@60.00,auto-left,1"
                    ]
                    ++ [", preferred, auto, 1"];

                workspace = lib.optionals (hostname == "desktop") [
                    "1, monitor:DP-1, default:true"
                    "4, monitor:HDMI-A-1, default:true"
                ];

                windowrulev2 = [
                    "float, class:^(floating)$"
                ];
            };
        };
    };
}
