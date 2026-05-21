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
                    "$nodejs"
                    "$nix_shell"
                    "$cmd_duration"
                    "$line_break"
                    "$character"
                ];

                fill = {symbol = " ";};

                directory = {
                    format = "[󰉋 $path]($style)[$read_only]($read_only_style) ";
                    style = "bold red";
                    read_only = "";
                    truncate_to_repo = false;
                    truncation_symbol = "…/";
                };

                git_branch = {
                    format = "[$symbol $branch(:$remote_branch)]($style) ";
                    symbol = "";
                    style = "yellow";
                };

                git_status = {
                    format = "[$ahead_behind$all_status]($style)";

                    diverged = "↕ ";
                    ahead = "[↑($count)](blue) ";
                    behind = "[↓($count)](purple) ";
                    conflicted = "[!!($count)](bold red) ";
                    untracked = "[??($count)](bold red) ";
                    staged = "[+($count)](green) ";
                    modified = "[*($count)](yellow) ";
                    renamed = "[>($count)](yellow) ";
                    deleted = "[X($count)](bold red) ";
                    stashed = "";
                };

                hostname = {
                    ssh_only = true;
                    ssh_symbol = "󰘊 ";
                    format = "[$ssh_symbol]($style) ";
                    style = "bright-black";
                };

                nodejs = {
                    format = "[$symbol($version)]($style) ";
                };

                nix_shell = {
                    symbol = " ";
                    pure_msg = "";
                    impure_msg = "*";
                    format = "[$symbol$state]($style) ";
                };

                cmd_duration = {
                    format = "[$duration]($style)";
                    style = "bright-black";
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
