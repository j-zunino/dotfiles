{inputs, ...}: {
    home.packages = [
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
            minecraft = true;
            tweaks = true;
            heroic = true;
            packages = true;
            steam = true;
            openFirewall = false;
            proton = true;
        };

        hardware = {
            driveMounting = true;
            audio = true;
            bluetooth = false;
            dualboot = true;
            greetd = true;
            ethernet = true;
            wifi = false;
            nvidia = true;
        };
    };
}
