{...}: {
    flake.modules.homeManager.direnv = {
        programs.direnv = {
            enable = true;
            enableZshIntegration = true;
            silent = true;
            nix-direnv.enable = true;
        };
    };

    flake.modules.homeManager.zsh = {
        programs.direnv.enableZshIntegration = true;
    };
}
