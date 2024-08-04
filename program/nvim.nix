{ config, ... }:

{
  programs.neovim.enable = true;
  xdg.configFile.nvim.source = ../editor/nvim;
}
