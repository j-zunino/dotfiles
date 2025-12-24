{
    lib,
    config,
    ...
}: {
    confi = lib.mkMerge [
        (lib.mkIf config.features.dev.git {
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
        (lib.mkIf config.features.dev.delta {
            programs.delta = {
                enable = true;
                enableGitIntegration = true;
                options = {
                    dark = true;
                    tabs = 4;
                };
            };
        })
        (lib.mkIf config.features.dev.lazygit {
            programs.lazygit = {
                enable = true;

                settings = lib.mkMerge [
                    {
                        gui = {
                            showIcons = true;
                            border = "single";
                            nerdFontsVersion = "3";
                        };
                    }

                    (lib.mkIf config.features.dev.delta {
                        git.pagers = [
                            {pager = "delta --dark --paging=never";}
                        ];
                    })

                    (lib.mkIf config.features.cli.aichat {
                        customCommands = [
                            {
                                key = "<c-a>";
                                description = "Pick AI commit";
                                command = ''
                                      bash -c '
                                        prompt="$(
                                          cat <<EOF
                                    Suggest 10 commit messages based on the following diff:
                                    --- START DIFF ---
                                    $(git diff --cached)
                                    --- END DIFF ---

                                    Rules:
                                    1. Format: <type>(<scope>): <description> — using Conventional Commits.
                                    2. Type must be one of: feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert.
                                    3. Focus on purpose and impact.
                                    4. Each message must be <70 characters.
                                    5. Each message must cover / describe a different perspective,
                                       aspect or benefit.
                                    6. Easily understood by someone unfamiliar with the codebase.

                                    Recent commits:
                                    --- START RECENT COMMITS ---
                                    $(git log -n 15 --pretty=format:"%h %s")
                                    --- END RECENT COMMITS ---

                                    Goal:
                                    Provide a wide range of expressive, valid, and relevant commit messages. The user will pick only ONE to use.

                                    Output format:
                                    Only the raw commit messages, one per line. No numbers, decorations, or extra explanations.

                                    Instructions:
                                    Abstract the changes to a higher level and write 10 distinct commit messages from different angles.
                                    EOF
                                        )"

                                        selected_message=$(aichat "$prompt" \
                                          | fzf)

                                        if [ -n "$selected_message" ]; then
                                          COMMIT_MSG_FILE=$(mktemp)
                                          echo "$selected_message" > "$COMMIT_MSG_FILE"
                                          nvim "$COMMIT_MSG_FILE"
                                          if [ -s "$COMMIT_MSG_FILE" ]; then
                                            git commit -F "$COMMIT_MSG_FILE"
                                          else
                                            echo "Commit message is empty, commit aborted."
                                          fi
                                          rm -f "$COMMIT_MSG_FILE"
                                        else
                                          echo "No message selected, commit aborted."
                                        fi
                                      '
                                '';
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
