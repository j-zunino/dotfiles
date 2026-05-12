{...}: {
    flake.modules.homeManager.git = {
        programs.git = {
            enable = true;
            settings = {
                user = {
                    # TODO: Make dynamic
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
    };

    flake.modules.homeManager.delta = {
        programs.delta = {
            enable = true;
            enableGitIntegration = true;
            options = {
                dark = true;
                tabs = 4;
                line-numbers = true;
                file-decoration-style = "gray ul ol";
                file-style = "bold green";
                file-added-label = "[+]";
                file-copied-label = "[*]";
                file-modified-label = "[~]";
                file-removed-label = "[-]";
                file-renamed-label = "[>]";

                hunk-header-file-style = "bold green";
                hunk-header-decoration-style = "gray ul";
                hunk-header-line-number-style = "gray";

                line-numbers-left-format = "{nm:>1}┊";
                line-numbers-right-format = "{np:>2}│";
                line-numbers-zero-style = "gray";
                line-numbers-left-style = "gray";
                line-numbers-right-style = "gray bold";
                line-numbers-minus-style = "red bold";
                line-numbers-plus-style = "green bold";
            };
        };

        programs.lazygit = {
            settings = {
                git.pagers = [
                    {pager = "delta --dark --paging=never";}
                ];
            };
        };
    };

    flake.modules.homeManager.lazygit = {
        programs.lazygit = {
            enable = true;
            settings = {
                gui = {
                    showIcons = true;
                    border = "single";
                    nerdFontsVersion = 3;
                    commitHashLength = 0;
                };
            };
        };
    };

    flake.modules.homeManager.stylix = {config, ...}: let
        colors = config.my.colors;
    in {
        programs.lazygit.settings.gui = {
            authorColors = {"*" = "${colors.gray1.hex}";};
            theme = {
                activeBorderColor = ["${colors.accent.hex}"];
                inactiveBorderColor = ["${colors.gray1.hex}"];
                searchingActiveBorderColor = ["${colors.purple.hex}"];
                optionsTextColor = ["${colors.fg.hex}"];
                selectedLineBgColor = ["${colors.bg1.hex}"];
                cherryPickedCommitFgColor = ["${colors.red.hex}"];
                cherryPickedCommitBgColor = ["${colors.bg0.hex}"];
                defaultFgColor = ["${colors.fg.hex}"];
            };
        };
    };
}
