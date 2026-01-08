{...}: {
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
                wezterm = false;
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
            heroic = false;
            minecraft = false;
            openFirewall = false;
            packages = false;
            proton = false;
            steam = false;
            tweaks = false;
        };

        hardware = {
            audio = true;
            bluetooth = true;
            driveMounting = true;
            dualboot = false;
            ethernet = false;
            greetd = true;
            nvidia = false;
            wifi = true;
        };
    };
}
