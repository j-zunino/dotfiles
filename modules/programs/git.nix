{...}: {
    flake.modules.homeManager.git = {config, ...}: {
        programs.git = {
            enable = true;
            settings = {
                user = {
                    name = config.my.identity.name;
                    email = config.my.identity.email;
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
                file-added-label = "[+]";
                file-copied-label = "[*]";
                file-modified-label = "[~]";
                file-removed-label = "[-]";
                file-renamed-label = "[>]";
            };
        };

        programs.lazygit.settings.git.diffRenderers = [
            {command = "delta --{{colorScheme}} --paging=never";}
        ];
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
                customCommands = [
                    {
                        key = "<c-a>";
                        description = "Pick AI commit";
                        context = "global";
                        prompts = [
                            {
                                type = "menu";
                                key = "Type";
                                title = "Type of change";
                                options = [
                                    {
                                        name = "AI defined";
                                        description = "Let AI analyze and determine the best commit type";
                                        value = "ai-defined";
                                    }
                                    {
                                        name = "build";
                                        description = "Changes that affect the build system or external dependencies";
                                        value = "build";
                                    }
                                    {
                                        name = "feat";
                                        description = "A new feature";
                                        value = "feat";
                                    }
                                    {
                                        name = "fix";
                                        description = "A bug fix";
                                        value = "fix";
                                    }
                                    {
                                        name = "chore";
                                        description = "Other changes that don't modify src or test files";
                                        value = "chore";
                                    }
                                    {
                                        name = "ci";
                                        description = "Changes to CI configuration files and scripts";
                                        value = "ci";
                                    }
                                    {
                                        name = "docs";
                                        description = "Documentation only changes";
                                        value = "docs";
                                    }
                                    {
                                        name = "perf";
                                        description = "A code change that improves performance";
                                        value = "perf";
                                    }
                                    {
                                        name = "refactor";
                                        description = "A code change that neither fixes a bug nor adds a feature";
                                        value = "refactor";
                                    }
                                    {
                                        name = "revert";
                                        description = "Reverts a previous commit";
                                        value = "revert";
                                    }
                                    {
                                        name = "style";
                                        description = "Changes that do not affect the meaning of the code";
                                        value = "style";
                                    }
                                    {
                                        name = "test";
                                        description = "Adding missing tests or correcting existing tests";
                                        value = "test";
                                    }
                                ];
                            }
                            {
                                type = "menuFromCommand";
                                title = "Generated Commit Messages";
                                key = "CommitMsg";
                                command = "bash -c '$HOME/dotfiles/scripts/pick_commit \"{{.Form.Type}}\"'";
                            }
                        ];
                        output = "terminal";
                        command = "git commit -e -m \"{{.Form.CommitMsg}}\"";
                        loadingText = "Generating commit messages...";
                    }
                ];
            };
        };
    };

    flake.modules.homeManager.stylix = {config, ...}: let
        colors = config.my.colors;
    in {
        programs.lazygit.settings.gui = {
            theme = {
                authorColors = {"*" = "${colors.muted.hex}";};
                activeBorderColor = ["${colors.accent.hex}"];
                inactiveBorderColor = ["${colors.muted.hex}"];
                searchingActiveBorderColor = ["${colors.purple.hex}"];
                optionsTextColor = ["${colors.fg.hex}"];
                selectedLineBgColor = ["${colors.surface.hex}"];
                cherryPickedCommitFgColor = ["${colors.red.hex}"];
                cherryPickedCommitBgColor = ["${colors.bg.hex}"];
                defaultFgColor = ["${colors.fg.hex}"];
            };
        };

        programs.delta.options = {
            file-decoration-style = "${colors.muted.hex} ul ol";
            file-style = "bold ${colors.fg.hex}";

            hunk-header-file-style = "bold ${colors.fg.hex}";
            hunk-header-decoration-style = "${colors.muted.hex} ul";
            hunk-header-line-number-style = "${colors.muted.hex}";
        };
    };
}
