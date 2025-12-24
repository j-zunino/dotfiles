{
    hostname,
    lib,
    ...
}: {
    imports =
        [
            ./git.nix
            ./nvim.nix
            ./btop.nix
            ./zsh.nix
            ./scripts
            ../../nixos/stylix.nix
            ./aichat.nix
            ./ssh.nix
            ./fzf.nix
            ./tmux.nix
            ./stylix.nix
        ]
        ++ lib.optionals (hostname != "wsl") [
            ./spicetify.nix
            ./hypr
            ./wezterm.nix
            ./rofi.nix
            ./browser.nix
            ./notifications.nix
            ./mpv.nix
            ./xdg.nix
            ./drives.nix
        ];

    options.features = {
        gui = {
            launcher = lib.mkEnableOption "Rofi";
            multimedia = lib.mkEnableOption "Multimedia";
            notifications = lib.mkEnableOption "Notification daemon";
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
            delta = lib.mkEnableOption "Git pager";
            dev-pkgs = lib.mkEnableOption "LSPs, formatters, linters and other";
            fzf = lib.mkEnableOption "Fuzzy finder";
            git = lib.mkEnableOption "Git";
            lazygit = lib.mkEnableOption "Lazygit";
            nvim = lib.mkEnableOption "Neovim";
            ssh = lib.mkEnableOption "SSH";
            tmux = lib.mkEnableOption "Terminal multiplexer";
            zsh = lib.mkEnableOption "Zsh shell";
        };

        wm = {
            waybar = lib.mkEnableOption "Waybar";
            hyprland = lib.mkEnableOption "Hyprland window manager";
        };
    };
}
