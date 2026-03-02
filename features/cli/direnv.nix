{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.cli.direnv {
        programs.direnv = {
            enable = true;
            enableZshIntegration = true;
            silent = true;
            nix-direnv.enable = true;
        };
    };
}
