{inputs, ...}: {
    programs.neovim.enable = true;
    xdg.configFile.nvim.source = ./nvim;
    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
