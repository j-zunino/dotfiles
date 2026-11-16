{inputs, ...}: {
    flake.modules.nixos.users-juan = {pkgs, ...}: {
        users.users.juan = {
            isNormalUser = true;
            extraGroups = ["networkmanager" "wheel"];
            initialPassword = "password";
            shell = pkgs.zsh;
        };
    };

    flake.modules.homeManager.users-juan = {config, ...}: {
        imports = [inputs.self.modules.homeManager.identity];

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

        xdg = {
            userDirs = {
                enable = true;
                createDirectories = true;
                desktop = "${config.home.homeDirectory}";
                documents = "${config.home.homeDirectory}/media/documents";
                download = "${config.home.homeDirectory}/downloads";
                projects = "${config.home.homeDirectory}/workspace";
                music = "${config.home.homeDirectory}/media/music";
                pictures = "${config.home.homeDirectory}/media/pictures";
                videos = "${config.home.homeDirectory}/media/videos";
                publicShare = "${config.home.homeDirectory}/media/pubic";
                templates = "${config.home.homeDirectory}/media/templates";
            };

            mimeApps = {
                enable = true;
                defaultApplications = {
                    "x-scheme-handler/http" = "zen.desktop";
                    "x-scheme-handler/https" = "zen.desktop";
                    "text/html" = "zen.desktop";
                    "application/xhtml+xml" = "zen.desktop";
                };
            };
        };
    };
}
