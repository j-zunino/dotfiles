{pkgs, ...}: {
    imports = [
        ./autostart.nix
        ./binds.nix
        ./look.nix
        ./input.nix
        ./envs.nix
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

    wayland.windowManager.hyprland.enable = true;
}
