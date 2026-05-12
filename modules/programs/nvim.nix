{inputs, ...}: {
    flake.modules.homeManager.nvim = {pkgs, ...}: {
        programs.neovim.enable = true;
        nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
        # TODO: Make user and path? dynamic
        home = {
            # TODO: FIX: read-only file system
            file = {
                ".config/nvim" = {
                    source = ./nvim;
                };
            };

            packages = with pkgs; [
                lua52Packages.tree-sitter-cli
                luarocks
                websocat
            ];
        };
    };
}
