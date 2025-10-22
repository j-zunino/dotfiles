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
        };
    };
}
