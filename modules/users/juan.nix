{
    lib,
    self,
    ...
}: {
    flake.modules = lib.mkMerge [
        (self.factory.user {
            name = "juan";
            groups = ["networkmanager" "wheel"];
        })
        {
            nixos."users-juan" = {
                users.users.juan.initialPassword = "password";
            };

            homeManager."users-juan" = {config, ...}: {
                news.display = "silent";

                home.sessionVariables = {
                    EDITOR = "nvim";
                    BROWSER = "zen";
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
    ];
}
