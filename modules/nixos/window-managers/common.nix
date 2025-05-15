{pkgs, ...}: {
    services = {
        displayManager = {
            defaultSession = "hyprland";
        };
    };

    environment = {
        systemPackages = with pkgs; [
            brightnessctl
            playerctl
        ];
    };
}
