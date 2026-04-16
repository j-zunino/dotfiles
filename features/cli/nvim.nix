{
    lib,
    inputs,
    config,
    ...
}: {
    config = lib.mkIf config.features.cli.nvim {
        programs.neovim.enable = true;
        nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
        home.file = {
            ".config/nvim" = {
                source = config.lib.file.mkOutOfStoreSymlink "/home/juan/dotfiles/features/cli/nvim";
            };
        };
    };
}
