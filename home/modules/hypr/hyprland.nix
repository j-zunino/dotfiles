{pkgs, ...}: {
    imports = [
        ./autostart.nix
        ./windows.nix
        ./binds.nix
        ./input.nix
        ./look.nix
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
