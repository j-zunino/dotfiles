{...}: {
  programs = {
    git = {
      enable = true;
      userName = "j-zunino";
      userEmail = "zuninojuanbautista@gmail.com";
      delta.enable = true;
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    lazygit = {
      enable = true;
      settings = {
        gui = {
          border = "single";
        };

        git = {
          paging = {
            colorArg = "always";
            pager = "delta --dark --paging=never";
          };
        };
      };
    };
  };
}
