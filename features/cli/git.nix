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
                                        command = "pick_commit \"{{.Form.Type}}\"";
                                    }
                                ];
                                command = "git commit -m \"{{.Form.CommitMsg}}\"";
                                loadingText = "Generating commit messages...";
                            }
                        ];
                    })
                ];
            };
        })
    ];
}
