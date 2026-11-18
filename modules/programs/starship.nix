{...}: {
    flake.modules.homeManager.starship = {lib, ...}: {
        programs.starship = {
            enable = true;
            settings = {
                add_newline = true;
                format = lib.concatStrings [
                    "$directory"
                    "$git_branch"
                    "$git_status"
                    "$hostname"
                    "$fill"
                    "$nix_shell"
                    "$line_break"
                    "$character"
                ];

                fill = {symbol = " ";};

                directory = {
                    format = "[$path]($style) ";
                    style = "bold green";
                    truncate_to_repo = false;
                    truncation_symbol = "…/";
                };

                git_branch = {
                    format = "[$branch(:$remote_branch)]($style)";
                    style = "bright-black";
                };

                git_status = {
                    format = "[$ahead_behind$all_status]($style)";

                    diverged = "[↕](bright-black)";
                    ahead = "[↑](bright-black)";
                    behind = "[↓](bright-black)";
                    modified = "[*](bright-black)";
                    staged = "[+](bright-black)";
                    conflicted = "[!!](bold bright-black)";
                    untracked = "[??](bold bright-black)";
                    renamed = "";
                    deleted = "";
                    stashed = "";
                };

                hostname = {
                    ssh_only = true;
                    ssh_symbol = "";
                    format = "[$ssh_symbol]($style) ";
                    style = "bright-black";
                };

                nix_shell = {
                    symbol = " ";
                    pure_msg = "";
                    impure_msg = "*";
                    format = "[$symbol$state]($style) ";
                };

                character = {
                    success_symbol = "[>](bold green)";
                    error_symbol = "[>](bold red)";
                    vimcmd_symbol = "[■](bright-black)";
                };
            };
        };
    };

    flake.modules.homeManager.zsh = {
        programs.starship.enableZshIntegration = true;
    };
}
