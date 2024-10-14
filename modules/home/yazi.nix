{ ... }:

{
    programs.yazi = {
        enable = true;
        theme = {
            manager = {
                cwd = {
                    fg = "red";
                };


                hovered = {
                    fg = "green";
                    bg = "#3d484d";
                };
                preview_hovered = {
                    underline = true;
                };


                find_keyword  = {
                    fg = "black";
                    bg = "red";
                };
                find_position = {
                    fg = "black";
                    bg = "red";
                };


                marker_selected = {
                    fg = "green";
                    bg = "green";
                };
                marker_copied   = {
                    fg = "red";
                    bg = "red";
                };
                marker_cut      = {
                    fg = "blue";
                    bg = "blue";
                };


                tab_active   = {
                    fg = "black";
                    bg = "green";
                };

                tab_inactive = {
                    fg = "white";
                    bg = "#343f44";
                };
                tab_width = 1;

                border_symbol = "│";
                border_style  = {
                    fg = "#687d68";
                };
            };

            status = {
                separator_open  = "";
                separator_close = "";
                separator_style = {
                    fg = "#475258";
                    bg = "#475258";
                };

                mode_normal = {
                    fg = "black";
                    bg = "green";
                    bold = true;
                };
                mode_select = {
                    fg = "black";
                    bg = "red";
                    bold = true;
                };
                mode_unset  = {
                    fg = "black";
                    bg = "white";
                    bold = true;
                };

                progress_label  = {
                    fg = "black";
                    bg = "green";
                    bold = true;
                };
                progress_normal = {
                    fg = "black";
                    bg = "green";
                };
                progress_error  = {
                    fg = "black";
                    bg = "red";
                };

                permissions_t = {
                    fg = "white";
                };
                permissions_r = {
                    fg = "white";
                };
                permissions_w = {
                    fg = "red";
                };
                permissions_x = {
                    fg = "green";
                };
                permissions_s = {
                    fg = "#687d68";
                };


            };

            inputs = {
                border   = {
                    fg = "white";
                };
                title    = {};
                value    = {};
                selected = {
                    reversed = true;
                };

            };


            select = {
                border   = {
                    fg = "white";
                };
                active   = {
                    fg = "red";
                };
                inactive = {};

            };

            tasks = {
                border  = {
                    fg = "white";
                };
                title   = {};
                hovered = {
                    underline = true;
                };

            };

            which = {
                mask            = {
                    bg = "black";
                };
                cand            = {
                    fg = "green";
                };
                rest            = {
                    fg = "white";
                };
                desc            = {
                    fg = "red";
                };
                separator       = "  ";
                separator_style = {
                    fg = "#475258";
                };

            };

            help = {
                on      = {
                    fg = "red";
                };
                exec    = {
                    fg = "green";
                };
                desc    = {
                    fg = "white";
                };
                hovered = {
                    bg = "black";
                    bold = true;
                };
                footer  = {
                    fg = "black";
                    bg = "white";
                };

            };


            filetype = {
                rules = [
                    { mime = "image/*"; fg = "cyan"; }

                    # Videos
                    { mime = "video/*"; fg = "yellow"; }
                    { mime = "audio/*"; fg = "yellow"; }

                    # Archives
                    { mime = "application/zip";             fg = "red"; }
                    { mime = "application/gzip";            fg = "red"; }
                    { mime = "application/x-tar";           fg = "red"; }
                    { mime = "application/x-bzip";          fg = "red"; }
                    { mime = "application/x-bzip2";         fg = "red"; }
                    { mime = "application/x-7z-compressed"; fg = "red"; }
                    { mime = "application/x-rar";           fg = "red"; }

                    # Fallback
                    { name = "*"; fg = "white"; }
                    { name = "*/"; fg = "blue"; }
                ];
            };
        };

        settings = {
            manager = {
                ratio = [
                    1 3 4
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
