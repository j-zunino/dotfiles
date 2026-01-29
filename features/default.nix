{
    lib,
    config,
    ...
}: {
    options.features = {
        gui = {
            launcher = lib.mkEnableOption "App launcher";
            multimedia = lib.mkEnableOption "Multimedia support";
            notifications = lib.mkEnableOption "Notification daemon";
            packages = lib.mkEnableOption "GUI packages that do not require extra configuration";
            spotify = lib.mkEnableOption "Spotify client";
            terminal = {
                default = lib.mkOption {default = "foot";};
                foot = lib.mkEnableOption "Foot terminal emulator";
                wezterm = lib.mkEnableOption "WezTerm terminal emulator";
            };
            browser = {
                default = lib.mkOption {default = "zen";};
                zen = lib.mkEnableOption "Zen browser";
                brave = lib.mkEnableOption "Brave browser";
            };
        };

        cli = {
            aichat = lib.mkEnableOption "AI chat";
            bat = lib.mkEnableOption "cat(1) clone with wings";
            btop = lib.mkEnableOption "Btop system monitor";
            bun = lib.mkEnableOption "Bun JS runtime, bundler, and package manager";
            delta = lib.mkEnableOption "Git diff pager";
            devPackages = lib.mkEnableOption "Developer tools";
            fzf = lib.mkEnableOption "Fuzzy finder";
            git = lib.mkEnableOption "Git version control system";
            lazygit = lib.mkEnableOption "Git TUI client";
            nvim = lib.mkEnableOption "Text editor";
            packages = lib.mkEnableOption "CLI packages that do not require configuration";
            ssh = lib.mkEnableOption "SSH";
            starship = lib.mkEnableOption "Shell prompt";
            tmux = lib.mkEnableOption "Terminal multiplexer";
            zsh = lib.mkEnableOption "Shell";
        };

        wm = {
            hyprland = lib.mkEnableOption "Wayland window manager";
            mango = lib.mkEnableOption "Wayland window manager";
            waybar = lib.mkEnableOption "Status bar";
        };

        gaming = {
            emulation = lib.mkEnableOption "Console emulation";
            heroic = lib.mkEnableOption "Heroic Games Launcher";
            minecraft = lib.mkEnableOption "Minecraft launcher";
            openFirewall = lib.mkEnableOption "Open firewall ports (steam)";
            packages = lib.mkEnableOption "Gaming-related packages";
            proton = lib.mkEnableOption "Proton compatibility tools";
            steam = lib.mkEnableOption "Steam";
            tweaks = lib.mkEnableOption "System tweaks for maximum gaming performance";
        };

        hardware = {
            audio = lib.mkEnableOption "Audio support";
            bluetooth = lib.mkEnableOption "Bluetooth support";
            driveMounting = lib.mkEnableOption "Automatic mounting of removable drives";
            dualboot = lib.mkEnableOption "Dual-boot configuration";
            ethernet = lib.mkEnableOption "Wired network support";
            greetd = lib.mkEnableOption "Greetd";
            nvidia = lib.mkEnableOption "NVIDIA GPU support";
            wifi = lib.mkEnableOption "Wireless network support";
        };
    };

    config.assertions = [
        {
            assertion = let
                t = config.features.gui.terminal;
            in
                (t.default == "foot" && t.foot) || (t.default == "wezterm" && t.wezterm);
            message = "The selected default terminal must be enabled.";
        }
        {
            assertion = let
                b = config.features.gui.browser;
            in
                (b.default == "zen" && b.zen) || (b.default == "brave" && b.brave);
            message = "The selected default browser must be enabled.";
        }
    ];
}
