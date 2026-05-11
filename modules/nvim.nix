{
  inputs,
  config,
  ...
}: {
  flake.modules.homeManager.nvim = {pkgs, ...}: {
    programs.neovim.enable = true;
    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    # TODO: Make user and path? dynamic
    home.file = {
      ".config/nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/juan/dotfiles/modules/nvim";
      };
    };

    packages = with pkgs; [
      luarocks
      lua52Packages.tree-sitter-cli
    ];
  };
}
