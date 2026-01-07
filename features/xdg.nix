{
    lib,
    config,
    ...
}: {
    xdg.mimeApps = {
        enable = true;
        defaultApplications = lib.mkMerge [
            (lib.mkIf config.features.gui.multimedia {
                "video/mp4" = ["mpv.desktop"];
                "video/x-matroska" = ["mpv.desktop"];
                "video/webm" = ["mpv.desktop"];
                "audio/mpeg" = ["mpv.desktop"];
                "audio/flac" = ["mpv.desktop"];
                "audio/ogg" = ["mpv.desktop"];
                "audio/wav" = ["mpv.desktop"];
            })

            (lib.mkIf (config.features.gui.terminal.default != null) {
                "x-terminal-exec" = ["${config.features.gui.terminal.default}.desktop"];
            })

            (lib.mkIf (config.features.gui.browser.default != null) {
                "x-scheme-handler/http" = ["${config.features.gui.browser.default}.desktop"];
                "x-scheme-handler/https" = ["${config.features.gui.browser.default}.desktop"];
                "x-scheme-handler/chrome" = ["${config.features.gui.browser.default}.desktop"];
                "text/html" = ["${config.features.gui.browser.default}.desktop"];
                "application/xhtml+xml" = ["${config.features.gui.browser.default}.desktop"];
            })
        ];
    };
}
