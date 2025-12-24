{lib, ...}: {
    options.features = {
        gui = {
            notifications = lib.mkEnableOption "Notification daemon";
            browser = {
                zen = lib.mkEnableOption "Zen browser";
                brave = lib.mkEnableOption "Brave browser";
            };
        };
        cli = {
            btop = lib.mkEnableOption "Btop";
            fzf = lib.mkEnableOption "Fuzzy finder";
        };
        dev = {
            aichat = lib.mkEnableOption "AiChat";
        };
    };
}
