{...}: {
    features = {
        gui = {
            affinity = false;
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
                default = "helium";
                zen = true;
                brave = false;
                helium = true;
            };
            fileManager = {
                default = "thunar";
                thunar = true;
            };
        };

        cli = {
            aichat = true;
            bat = true;
            btop = true;
            bun = false;
            delta = true;
            devPackages = true;
            direnv = true;
            fzf = true;
            git = true;
            lazygit = true;
            nvim = true;
            packages = true;
            ssh = true;
            starship = true;
            tmux = true;
            zsh = true;
        };

        wm = {
            hyprland = false;
            mango = true;
            packages = true;
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
            powerManagement = {
                auto-cpufreq = true;
                batteryLimit = true;
            };
            zram = {
                enable = true;
                percent = 100;
            };
        };
    };
}
