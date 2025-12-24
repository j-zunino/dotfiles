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

            (lib.mkIf config.features.gui.browser.brave {
                "x-scheme-handler/http" = ["brave.desktop"];
                "x-scheme-handler/https" = ["brave.desktop"];
                "x-scheme-handler/chrome" = ["brave.desktop"];
                "text/html" = ["brave.desktop"];
                "application/xhtml+xml" = ["brave.desktop"];
            })

            # Prefer zen as default browser if both are enabled
            (lib.mkIf config.features.gui.browser.zen {
                "x-scheme-handler/http" = ["zen.desktop"];
                "x-scheme-handler/https" = ["zen.desktop"];
                "x-scheme-handler/chrome" = ["zen.desktop"];
                "text/html" = ["zen.desktop"];
                "application/xhtml+xml" = ["zen.desktop"];
            })
        ];
    };
}
