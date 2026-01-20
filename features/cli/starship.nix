{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.cli.starship {
        programs.starship = {
            enable = true;
            enableZshIntegration = true;
            settings = {
                add_newline = true;
                format = lib.concatStrings [
                    "$directory"
                    "$git_branch"
                    "$git_status"
                    "$fill"
                    "$nodejs"
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
                    style = "bold yellow";
                };

                git_status = {
                    format = "[$ahead_behind$all_status]($style) ";

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

                nodejs = {
                    format = "[$symbol($version)]($style) ";
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
}
