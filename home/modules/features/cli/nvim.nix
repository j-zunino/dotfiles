{
    lib,
    inputs,
    config,
    ...
}: {
    config = lib.mkIf config.features.cli.nvim {
        programs.neovim.enable = true;
        xdg.configFile.nvim.source = ../../nvim;
        nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    };
}
