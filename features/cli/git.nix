{
    lib,
    config,
    ...
}: {
    config = lib.mkMerge [
        (lib.mkIf config.features.cli.git {
            programs.git = {
                enable = true;
                settings = {
                    user = {
                        name = "j-zunino";
                        email = "zuninojuanbautista@gmail.com";
                    };

                    init.defaultBranch = "main";

                    status = {
                        branch = true;
                        showStash = true;
                    };

                    diff = {
                        context = 3;
                        renames = "copies";
                        interHunkContext = 10;
                    };
                };
            };
        })
        (lib.mkIf config.features.cli.delta {
            programs.delta = {
                enable = true;
                enableGitIntegration = true;
                options = {
                    dark = true;
                    tabs = 4;
                };
            };
        })
        (lib.mkIf config.features.cli.lazygit {
            programs.lazygit = let
                colors = config.my.colors;
            in {
                enable = true;

                settings = lib.mkMerge [
                    {
                        gui = {
                            showIcons = true;
                            border = "single";
                            nerdFontsVersion = 3;
                            commitHashLength = 0;
                            authorColors = {"*" = "${colors.gray1-hex}";};
                            theme = {
                                activeBorderColor = ["${colors.accent-hex}"];
                                inactiveBorderColor = ["${colors.gray1-hex}"];
                                searchingActiveBorderColor = ["${colors.purple-hex}"];
                                optionsTextColor = ["${colors.fg-hex}"];
                                selectedLineBgColor = ["${colors.bg1-hex}"];
                                cherryPickedCommitFgColor = ["${colors.red-hex}"];
                                cherryPickedCommitBgColor = ["${colors.bg0-hex}"];
                                defaultFgColor = ["${colors.fg-hex}"];
                            };
                        };
                    }

                    (lib.mkIf config.features.cli.delta {
                        git.pagers = [
                            {pager = "delta --dark --paging=never";}
                        ];
                    })

                    (lib.mkIf config.features.cli.aichat {
                        customCommands = [
                            {
                                key = "<c-a>";
                                description = "Pick AI commit";
                                command = "pick_commit";
                                context = "files";
                                output = "terminal";
                            }
                        ];
                    })
                ];
            };
        })
    ];
}
