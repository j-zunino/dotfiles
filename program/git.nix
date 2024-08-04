{ config, ... }

{
  programs = {
    git = {
      enable = true;
      userName = "j-zunino";
      userEmail = "zuninojuanbautista@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
