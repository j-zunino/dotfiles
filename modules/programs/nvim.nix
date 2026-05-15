{...}: {
    flake.modules.homeManager.nvim = {
        config,
        pkgs,
        ...
    }: {
        programs.neovim = {
            enable = true;
            sideloadInitLua = true; # NOTE: Prevents "Error installing file outside $HOME"
        };

        xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/programs/nvim";

        home.packages = with pkgs; [
            lua52Packages.tree-sitter-cli
            luarocks
            websocat
        ];
    };
}
