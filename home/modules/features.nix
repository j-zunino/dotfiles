{lib, ...}: {
    options.features = {
        gui = {
            browser = {
                zen = lib.mkEnableOption "Zen browser";
                brave = lib.mkEnableOption "Brave browser";
            };
        };
    };
}
