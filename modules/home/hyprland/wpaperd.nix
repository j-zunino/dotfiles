{ ... }:

{
    programs = {
        wpaperd = {
            enable = true;
            settings = {
                any = {
                    path = "/home/juan/dotfiles/modules/home/hyprland/wallpapers";
                    duration = "30m";
                };
            };
        };
    };
}
