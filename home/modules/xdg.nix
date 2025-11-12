{...}: {
    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "video/mp4" = ["mpv.desktop"];
            "video/x-matroska" = ["mpv.desktop"];
            "video/webm" = ["mpv.desktop"];
            "audio/mpeg" = ["mpv.desktop"];
            "audio/flac" = ["mpv.desktop"];
            "audio/ogg" = ["mpv.desktop"];
            "audio/wav" = ["mpv.desktop"];

            "x-scheme-handler/http" = ["zen.desktop"];
            "x-scheme-handler/https" = ["zen.desktop"];
            "x-scheme-handler/chrome" = ["zen.desktop"];
            "text/html" = ["zen.desktop"];
            "application/x-extension-htm" = ["zen.desktop"];
            "application/x-extension-html" = ["zen.desktop"];
            "application/x-extension-shtml" = ["zen.desktop"];
            "application/xhtml+xml" = ["zen.desktop"];
            "application/x-extension-xhtml" = ["zen.desktop"];
            "application/x-extension-xht" = ["zen.desktop"];
        };
    };
}
