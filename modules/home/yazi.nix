{ config, pkgs, ... }:

{
    programs.yazi = {
        enable = true;

        settings = {
            manager = {
                layout = [
                    1
                    3
                    4
                ];

                sort_by = "natural";
                sort_sensitive = true;
                sort_reverse = false;
                sort_dir_first = true;
                linemode = "none";
                show_hidden = true;
                show_symlink = true;
                scrolloff = 5;
            };

            preview = {
                image_filter = "lanczos3";
                image_quality = 90;
                tab_size = 1;
                max_width = 600;
                max_height = 900;
                cache_dir = "";
                ueberzug_scale = 1;
                ueberzug_offset = [
                    0
                    0
                    0
                    0
                ];
            };
        };
    };
}
