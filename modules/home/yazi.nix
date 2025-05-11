{...}: {
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        ratio = [
          2
          3
          4
        ];

        sort_by = "natural";
        sort_dir_first = true;
        linemode = "mtime";
        show_hidden = true;
        show_symlink = true;
        scrolloff = 5;
      };

      preview = {
        wrap = "yes";
        tab_size = 4;

        max_width = 600;
        max_height = 900;
        image_filter = "catmull-rom";
        image_quality = 80;
      };
    };

    theme = {
      manager = {
        preview_hovered = {
          underline = false;
        };
        tab_width = 4;
      };

      status = {
        sep_left = {
          open = "";
          close = "";
        };
        sep_right = {
          open = "";
          close = "";
        };

        mode_normal = {
          bold = true;
        };
        mode_select = {
          bold = true;
        };
        mode_unset = {
          bold = true;
        };
        progress_label = {
          bold = true;
        };
      };

      inputs = {
        title = {};
        value = {};
        selected = {
          reversed = true;
        };
      };

      select = {
        inactive = {};
      };

      tasks = {
        title = {};
        hovered = {
          underline = true;
        };
      };

      which = {
        separator = "  ";
      };

      help = {
        hovered = {
          bold = true;
        };
      };
    };
  };
}
