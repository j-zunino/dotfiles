# TODO: Update cursor colors

{...}: {
  flake.modules.homeManager.terminal = {
    programs.foot = {
      enable = true;
      settings = {
        main = {pad = "14x14";};
        mouse.hide-when-typing = "yes";
      };
    };
  };
}
