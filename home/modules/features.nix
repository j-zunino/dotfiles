{lib, ...}: {
    options.features = {
        gui = {
            spotify = lib.mkEnableOption "Spotify";
            launcher = lib.mkEnableOption "Rofi";
            notifications = lib.mkEnableOption "Notification daemon";
            browser = {
                zen = lib.mkEnableOption "Zen browser";
                brave = lib.mkEnableOption "Brave browser";
            };
        };
        cli = {
            btop = lib.mkEnableOption "Btop";
            fzf = lib.mkEnableOption "Fuzzy finder";
            ssh = lib.mkEnableOption "SSH";
            zsh = lib.mkEnableOption "Zsh shell";
        };
        dev = {
            aichat = lib.mkEnableOption "AiChat";
            git = lib.mkEnableOption "Git";
            delta = lib.mkEnableOption "Git pager";
            lazygit = lib.mkEnableOption "Lazygit";
            dev-pkgs = lib.mkEnableOption "LSPs, formatters, linters and other";
            tmux = lib.mkEnableOption "Terminal multiplexer";
        };
    };
}
