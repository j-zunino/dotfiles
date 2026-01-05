{inputs, ...}: {
    # home.packages = [
    #     inputs.affinity-nix.packages.x86_64-linux.v3
    # ];

    features = {
        gui = {
            launcher = true;
            multimedia = true;
            notifications = true;
            packages = true;
            spotify = true;
            terminal = {
                default = "foot";
                foot = true;
                wezterm = true;
            };
            browser = {
                default = "zen";
                zen = true;
                brave = true;
            };
        };

        cli = {
            aichat = true;
            bat = true;
            btop = true;
            bun = false;
            delta = true;
            devPackages = true;
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
            emulation = false;
            heroic = true;
            minecraft = true;
            openFirewall = false;
            packages = true;
            proton = true;
            steam = true;
            tweaks = true;
        };

        hardware = {
            audio = true;
            bluetooth = false;
            driveMounting = true;
            dualboot = true;
            ethernet = true;
            greetd = true;
            nvidia = true;
            wifi = false;
        };
    };
}
