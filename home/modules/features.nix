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
            aichat = lib.mkEnableOption "Btop";
            btop = lib.mkEnableOption "Btop";
        };
    };
}
