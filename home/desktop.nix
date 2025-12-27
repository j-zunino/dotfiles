{
    pkgs,
    inputs,
    ...
}: {
    home.packages = with pkgs; [
        prismlauncher
        inputs.affinity-nix.packages.x86_64-linux.v3
    ];

    features = {
        gui = {
            launcher = true;
            multimedia = true;
            notifications = true;
            packages = true;
            spotify = true;
            terminal = {
                wezterm = true;
            };
            browser = {
                zen = true;
                brave = false;
            };
        };

        cli = {
            aichat = true;
            btop = true;
            bun = true;
            delta = true;
            dev-packages = true;
            fzf = true;
            git = true;
            lazygit = true;
            nvim = true;
            packages = true;
            ssh = true;
            tmux = true;
            zsh = true;
        };

        wm = {
            hyprland = true;
            waybar = true;
        };

        gaming = {
            tweaks = true;
            emulation = false;
        };
    };
}
