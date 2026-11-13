{...}: {
    flake.modules.nixos.users-juan = {pkgs, ...}: {
        users.users.juan = {
            isNormalUser = true;
            extraGroups = ["networkmanager" "wheel"];
            initialPassword = "password";
            shell = pkgs.zsh;
        };
    };

    flake.modules.homeManager.users-juan = {
        news.display = "silent";

        home = {
            username = "juan";
            homeDirectory = "/home/juan";
            stateVersion = "24.05";

            sessionVariables = {
                EDITOR = "nvim";
                BROWSER = "zen";
            };
        };

        xdg.mimeApps = {
            enable = true;
            defaultApplications = {
                "x-scheme-handler/http" = "zen.desktop";
                "x-scheme-handler/https" = "zen.desktop";
                "text/html" = "zen.desktop";
                "application/xhtml+xml" = "zen.desktop";
            };
        };
    };
}
