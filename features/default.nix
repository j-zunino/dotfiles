{lib, ...}: {
    options.features = {
        gui = {
            launcher = lib.mkEnableOption "Rofi";
            multimedia = lib.mkEnableOption "Multimedia";
            notifications = lib.mkEnableOption "Notification daemon";
            packages = lib.mkEnableOption "Packages that doesn't need configuration";
            spotify = lib.mkEnableOption "Spotify";
            terminal = {
                wezterm = lib.mkEnableOption "Wezterm";
            };
            browser = {
                zen = lib.mkEnableOption "Zen browser";
                brave = lib.mkEnableOption "Brave browser";
            };
        };

        cli = {
            aichat = lib.mkEnableOption "AiChat";
            btop = lib.mkEnableOption "Btop";
            bun = lib.mkEnableOption "JS runtime, bundler, transpiler and package manager";
            delta = lib.mkEnableOption "Git pager";
            devPackages = lib.mkEnableOption "LSPs, formatters, linters and other";
            fzf = lib.mkEnableOption "Fuzzy finder";
            git = lib.mkEnableOption "Git";
            lazygit = lib.mkEnableOption "Lazygit";
            nvim = lib.mkEnableOption "Neovim";
            packages = lib.mkEnableOption "Packages that doesn't need configuration";
            ssh = lib.mkEnableOption "SSH";
            tmux = lib.mkEnableOption "Terminal multiplexer";
            zsh = lib.mkEnableOption "Zsh shell";
        };

        wm = {
            hyprland = lib.mkEnableOption "Hyprland window manager";
            waybar = lib.mkEnableOption "Waybar";
        };

        gaming = {
            emulation = lib.mkEnableOption "Emulation";
            minecraft = lib.mkEnableOption "Minecraft launcher";
            tweaks = lib.mkEnableOption "Settings necessary for max performance";
            heroic = lib.mkEnableOption "Epic games game launcher";
            packages = lib.mkEnableOption "";
            steam = lib.mkEnableOption "";
            openFirewall = lib.mkEnableOption "";
            proton = lib.mkEnableOption "";
        };

        hardware = {
            driveMounting = lib.mkEnableOption "";
            audio = lib.mkEnableOption "";
            bluetooth = lib.mkEnableOption "";
            dualboot = lib.mkEnableOption "";
            greetd = lib.mkEnableOption "";
            ethernet = lib.mkEnableOption "";
            wifi = lib.mkEnableOption "";
            nvidia = lib.mkEnableOption "";
        };
    };
}
