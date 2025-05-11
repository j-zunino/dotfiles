{lib, ...}: let
  hex = c: c;
  rgb = c: let
    r = builtins.substring 1 2 c;
    g = builtins.substring 3 2 c;
    b = builtins.substring 5 2 c;
    toDec = x: builtins.fromJSON "0x${x}";
  in "rgb(${toDec r}, ${toDec g}, ${toDec b})";

  base00 = "#2d353b";
  base01 = "#343f44";
  base02 = "#475258";
  base03 = "#859289";
  base04 = "#9da9a0";
  base05 = "#d3c6aa";
  base06 = "#e6e2cc";
  base07 = "#fdf6e3";
  base08 = "#e67e80";
  base09 = "#e69875";
  base0A = "#dbbc7f";
  base0B = "#a7c080";
  base0C = "#83c092";
  base0D = "#7fbbb3";
  base0E = "#d699b6";
  base0F = "#9da9a0";

  colors = {
    bg0 = lib.mkForce (rgb base00);
    bg1 = lib.mkForce (rgb base01);
    bg2 = lib.mkForce (rgb base02);
    grey1 = lib.mkForce (rgb base03);
    grey2 = lib.mkForce (rgb base04);
    fg = lib.mkForce (rgb base05);
    red = lib.mkForce (rgb base08);
    orange = lib.mkForce (rgb base09);
    yellow = lib.mkForce (rgb base0A);
    green = lib.mkForce (rgb base0B);
    aqua = lib.mkForce (rgb base0C);
    blue = lib.mkForce (rgb base0D);
    purple = lib.mkForce (rgb base0E);

    bg0-hex = hex base00;
    bg1-hex = hex base01;
    bg2-hex = hex base02;
    grey1-hex = hex base03;
    grey2-hex = hex base04;
    fg-hex = hex base05;
    red-hex = hex base08;
    orange-hex = hex base09;
    yellow-hex = hex base0A;
    green-hex = hex base0B;
    aqua-hex = hex base0C;
    blue-hex = hex base0D;
    purple-hex = hex base0E;

    accent = lib.mkForce (rgb base0B);
    accent-hex = hex base0B;
  };
in
  with colors; {
    programs.yazi.theme = {
      manager = {
        cwd = {
          fg = accent-hex;
        };

        hovered = {
          bg = bg2-hex;
          bold = true;
          reversed = false;
        };

        find_keyword = {
          fg = accent-hex;
          bold = true;
          italic = false;
          underline = false;
        };
        find_position = {
          fg = red-hex;
          bold = true;
          italic = false;
        };

        marker_marked = {
          fg = grey1-hex;
          bg = grey1-hex;
        };
        marker_selected = {
          fg = grey2-hex;
          bg = grey2-hex;
        };
        marker_copied = {
          fg = accent-hex;
          bg = accent-hex;
        };
        marker_cut = {
          fg = red-hex;
          bg = red-hex;
        };

        tab_active = {
          fg = fg-hex;
          bg = bg1-hex;
          bold = true;
          reversed = false;
        };
        tab_inactive = {
          fg = grey1-hex;
          bg = bg1-hex;
        };

        count_copied = {
          fg = bg0-hex;
          bg = accent-hex;
        };
        count_cut = {
          fg = bg0-hex;
          bg = red-hex;
        };
        count_selected = {
          fg = bg0-hex;
          bg = grey2-hex;
        };

        border_style = {fg = grey1-hex;};
      };

      mode = {
        normal_main = {
          fg = bg0-hex;
          bg = accent-hex;
          bold = true;
        };
        normal_alt = {
          fg = grey1-hex;
          bg = bg1-hex;
        };

        select_main = {
          fg = bg0-hex;
          bg = red-hex;
          bold = true;
        };
        select_alt = {
          fg = grey1-hex;
          bg = bg1-hex;
        };
        unset_main = {
          fg = bg0-hex;
          bg = purple-hex;
          bold = true;
        };
        unset_alt = {
          fg = grey1-hex;
          bg = bg1-hex;
        };
      };

      status = {
        perm_type = {fg = blue-hex;};
        perm_read = {fg = yellow-hex;};
        perm_write = {fg = red-hex;};
        perm_exec = {fg = green-hex;};
        perm_sep = {fg = grey1-hex;};

        progress_label = {
          fg = bg0-hex;
          bold = true;
        };
        progress_normal = {
          fg = accent-hex;
          bg = bg0-hex;
        };
        progress_error = {
          fg = red-hex;
          bg = bg0-hex;
        };
      };

      confirm = {
        border = {
          fg = grey1-hex;
        };
        title = {
          fg = grey1-hex;
        };
        btn_yes = {
          fg = bg0-hex;
          bg = green-hex;
        };
        btn_no = {
          fg = bg0-hex;
          bg = red-hex;
        };
      };

      input = {
        border = {
          fg = accent-hex;
        };
        title = {
          fg = accent-hex;
        };
        selected = {
          bg = bg2-hex;
        };
      };
    };
  }
