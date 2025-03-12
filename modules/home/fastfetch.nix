{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_old_small";
        padding = {
          left = 2;
          right = 4;
          top = 1;
          bottom = 1;
        };
      };

      display = {
        size = {
          binaryPrefix = "si";
        };
        color = "green";
        separator = " ";
      };

      modules = [
        {
          type = "custom";
          format = "";
        }
        {
          type = "os";
          key = " ";
          format = "{3}";
        }
        {
          type = "kernel";
          key = " ";
        }
        {
          type = "shell";
          key = " ";
          format = "{6}";
        }
        {
          type = "packages";
          key = " ";
          format = "{9} (sys) - {10} (usr)";
        }
        {
          type = "memory";
          key = " ";
          format = "{1} - {2}";
        }
        {
          type = "disk";
          key = " ";
          format = "{1} - {2}";
        }
        {
          type = "battery";
          key = " ";
        }
        {
          type = "custom";
          format = "";
        }
        {
          type = "colors";
        }
        {
          type = "custom";
          format = "";
        }
      ];
    };
  };
}
